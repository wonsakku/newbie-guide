-- 사용 테이블 : study.person, study.common_code

-- Q1. 사원명, 성별, 출생연도, 생일, 부서명, 직급 조회
 SELECT p.name, 
        p.sex, 
        p.birth_year, 
        p.birth_date, 
        cc.code_name AS 부서명, 
        cc2.code_name AS 직급
FROM study.person p
LEFT JOIN study.common_code cc
ON p.office_code_id = cc.common_code_id
LEFT JOIN study.common_code cc2
ON p.rank_code_id = cc2.common_code_id
;


-- Q2. 부서명, 직급명, 부서별 직급수 조회
SELECT cc.code_name AS 부서명, cc2.code_name AS 직급, count(*) 부서별_직급수 
FROM study.person p
LEFT JOIN study.common_code cc
ON p.office_code_id = cc.common_code_id
LEFT JOIN study.common_code cc2
ON p.rank_code_id = cc2.common_code_id
GROUP BY 부서명, 직급
ORDER BY 부서별_직급수 DESC
;


----------------------------------------------------------------------------
----------------------------------------------------------------------------

-- 사용 테이블 study.student, study.common_code

-- Q3. 학교명, 학교별 학생수 조회
SELECT cc.code_name AS 학교명, count(*) AS 학생수
FROM study.student s
LEFT JOIN study.common_code cc
ON s.school_code_id = cc.common_code_id
GROUP BY cc.code_name
;

--- Q4. 동아고의 학년, 학년별 학생수 조회

SELECT  cc2.code_name AS 학년, count(*) AS 학년별_학생수
FROM study.student s
LEFT JOIN study.common_code cc
ON s.school_code_id = cc.common_code_id
LEFT JOIN study.common_code cc2
ON s.grade_code_id = cc2.common_code_id
WHERE cc.code_name = '동아고'
GROUP BY cc2.code_name
;


SELECT cc.code_name AS 학년, count(*) AS 학년별_학생수
FROM study.student s
LEFT JOIN study.common_code cc 
ON s.grade_code_id = cc.common_code_id
WHERE s.school_code_id = 'S0101'
GROUP BY cc.code_name
;

SELECT cc2.code_name AS 학교명, cc.code_name AS 학년, count(*) AS 학년별_학생수
FROM study.student s
LEFT JOIN study.common_code cc 
ON s.grade_code_id = cc.common_code_id
LEFT JOIN study.common_code cc2
ON s.school_code_id = cc2.common_code_id
WHERE s.school_code_id = 'S0101'
GROUP BY cc.code_name, cc2.code_name
;


-- 과목별 수강생수
SELECT code_name AS 과목명, count(*) || '명' AS 수강생수
FROM study.common_code c
LEFT JOIN study.student_class_map scm
ON c.common_code_id = scm.class_code_id
WHERE common_type_id = 'S03'
GROUP BY code_name
;


-- 학생 '서연'이 수강하고 있는 과목명
SELECT s.name, cc.code_name AS 과목명
FROM study.student s
LEFT JOIN study.student_class_map scm
ON s.idx = scm.student_idx
LEFT JOIN study.common_code cc
ON scm.class_code_id = cc.common_code_id
WHERE s.idx = 19
;


SELECT s.idx, s.name, cc.code_name AS 과목명
FROM study.student s
LEFT JOIN study.student_class_map scm
ON s.idx = scm.student_idx
LEFT JOIN study.common_code cc
ON scm.class_code_id = cc.common_code_id
WHERE s.name = '서연'
;













