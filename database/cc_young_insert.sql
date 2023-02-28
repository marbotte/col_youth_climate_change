INSERT INTO main.module
    VALUES
        ('A','Sociodemográficos'),
        ('B','Lo que piensan y sienten los jovenes'),
        ('C','Cultura política de los jóvenes'),
        ('D','Frente al medio ambiente'),
        ('E','Educación');

INSERT INTO main.mpio(dept,mpio,mpio_syno,the_geom)
SELECT "NAME_1", "NAME_2",STRING_TO_ARRAY("VARNAME_2",'|'),the_geom
FROM rawdata.municipios
ORDER BY "NAME_1","NAME_2";



/* put the region to the municipios which are in the survey*/
WITH mn AS(
SELECT mpio_id,dept,mpio
FROM main.mpio
UNION ALL
SELECT mpio_id,dept,UNNEST(mpio_syno)
FROM main.mpio
), joined_ok AS(
SELECT DISTINCT mpio_id,dept,mpio, INITCAP("Region") AS reg,"Departamento","Municipio"
FROM rawdata.data d
LEFT JOIN mn ON CASE WHEN d."Municipio"='Sauza' THEN 'Suazá' WHEN d."Municipio"= 'Bolívar valle' THEN 'Bolívar' ELSE REGEXP_REPLACE(d."Municipio",',','') END =mn.mpio AND REGEXP_REPLACE(d."Departamento",',','')=mn.dept
)
UPDATE main.mpio m
SET region=jo.reg
FROM joined_ok jo
WHERE m.mpio_id=jo.mpio_id;

INSERT INTO main.question(module_id,question_nb,question_subnb, question, question_type, nb_to_pick, nb_cat, nb_subquestion, other_option, post_treatment)
SELECT
    CASE
        WHEN REGEXP_REPLACE(title,'^[A-D]([0-9]{1,2})(_([A-Za-z0-9]+))?','\1')::INT BETWEEN 1 AND 11 THEN 'A'
        WHEN REGEXP_REPLACE(title,'^[A-D]([0-9]{1,2})(_([A-Za-z0-9]+))?','\1')::INT BETWEEN 12 AND 16 THEN 'B'
        WHEN REGEXP_REPLACE(title,'^[A-D]([0-9]{1,2})(_([A-Za-z0-9]+))?','\1')::INT BETWEEN 17 AND 33 THEN 'C'
        WHEN REGEXP_REPLACE(title,'^[A-D]([0-9]{1,2})(_([A-Za-z0-9]+))?','\1')::INT BETWEEN 34 AND 41 THEN 'D'
        WHEN REGEXP_REPLACE(title,'^[A-D]([0-9]{1,2})(_([A-Za-z0-9]+))?','\1')::INT > 41 THEN 'E'

        ELSE NULL
    END module_id,
    --title,
    REGEXP_REPLACE(title,'^[A-D]([0-9]{1,2})(_([A-Za-z0-9]+))?','\1')::INT question_nb,
    CASE
        WHEN REGEXP_REPLACE(title,'^[A-D]([0-9]{1,2})(_([A-Za-z0-9]+))?','\3')='' THEN NULL
        ELSE REGEXP_REPLACE(title,'^[A-D]([0-9]{1,2})(_([A-Za-z0-9]+))?','\3')
    END question_subnb,
    --"type",
    REGEXP_REPLACE(REGEXP_REPLACE(question, '^[0-9]+\. ',''),'\n',' ','g') question,
    CASE
        WHEN "type" ~ '^Choice' THEN 'choice'
        WHEN "type" ~ '^numeric' THEN 'numeric'
        WHEN "type" ~ '^Yes' THEN 'yes/no'
        WHEN "type" ~ '^Free' THEN 'free text'
        WHEN "type" ~ '^Scale' THEN 'scale'
        ELSE NULL
    END question_type,
    CASE
        WHEN "type" ~ '^Choice' THEN REGEXP_REPLACE("type", '^Choice \(([0-9]{1,2})-[0-9]{1,2}\)$','\1')::int
        ELSE NULL
    END nb_to_pick,
    CASE
        WHEN "type" ~ '^Choice' THEN REGEXP_REPLACE("type", '^Choice \([0-9]{1,2}-([0-9]{1,2})\)$','\1')::int
        WHEN "type" ~ '^Scale' THEN REGEXP_REPLACE("type", '^Scale \(([0-9]{1,2})\)$','\1')::int
        ELSE NULL
    END nb_cat,
    CASE
        WHEN subquestion_nb_rep IS NULL THEN 1
        ELSE subquestion_nb_rep
    END nb_subquestion,
    CASE
        WHEN "type" ~ '^Choice' AND other_option THEN true
        WHEN "type" ~ '^Choice' AND other_option IS NULL THEN false
        ELSE NULL
    END other_option,
    post_treatment

