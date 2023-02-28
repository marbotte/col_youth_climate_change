CREATE SCHEMA main;

CREATE TABLE main.module
(
    module_id CHAR(1) PRIMARY KEY,
    module_desc_es TEXT
);


CREATE TABLE main.question
(
    question_id smallserial PRIMARY KEY,
    module_id CHAR(1) REFERENCES main.module(module_id),
    question_nb smallint NOT NULL,
    question_subnb varchar(10),
    question text NOT NULL UNIQUE,
    question_type varchar(10),
    nb_to_pick smallint,
    nb_cat smallint,
    nb_subquestion smallint NOT NULL,
    other_option boolean,
    post_treatment smallint,
    CHECK (question_type IN ('choice','free text','scale','numeric','yes/no')),
    CHECK ((question_type != 'choice') OR (nb_to_pick IS NOT NULL)),
    CHECK ((question_type NOT IN ( 'choice','scale')) OR (nb_cat IS NOT NULL)),
    UNIQUE(question_nb,question_subnb)
);

CREATE TABLE main.mpio
(
    mpio_id smallserial PRIMARY KEY,
    region varchar(20),
    dept text NOT NULL,
    mpio text NOT NULL,
    mpio_syno TEXT[]
);
SELECT AddGeometryColumn ('main','mpio','the_geom',4326,'MULTIPOLYGON',2);

CREATE TABLE main.basic_info
(
    person_id int PRIMARY KEY,
    mpio_id smallint REFERENCES main.mpio (mpio_id),
    zona text,
    ponderador double precision,
    n_cuestionario int
);

CREATE TABLE main.categories
(
    question_id smallint REFERENCES main.question(question_id),
    category_id smallint,
    category_lb_es text,
    PRIMARY KEY(question_id,category_id),
    UNIQUE(question_id,category_lb_es)
);

CREATE TABLE main.subquestions
(
    question_id smallint REFERENCES main.question(question_id),
    subquestion_id smallint,
    subquestion_lb_es text,
    PRIMARY KEY (question_id, subquestion_id),
    UNIQUE(question_id,subquestion_lb_es)
);

CREATE TABLE main.answer_subq_yesno
(
    person_id int REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL,
    subquestion_id smallint NOT NULL,
    answer boolean NOT NULL,
    FOREIGN KEY (question_id, subquestion_id) REFERENCES main.subquestions(question_id, subquestion_id),
    UNIQUE (person_id, question_id, subquestion_id)
);

CREATE TABLE main.answer_subq_scale
(
    person_id int REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL,
    subquestion_id smallint NOT NULL,
    answer smallint NOT NULL,
    FOREIGN KEY (question_id, subquestion_id) REFERENCES main.subquestions(question_id,subquestion_id),
    UNIQUE(person_id, question_id, subquestion_id)
);

CREATE TABLE main.answer_subq_cat_uniq
(
    person_id int REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL,
    subquestion_id smallint NOT NULL,
    category_id smallint NOT NULL,
    FOREIGN KEY (question_id, subquestion_id) REFERENCES main.subquestions (question_id, subquestion_id),
    FOREIGN KEY (question_id, category_id) REFERENCES main.categories (question_id,category_id),
    UNIQUE (person_id, question_id, subquestion_id)
);

CREATE TABLE main.answer_yesno
(
    person_id int REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL REFERENCES main.question(question_id),
    answer boolean NOT NULL,
    UNIQUE(person_id, question_id)
);

CREATE TABLE main.answer_scale
(
    person_id int REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL REFERENCES main.question(question_id),
    answer smallint NOT NULL,
    UNIQUE(person_id, question_id)
);

CREATE TABLE main.answer_numeric
(
    person_id int REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL REFERENCES main.question(question_id),
    answer smallint NOT NULL,
    UNIQUE(person_id, question_id)
);


CREATE TABLE main.answer_freetext
(
    person_id int NOT NULL REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL REFERENCES main.question(question_id),
    answer text NOT NULL,
    UNIQUE(person_id,question_id)
);

CREATE TABLE main.answer_other
(
    person_id int NOT NULL REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL REFERENCES  main.question(question_id),
    answer text,
    UNIQUE(person_id,question_id, answer)
);

CREATE TABLE main.answer_cat_uniq
(
    person_id int NOT NULL REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL,
    category_id smallint NOT NULL,
    FOREIGN KEY (question_id, category_id) REFERENCES main.categories(question_id, category_id),
    UNIQUE (person_id, question_id)
);

CREATE TABLE main.answer_cat_multi
(
    person_id int NOT NULL REFERENCES main.basic_info(person_id),
    question_id smallint REFERENCES main.question(question_id),
    category_id smallint NOT NULL,
    FOREIGN KEY  (question_id,category_id) REFERENCES main.categories (question_id, category_id),
    UNIQUE(person_id,question_id,category_id)
);

CREATE TABLE main.categories_post_treatment
(
    question_id smallint,
    post_treatment_id smallint,
    category_pt_id smallint,
    category_pt_lb_es text NOT NULL,
    PRIMARY KEY(question_id,post_treatment_id,category_pt_id),
    UNIQUE(question_id, post_treatment_id,category_pt_id)
);

CREATE TABLE main.answer_post_treatment
(
    person_id int NOT NULL REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL,
    post_treatment_id smallint NOT NULL,
    category_pt_id smallint NOT NULL,
    FOREIGN KEY (question_id,post_treatment_id,category_pt_id) REFERENCES main.categories_post_treatment (question_id, post_treatment_id, category_pt_id)
);




