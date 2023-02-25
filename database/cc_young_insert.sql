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
    REGEXP_REPLACE(title,'^[A-D]([0-9]{1,2})(_([A-Za-z0-9]+))?','\3') question_subnb,
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



SELECT *, "questionTitle" ~ '^[A-Z][0-9]+$'
FROM rawdata.categories
LEFT JOIN


;