FROM rawdata.main_info
WHERE title ~ '^[A-D][0-9]{1,2}(_[A-Za-z0-9]+)?$'
ORDER BY question_nb, question_subnb
;

INSERT INTO main.basic_info(person_id,mpio_id,zona,ponderador)
WITH mn AS(
SELECT mpio_id,dept,mpio
FROM main.mpio
UNION ALL
SELECT mpio_id,dept,UNNEST(mpio_syno)
FROM main.mpio
)
SELECT "@_id",mpio_id,"Zona","PONDERADOR"
FROM rawdata.data d
LEFT JOIN mn ON CASE WHEN d."Municipio"='Sauza' THEN 'Suazá' WHEN d."Municipio"= 'Bolívar valle' THEN 'Bolívar' ELSE REGEXP_REPLACE(d."Municipio",',','') END =mn.mpio AND REGEXP_REPLACE(d."Departamento",',','')=mn.dept
;


INSERT INTO main.categories (question_id, category_id, category_lb_es)
SELECT q.question_id, number AS category_id, category AS category_lb_es
FROM rawdata.categories c
LEFT JOIN main.question q ON (REGEXP_REPLACE("questionTitle",'^[A-Z]([0-9]+)$','\1')::int = q.question_nb AND q.question_subnb IS NULL)
WHERE
    "questionTitle" ~ '^[A-Z][0-9]+$'
    AND
    q.question_type='choice'
;

INSERT INTO main.subquestions(question_id, subquestion_id, subquestion_lb_es)
SELECT q.question_id, number::int AS subquestion_id, category AS subquestion_lb_es
FROM rawdata.subquestions
LEFT JOIN main.question q ON (REGEXP_REPLACE("questionTitle",'^[A-Z]([0-9]+)$','\1')::int = q.question_nb AND q.question_subnb IS NULL)
WHERE
    "questionTitle" ~ '^[A-Z][0-9]+$'
    AND
    q.nb_subquestion>1
ORDER BY question_id, number::int
;

/* dirty meta-programmation trick:
WITH a AS(
SELECT question_id, question_nb, column_name
FROM main.question q
LEFT JOIN information_schema.columns c ON c.table_schema='rawdata' AND c.table_name='data' AND c.column_name ~ ('^[A-E]'||q.question_nb::text||'_.+$')
WHERE question_type='yes/no' AND nb_subquestion>1
)
SELECT STRING_AGG('SELECT "@_id" person_id, '|| question_id||' question_id, "' || column_name || '" answer FROM rawdata.data', E' UNION ALL\n')
FROM a;

Then I used the result of the query, after checking for each variable which value corresponded to 'Sí'

*/

