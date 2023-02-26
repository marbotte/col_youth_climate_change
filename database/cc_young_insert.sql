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
SELECT "@_id" person_id, 37 question_id, 1 subquestion_id,"D35_1" answer
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
