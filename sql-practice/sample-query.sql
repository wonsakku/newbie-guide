-- 사원 조회(study.person)
SELECT * FROM study.person;

/**
    WHERE문 사용하기
*/
-- 출생연도가 1998년인 사원의 이름, 성별, 출생연도 조회
SELECT name, sex, birth_year FROM study.person WHERE birth_year = '1998';

-- 출생연도가 1998년보다 이전인 사원의 이름, 성별, 출생연도 조회
SELECT name, sex, birth_year FROM study.person WHERE birth_year < '1998';

-- 출생연도가 1998년보다 이전인 사원의 이름, 성별, 출생연도 조회(출생연도 기준으로 오름차순)
SELECT name, sex, birth_year FROM study.person WHERE birth_year < '1998' ORDER BY birth_year;

-- 출생연도가 1998년보다 이전인 사원의 이름, 성별, 출생연도 조회(출생연도 기준으로 내림차순)
SELECT name, sex, birth_year FROM study.person WHERE birth_year < '1998' ORDER BY birth_year DESC;

-- 출생연도가 1996, 1997년인 사원의 이름, 성별, 출생연도 조회
SELECT name, sex, birth_year FROM study.person WHERE birth_year IN ('1997', '1996');

-- 출생연도가 1996, 1997년인 사원의 이름, 성별, 출생연도 조회(출생연도 기준으로 정령)
SELECT name, sex, birth_year FROM study.person WHERE birth_year IN ('1997', '1996') ORDER BY birth_year;

-- 이름에 '우'가 들어가는 사원의 이름, 성별, 출생연도, 생일 조회
SELECT name, sex, birth_year, birth_date FROM study.person WHERE name LIKE '%우%';

-- 이름이 '우X'인 사원의 이름, 성별, 출생연도, 생일 조회
SELECT name, sex, birth_year, birth_date FROM study.person WHERE name LIKE '우%';

-- 이름이 'X우'인 사원의 이름, 성별, 출생연도, 생일 조회
SELECT name, sex, birth_year, birth_date FROM study.person WHERE name LIKE '%우';


/**
    GROUP BY 및 집계함수 사용하기
*/

-- 출생연도별 사원수, 출생연도 조회
SELECT count(birth_year) AS 사원수, birth_year FROM study.person GROUP BY birth_year;

-- 출생연도별 사원수, 출생연도 조회(사원수 기준으로 정렬)
SELECT count(birth_year) AS 사원수, birth_year FROM study.person GROUP BY birth_year ORDER BY 사원수;

-- (출생연도, 성별)별 사원수, 출생연도 조회
SELECT count(birth_year) || '명' AS 사원수, sex, birth_year FROM study.person GROUP BY birth_year, sex;

-- (출생연도, 성별)별 사원수, 출생연도 조회(사원수 기준으로 정렬)
SELECT count(birth_year) || '명' AS 사원수, sex, birth_year FROM study.person GROUP BY birth_year, sex ORDER BY 사원수;


/**
    JOIN 사용하기
*/

-- 사원이름, 생일, 부서명 조회
SELECT p.name, p.birth_date, cc.code_name 
FROM study.person p
LEFT JOIN study.common_code cc
ON p.office_code_id = cc.common_code_id;

-- 사원번호(idx), 사원이름, 성별, 출생연도, 직급 조회
SELECT p.idx, p.name, p.sex, p.birth_year, cc.code_name
FROM study.person p
LEFT JOIN study.common_code cc
ON p.rank_code_id = cc.common_code_id;

-- 사원번호(idx), 사원이름, 성별, 출생연도, 직급 조회 (직급 순으로 정렬)
SELECT p.idx, p.name, p.sex, p.birth_year, cc.code_name
FROM study.person p
LEFT JOIN study.common_code cc
ON p.rank_code_id = cc.common_code_id
ORDER BY p.rank_code_id
;