INSERT INTO main.answer_subq_yesno
WITH a AS(
SELECT "@_id" person_id, 18 question_id, 1 subquestion_id, CASE WHEN "C18_1"=1 THEN true WHEN "C18_1"=2 THEN false ELSE NULL END answer
FROM rawdata.data
UNION ALL
SELECT  "@_id" person_id, 18 question_id, 2 subquestion_id, CASE WHEN "C18_2"=1 THEN true WHEN "C18_2"=2 THEN false ELSE NULL END answer
FROM rawdata.data
UNION ALL
SELECT  "@_id" person_id, 18 question_id, 3 subquestion_id, CASE WHEN "C18_3"=1 THEN true WHEN "C18_3"=2 THEN false ELSE NULL END answer
FROM rawdata.data
UNION ALL
SELECT  "@_id" person_id, 18 question_id, 4 subquestion_id, CASE WHEN "C18_4"=1 THEN true WHEN "C18_4"=2 THEN false ELSE NULL END answer
FROM rawdata.data
UNION ALL
SELECT  "@_id" person_id, 18 question_id, 5 subquestion_id, CASE WHEN "C18_5"=1 THEN true WHEN "C18_5"=2 THEN false ELSE NULL END answer
FROM rawdata.data
UNION ALL
SELECT  "@_id" person_id, 18 question_id, 6 subquestion_id, CASE WHEN "C18_6"=1 THEN true WHEN "C18_6"=2 THEN false ELSE NULL END answer
FROM rawdata.data
UNION ALL
SELECT  "@_id" person_id, 18 question_id, 7 subquestion_id, CASE WHEN "C18_7"=1 THEN true WHEN "C18_7"=2 THEN false ELSE NULL END answer
FROM rawdata.data
UNION ALL
SELECT  "@_id" person_id, 18 question_id, 8 subquestion_id, CASE WHEN "C18_8"=1 THEN true WHEN "C18_8"=2 THEN false ELSE NULL END answer
FROM rawdata.data
UNION ALL
SELECT  "@_id" person_id, 18 question_id, 9 subquestion_id, CASE WHEN "C18_9"=1 THEN true WHEN "C18_9"=2 THEN false ELSE NULL END answer
FROM rawdata.data
UNION ALL
SELECT  "@_id" person_id, 18 question_id, 10 subquestion_id, CASE WHEN "C18_10"=1 THEN true WHEN "C18_10"=2 THEN false ELSE NULL END answer
FROM rawdata.data
UNION ALL
SELECT  "@_id" person_id, 18 question_id, 11 subquestion_id, CASE WHEN "C18_11"=1 THEN true WHEN "C18_11"=2 THEN false ELSE NULL END answer
FROM rawdata.data
UNION ALL
SELECT  "@_id" person_id, 18 question_id, 12 subquestion_id, CASE WHEN "C18_12"=1 THEN true WHEN "C18_12"=2 THEN false ELSE NULL END answer
FROM rawdata.data
)
SELECT *
FROM a
WHERE answer IS NOT NULL;

INSERT INTO main.answer_subq_scale
WITH a AS(
SELECT "@_id" person_id, 15 question_id, 1 subquestion_id,"B15_1" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 15 question_id, 2 subquestion_id,"B15_2" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 15 question_id, 3 subquestion_id,"B15_3" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 15 question_id, 4 subquestion_id,"B15_4" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 15 question_id, 5 subquestion_id,"B15_5" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 15 question_id, 6 subquestion_id,"B15_6" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 36 question_id, 1 subquestion_id,"D34_1" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 36 question_id, 2 subquestion_id,"D34_2" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 36 question_id, 3 subquestion_id,"D34_3" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 36 question_id, 4 subquestion_id,"D34_4" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 36 question_id, 5 subquestion_id,"D34_5" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 36 question_id, 6 subquestion_id,"D34_6" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 36 question_id, 7 subquestion_id,"D34_7" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 36 question_id, 8 subquestion_id,"D34_8" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 36 question_id, 9 subquestion_id,"D34_9" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 36 question_id, 10 subquestion_id,"D34_10" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 37 question_id, 1 subquestion_id,"D34_1" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 37 question_id, 2 subquestion_id,"D35_2" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 37 question_id, 3 subquestion_id,"D35_3" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 37 question_id, 4 subquestion_id,"D35_4" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 37 question_id, 5 subquestion_id,"D35_5" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 37 question_id, 6 subquestion_id,"D35_6" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 37 question_id, 7 subquestion_id,"D35_7" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 37 question_id, 8 subquestion_id,"D35_8" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 37 question_id, 9 subquestion_id,"D35_9" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 37 question_id, 10 subquestion_id,"D35_10" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 37 question_id, 11 subquestion_id,"D35_11" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 37 question_id, 12 subquestion_id,"D35_12" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 37 question_id, 13 subquestion_id,"D35_13" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 37 question_id, 14 subquestion_id,"D35_14" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 40 question_id, 1 subquestion_id,"C38_1" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 40 question_id, 2 subquestion_id,"C38_2" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 40 question_id, 3 subquestion_id,"C38_3" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 40 question_id, 4 subquestion_id,"C38_4" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 40 question_id, 5 subquestion_id,"C38_5" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 40 question_id, 6 subquestion_id,"C38_6" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 40 question_id, 7 subquestion_id,"C38_7" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 40 question_id, 8 subquestion_id,"C38_8" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 40 question_id, 9 subquestion_id,"C38_9" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 40 question_id, 10 subquestion_id,"C38_10" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 41 question_id, 1 subquestion_id,"C39_1" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 41 question_id, 2 subquestion_id,"C39_2" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 41 question_id, 3 subquestion_id,"C39_3" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 41 question_id, 4 subquestion_id,"C39_4" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 41 question_id, 5 subquestion_id,"C39_5" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 41 question_id, 6 subquestion_id,"C39_6" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 41 question_id, 7 subquestion_id,"C39_7" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 41 question_id, 8 subquestion_id,"C39_8" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 41 question_id, 9 subquestion_id,"C39_9" answer
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id, 41 question_id, 10 subquestion_id,"C39_10" answer
FROM rawdata.data
)
SELECT *
FROM a
WHERE answer IS NOT NULL;


