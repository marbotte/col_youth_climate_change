
CREATE OR REPLACE VIEW question_answer_table AS(
WITH a AS(
SELECT question_id, array_remove(ARRAY_AGG(is_in),NULL) is_in
FROM
(SELECT DISTINCT question_id,'main.answer_yesno' AS is_in
FROM main.answer_yesno
UNION ALL
SELECT DISTINCT question_id,'main.answer_numeric' AS is_in
FROM main.answer_numeric
UNION ALL
SELECT DISTINCT question_id,'main.answer_freetext' AS is_in
FROM main.answer_freetext
UNION ALL
SELECT DISTINCT question_id,'main.answer_scale' AS is_in
FROM main.answer_scale
UNION ALL
SELECT DISTINCT question_id,'main.answer_cat_uniq' AS is_in
FROM main.answer_cat_uniq
UNION ALL
SELECT DISTINCT question_id,'main.answer_cat_multi' AS is_in
FROM main.answer_cat_multi
UNION ALL
SELECT DISTINCT question_id,'main.answer_subq_yesno' AS is_in
FROM main.answer_subq_yesno
UNION ALL
SELECT DISTINCT question_id,'main.answer_subq_scale' AS is_in
FROM main.answer_subq_scale
UNION ALL
SELECT DISTINCT question_id,'main.answer_subq_cat_uniq' AS is_in
FROM main.answer_subq_cat_uniq
UNION ALL
SELECT DISTINCT question_id,'main.answer_other' AS is_in
FROM main.answer_other
UNION ALL
SELECT DISTINCT question_id,'main.answer_post_treatment' AS is_in
FROM main.answer_post_treatment
) a
GROUP BY question_id)
SELECT question_id,
    module_id || question_nb || CASE WHEN question_subnb IS NOT NULL THEN '_'||question_subnb ELSE '' END question_title,
    array_remove(
    ARRAY[
    CASE
        WHEN nb_subquestion = 1 THEN
            CASE
                WHEN question_type = 'yes/no' THEN 'main.answer_yesno'
                WHEN question_type = 'numeric' THEN 'main.answer_numeric'
                WHEN question_type = 'choice' AND nb_to_pick>1 THEN 'main.answer_cat_multi'
                WHEN question_type = 'choice' AND nb_to_pick=1 THEN 'main.answer_cat_uniq'
                WHEN question_type = 'free text' THEN 'main.answer_freetext'
                WHEN question_type = 'scale' THEN 'main.answer_scale'
            END
        WHEN nb_subquestion >1 THEN
            CASE
                WHEN question_type = 'yes/no' THEN 'main.answer_subq_yesno'
                WHEN question_type = 'numeric' THEN 'main.answer_subq_numeric'
                WHEN question_type = 'choice' AND nb_to_pick>1 THEN 'main.answer_subq_cat_multi'
                WHEN question_type = 'choice' AND nb_to_pick=1 THEN 'main.answer_subq_cat_uniq'
                WHEN question_type = 'free text' THEN 'main.answer_subq_freetext'
                WHEN question_type = 'scale' THEN 'main.answer_subq_scale'
            END
        END,
        CASE
            WHEN other_option THEN 'main.answer_other'
        END,
        CASE
            WHEN post_treatment IS NOT NULL THEN 'main.answer_post_treatment'
        END
        ],
        NULL) should_be_in, is_in
FROM main.question q
LEFT JOIN a USING (question_id)
);

CREATE OR REPLACE VIEW problems_should_be_is_in AS(
WITH a AS(
SELECT question_id,question_title,UNNEST(should_be_in) should_be_in
FROM question_answer_table
),b AS(
SELECT question_id,question_title,UNNEST(is_in) is_in
FROM question_answer_table
)
SELECT COALESCE(a.question_id,b.question_id) question_id, COALESCE(a.question_title,b.question_title),is_in,should_be_in
FROM a
FULL OUTER JOIN b ON a.question_id=b.question_id AND a.question_title=b.question_title AND b.is_in=a.should_be_in
WHERE is_in IS NULL OR should_be_in IS NULL
);

--CREATE VIEW name_columns AS
WITH a AS(
SELECT question_id, question_title,unnest(is_in)  table_name, nb_subquestion, post_treatment, question
FROM question_answer_table qat
LEFT JOIN main.question USING (question_id)
),b AS(
SELECT a.*, subquestion_id, NULL AS post_treatment_id, question_title||'_'||subquestion_id column_name
FROM a
CROSS JOIN LATERAL generate_series(1,a.nb_subquestion) AS subquestion_id
WHERE nb_subquestion>1
UNION ALL
SELECT a.*, NULL AS subquestion_id, post_treatment_id, question_title||'_pt'||post_treatment_id column_name
FROM a
CROSS JOIN LATERAL generate_series(1,a.post_treatment) AS post_treatment_id
WHERE a.table_name='main.answer_post_treatment'
UNION ALL
SELECT a.*, NULL AS subquestion_id, NULL AS post_treatment_id, question_title||'_other' column_name
FROM a
WHERE table_name = 'main.answer_other'
UNION ALL
SELECT a.*, NULL AS subquestion_id, NULL AS post_treatment_id, question_title column_name
FROM a
WHERE a.table_name NOT IN ('main.answer_post_treatment','main.answer_other') AND nb_subquestion=1
)
SELECT table_name, question_id, question_title, column_name, subquestion_id, post_treatment_id, question,
    CASE
        WHEN sq.question_id IS NOT NULL THEN subquestion_lb_es
        WHEN table_name='main.answer_other' THEN 'Otro: ¿cual?'
        ELSE NULL
    END subquestion
FROM b
LEFT JOIN main.subquestions sq USING(question_id,subquestion_id)
ORDER BY REGEXP_REPLACE(column_name,'^[A-E]([0-9]{1,2})(_.*)?$','\1')::int,subquestion_id,column_name
;



SELECT a.*,NULL,
    CASE
