drop table if exists study.person;
drop table if exists study.student_class_map;
drop table if exists study.student;
drop table if exists study.common_code;

drop sequence if exists study.person_sequence;
drop sequence if exists study.student_sequence;

drop schema if exists study;

create schema study;

create sequence study.person_sequence;
create sequence study.student_sequence;


CREATE TABLE study.person(
    idx INT DEFAULT NEXTVAL('study.person_sequence'),
    name VARCHAR(5) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    birth_year VARCHAR(4) NOT NULL,
    birth_date VARCHAR(4) NOT NULL,
    office_code_id VARCHAR(5) NOT NULL,
    rank_code_id VARCHAR(5) NOT NULL,
    CONSTRAINT person_primary_key PRIMARY KEY("idx")
);



CREATE TABLE study.common_code(
    common_type_id VARCHAR(3) NOT NULL,
    common_code_id VARCHAR(5) NOT NULL UNIQUE,
    code_name VARCHAR(50) NOT NULL
);


CREATE TABLE study.student(
    idx INT DEFAULT NEXTVAL('study.student_sequence'),
    name VARCHAR(5) NOT NULL,
    school_code_id VARCHAR(5) NOT NULL,
    grade_code_id VARCHAR(5) NOT NULL,
    CONSTRAINT student_primary_key PRIMARY KEY("idx")
);




CREATE TABLE study.student_class_map(
    student_idx INT,
    class_code_id VARCHAR(5),
    CONSTRAINT student_class_map_primary_key PRIMARY KEY("student_idx", "class_code_id")
);