/* the following query was obtained, in part, by:
SELECT 'SELECT "@_id" person_id, 17 question_id,' || REGEXP_REPLACE(column_name,'^C17_([0-9]+)$','\1') || ' subquestion_id,"'||column_name|| '" answer FROM rawdata.data UNION ALL' FROM information_schema.columns WHERE column_name ~ '17'
That's a dirty meta-programmation trick but allows to avoid errors...
*/
INSERT INTO main.answer_subq_cat_uniq
WITH a AS(
 SELECT "@_id" person_id, 17 question_id,1 subquestion_id,"C17_1" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,2 subquestion_id,"C17_2" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,3 subquestion_id,"C17_3" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,4 subquestion_id,"C17_4" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,5 subquestion_id,"C17_5" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,6 subquestion_id,"C17_6" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,7 subquestion_id,"C17_7" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,8 subquestion_id,"C17_8" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,9 subquestion_id,"C17_9" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,10 subquestion_id,"C17_10" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,11 subquestion_id,"C17_11" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,12 subquestion_id,"C17_12" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,13 subquestion_id,"C17_13" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,14 subquestion_id,"C17_14" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,15 subquestion_id,"C17_15" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,16 subquestion_id,"C17_16" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,17 subquestion_id,"C17_17" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,18 subquestion_id,"C17_18" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,19 subquestion_id,"C17_19" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,20 subquestion_id,"C17_20" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,21 subquestion_id,"C17_21" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 17 question_id,22 subquestion_id,"C17_22" answer FROM rawdata.data

)
SELECT *
FROM a
WHERE answer IS NOT NULL;

/* Yet another dirty meta-programmation trick:
WITH a AS(
SELECT question_id, question_nb, column_name
FROM main.question q
LEFT JOIN information_schema.columns c ON c.table_schema='rawdata' AND c.table_name='data' AND c.column_name ~ ('^[A-E]'||q.question_nb::text||'$')
WHERE question_type='yes/no' AND nb_subquestion=1
)
SELECT STRING_AGG('SELECT "@_id" person_id, '|| question_id||' question_id, "' || column_name || '" answer FROM rawdata.data', E' UNION ALL\n')
FROM a;

Then I used the result of the query, after checking for each variable which value corresponded to 'Sí'

*/

INSERT INTO main.answer_yesno
WITH a AS(
 SELECT "@_id" person_id, 9 question_id, "A9"=1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 10 question_id, "A10"=1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 19 question_id, "C19" =1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 20 question_id, "C20" =1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 22 question_id, "C22" =1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 23 question_id, "C23" = 1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 24 question_id, "C24" = 1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 25 question_id, "C25" = 1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 27 question_id, "C26"=1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 28 question_id, "C27"=1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 29 question_id, "C28"=1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 30 question_id, "C29"=1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 31 question_id, "C30"=1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 35 question_id, "C33"=1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 44 question_id, "D42"=1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 46 question_id, "D44"=1 answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 48 question_id, "D46"=1 answer FROM rawdata.data
)
SELECT *
FROM a
WHERE answer IS NOT NULL;

