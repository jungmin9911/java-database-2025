/* SQL - DML
 * select 기본 */
-- system(normal) 오라클 생성 후 연결 > HR 스키마 연결
-- employees 테이블의 모든 데이터 조회
SELECT * FROM employees;
-- 실행 단축키 Ctrl + Enter

-- 특정 컬럼만 조회
SELECT employee_id, first_name, last_name
  FROM employees;

-- 컬럼명 변경 후 조회
SELECT employee_id AS "직원번호"
	 , first_name AS "이름"
	 , last_name AS "성"
  FROM employees;

-- 중복제거
SELECT DISTINCT job_id
  FROM employees;

-- 컬럼 합치기
-- 이름과 성을 합쳐서 컬럼명은 full_name으로 조회
SELECT first_name || ' ' || last_name AS "full_name"
  FROM employees;

/* 조건절
 * WHERE */
-- 조건에 부합하는 데이터만 조회
-- 데이터 타입이 정수일 경우
-- employees 테이블에서 employee_id가 110인 직원 출력
SELECT *
  FROM employees
 WHERE employee_id = 110;	-- 데이터타입이 문자열이면 따옴표 안에 넣어서

-- 데이터 타입이 문자일 경우
-- employees 테이블에서 first_name이 'John'인 직원 출력
SELECT *
  FROM employees
 WHERE first_name = 'John';

-- 데이터 타입이 문자일 경우
-- employees 테이블에서 hire_date가 '2006-02-12'인 직원 출력
SELECT *
  FROM employees
 WHERE hire_date = '2006-02-12';

-- 조건에 부합하지 않는 데이터만 조회
-- employees 테이블에서 hire_date가 '2006-02-12'이 아닌 직원 출력
SELECT *
  FROM employees
 WHERE hire_date != '2006-02-12';

-- 숫자 범위 조건에 부합하는 데이터 조회
-- 연봉(salary)이 9천 이상, 만오천 이하만 조회
-- BETWEEN ( ) AND ( )
SELECT *
  FROM employees
 WHERE salary BETWEEN 9000 AND 15000;

-- 조건이 여러개인 데이터 조회
-- WHERE 컬럼명 IN (조건)
SELECT *
  FROM employees
 WHERE first_name IN ('John', 'Steven', 'Neena');

SELECT *
  FROM employees
 WHERE first_name = 'John'
 	OR first_name = 'Steven'
 	OR first_name = 'Neena';	-- 위랑 결과 같음
 	
-- NULL 비교
-- 특정 컬럼의 값이 NULL인 것만 조회
SELECT *
  FROM employees
 WHERE commission_pct IS NULL;

-- NULL이 아닌 것만
SELECT *
  FROM employees
 WHERE commission_pct IS NOT NULL;

-- 문자열 조건
-- LIKE
-- % : 0개 이상의 문자와 일치
-- _ : 정확히 1개의 문자와 일치
-- MAN으로 끝나는 문자열
SELECT * 
  FROM employees
 WHERE job_id LIKE '%MAN';
 
-- Ra으로 시작하는 문자열
SELECT * 
  FROM employees
 WHERE last_name LIKE 'Ra%';	-- 대소문자 구분함
 
SELECT *
  FROM employees
 WHERE last_name LIKE 'Ra__'; -- 총 4글자 중 Ra로 시작하는 문자열을 찾아라

SELECT *
 FROM employees
WHERE job_id LIKE '%MAN%'; -- MAN이 들어가는 문자열을 찾아라

-- 조건이 2개일 경우 
-- WHERE ( ) AND ( )
SELECT first_name
     , last_name
     , phone_number
     , hire_date
     , salary
  FROM employees
 WHERE hire_date > '2005-01-01'
   AND salary >= 10000;

/* 정렬
 * ORDER BY [ASC(오름차순)|DESC(내림차순)] */
SELECT *
  FROM employees
 ORDER BY salary ASC;	-- ASC는 생략가능
 
 SELECT *
  FROM employees
 ORDER BY job_id ASC, salary DESC;	

/* 집합 - UNION, UNION ALL, INTERSECT, MINUS */
-- 쿼리문 합쳐서 하나의 퀴리문으로 반드는 집합 연산자 UNION
-- departments에서 departement_id가 50 이하인 부서아이디와 부서명 데이터
-- employees에서 employee_id가 110에서 150 사이인 직원 아이디와 직원명(first_name || last_name)을 출력하시오
SELECT department_id, department_name
  FROM departments
 WHERE department_id <= 50  -- 5행까지는 department_id
 UNION
SELECT employee_id, first_name || last_name AS "full_name"
  FROM employees
 WHERE employee_id BETWEEN 110 AND 150;  -- 6행부터 employee_id

COMMIT;