
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
                WHEN question_type = 'scale' THEN 'main.answer_scale'
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

/*

--CREATE VIEW
SELECT


)
*/