/* Yet another dirty meta-programmation trick:
WITH a AS(
SELECT question_id, question_nb, column_name
FROM main.question q
LEFT JOIN information_schema.columns c ON
    c.table_schema='rawdata' AND
    c.table_name='data' AND
    c.column_name ~ ('^[A-E]'||q.question_nb::text||'$')
WHERE question_type='scale' AND nb_subquestion=1
)
SELECT STRING_AGG('SELECT "@_id" person_id, '|| question_id||' question_id, "' || column_name || '" answer FROM rawdata.data', E' UNION ALL\n')
FROM a;
*/

INSERT INTO main.answer_scale
WITH a AS(
SELECT "@_id" person_id, 11 question_id, "A11" answer FROM rawdata.data UNION ALL
SELECT "@_id" person_id, 42 question_id, "C40" answer FROM rawdata.data
)
SELECT *
FROM a
WHERE answer IS NOT NULL;


/* Yet another dirty meta-programmation trick:
WITH a AS(
SELECT question_id, question_nb, column_name
FROM main.question q
LEFT JOIN information_schema.columns c ON
    c.table_schema='rawdata' AND
    c.table_name='data' AND
    c.column_name ~ ('^[A-E]'||q.question_nb::text||'$')
WHERE question_type='choice' AND nb_subquestion=1 AND nb_to_pick=1
)
SELECT STRING_AGG('SELECT "@_id" person_id, '|| question_id||' question_id, "' || column_name || '" answer FROM rawdata.data', E' UNION ALL\n')
FROM a;
*/

INSERT INTO main.answer_cat_uniq
WITH a AS(
 SELECT "@_id" person_id, 1 question_id, "A1" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 3 question_id, "A3" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 4 question_id, "A4" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 5 question_id, "A5" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 6 question_id, "A6" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 7 question_id, "A7" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 8 question_id, "A8" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 21 question_id, "C21" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 43 question_id, "C41" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 45 question_id, "D43" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 47 question_id, "D45" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 52 question_id, "D50" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 53 question_id, "D51" answer FROM rawdata.data
)
SELECT *
FROM a
WHERE answer IS NOT NULL;

/* Yet another dirty meta-programmation trick:
WITH a AS(
SELECT question_id, question_nb, column_name
FROM main.question q
LEFT JOIN information_schema.columns c ON
    c.table_schema='rawdata' AND
    c.table_name='data' AND
    c.column_name ~ ('^[A-E]'||q.question_nb::text||'$')
WHERE question_type='numeric' AND nb_subquestion=1
)
SELECT STRING_AGG('SELECT "@_id" person_id, '|| question_id||' question_id,"' || column_name || '" answer FROM rawdata.data', E' UNION ALL\n')
FROM a;
*/

INSERT INTO main.answer_numeric
SELECT "@_id" person_id, 2 question_id,"A2" answer FROM rawdata.data WHERE "A2" IS NOT NULL


/* Yet another dirty meta-programmation trick:
WITH a AS(
SELECT question_id, question_nb, column_name
FROM main.question q
LEFT JOIN information_schema.columns c ON
    c.table_schema='rawdata' AND
    c.table_name='data' AND
    c.column_name ~ ('^[A-E]'||q.question_nb::text||'$')
WHERE question_type='choice' AND nb_subquestion=1 AND nb_to_pick>1
)
SELECT STRING_AGG('SELECT "@_id" person_id, '|| question_id||' question_id, UNNEST(STRING_TO_ARRAY("' || column_name || '",'' ''))::int answer FROM rawdata.data', E' UNION ALL\n')
FROM a;
*/

INSERT INTO main.answer_cat_multi
WITH a AS(
 SELECT "@_id" person_id, 12 question_id, UNNEST(STRING_TO_ARRAY("B12",' '))::int answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 13 question_id, UNNEST(STRING_TO_ARRAY("B13",' '))::int answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 14 question_id, UNNEST(STRING_TO_ARRAY("B14",' '))::int answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 16 question_id, UNNEST(STRING_TO_ARRAY("B16",' '))::int answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 33 question_id, UNNEST(STRING_TO_ARRAY("C32",' '))::int answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 38 question_id, UNNEST(STRING_TO_ARRAY("C36",' '))::int answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 39 question_id, UNNEST(STRING_TO_ARRAY("C37",' '))::int answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 49 question_id, UNNEST(STRING_TO_ARRAY("D47",' '))::int answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 50 question_id, UNNEST(STRING_TO_ARRAY("D48",' '))::int answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 51 question_id, UNNEST(STRING_TO_ARRAY("D49",' '))::int answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 54 question_id, UNNEST(STRING_TO_ARRAY("D52",' '))::int answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 55 question_id, UNNEST(STRING_TO_ARRAY("D53",' '))::int answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 56 question_id, UNNEST(STRING_TO_ARRAY("D54",' '))::int answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 57 question_id, UNNEST(STRING_TO_ARRAY("D55",' '))::int answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 58 question_id, UNNEST(STRING_TO_ARRAY("D56",' '))::int answer FROM rawdata.data
)
SELECT *
FROM a
WHERE answer IS NOT NULL;

/* Yet another dirty meta-programmation trick:
WITH a AS(
(SELECT question_id, question_nb, column_name
FROM main.question q
LEFT JOIN information_schema.columns c ON
    c.table_schema='rawdata' AND
    c.table_name='data' AND
    c.column_name ~ ('^[A-E]'||q.question_nb::text||'$')
WHERE question_type='free text' AND nb_subquestion=1 AND question_subnb IS NULL
)
UNION ALL
(
SELECT question_id, question_nb, column_name
FROM main.question q
LEFT JOIN information_schema.columns c ON
    c.table_schema='rawdata' AND
    c.table_name='data' AND
    c.column_name ~ ('^[A-E]'||q.question_nb::text||'_.+$')
WHERE question_type='free text' AND nb_subquestion=1 AND question_subnb IS NOT NULL
)
)
SELECT STRING_AGG('SELECT "@_id" person_id, '|| question_id||' question_id, "' || column_name || '" answer FROM rawdata.data', E' UNION ALL\n')
FROM a;

*/

INSERT INTO main.answer_freetext
WITH a AS(
 SELECT "@_id" person_id, 32 question_id, "C31" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 26 question_id, "C26_Otro" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 34 question_id, "C33_1" answer FROM rawdata.data
)
SELECT *
FROM a
WHERE answer IS NOT NULL AND answer !=''
;

/* Yet another dirty meta-programmation trick:
WITH a AS(
SELECT question_id, question_nb, column_name
FROM main.question q
LEFT JOIN information_schema.columns c ON
    c.table_schema='rawdata' AND
    c.table_name='data' AND
    c.column_name ~ ('^[A-E]'||q.question_nb::text||'_Otro$')
WHERE other_option
)
SELECT STRING_AGG('SELECT "@_id" person_id, '|| question_id||' question_id, "' || column_name || '" answer FROM rawdata.data', E' UNION ALL\n')
FROM a;
*/

INSERT INTO main.answer_other
WITH a AS(
 SELECT "@_id" person_id, 4 question_id, "A4_Otro" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 12 question_id, "B12_Otro" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 13 question_id, "B13_Otro" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 16 question_id, "B16_Otro" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 33 question_id, "C32_Otro" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 50 question_id, "D48_Otro" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 54 question_id, "D52_Otro" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 55 question_id, "D53_Otro" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 56 question_id, "D54_Otro" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 57 question_id, "D55_Otro" answer FROM rawdata.data UNION ALL
 SELECT "@_id" person_id, 58 question_id, "D56_Otro" answer FROM rawdata.data
)
SELECT *
FROM a
WHERE answer IS NOT NULL;

INSERT INTO main.categories_post_treatment
SELECT question_id, post_treatment_id,category_pt_id::smallint,category_pt_lb_es
FROM rawdata.post_treatment pt
LEFT JOIN main.question q ON q.question_nb=pt.question_nb;

INSERT INTO main.answer_post_treatment
WITH a AS(
SELECT "@_id" person_id,32 question_id, 1 post_treatment_id, "C31_COD1"::smallint category_pt_id
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id,32 question_id, 2 post_treatment_id, "C31_COD2"::smallint category_pt_id
FROM rawdata.data
UNION ALL
SELECT "@_id" person_id,32 question_id, 3 post_treatment_id, "C31_COD3"::smallint category_pt_id
FROM rawdata.data
)
SELECT *
FROM a
WHERE category_pt_id IS NOT NULL
;
