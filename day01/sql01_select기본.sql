/*
 * SQL - DML - SELECT 학습 
 */

-- 01. HR.employees 테이블의 모든 데이터 조회하세요. (107건)
SELECT * -- asterik -> all로 읽음. 모든 컬럼을 다 보여라
  FROM EMPLOYEES; 
-- 실행 단축키 Ctrl + Enter

-- 02. HR.employees 중 employees_id, first_name, last_name, email, hire_date를 출력하라 (107행)
SELECT employee_id, first_name, last_name, email, hire_date 
  FROM EMPLOYEES;

-- 03. 02번의 쿼리를 컬럼명을 변경해서 출력하시오. "직원번호", "이름", "성", "이메일","입사일자"로 변경하시오 (107행)
-- alia 별명
SELECT employee_id AS "직원번호"
	 , first_name AS "이름"
	 , last_name AS "성"
	 , email AS "이메일"
	 , hire_date AS "입사일자"
  FROM employees;

-- 04. employees에서 job_id가 중복되지않게 출력하시오. (19행)
-- distinct - 중복제거, all - 전부
SELECT DISTINCT job_id
  FROM EMPLOYEES;

-- 05. employees 테이블의 이름과 성을 붙여서 full_name으로, phone_number를 출력하시오 (107행)
SELECT first_name || ' ' || last_name AS "full_name"
	 , phone_number
  FROM EMPLOYEES;

SELECT first_name || last_name || phone_number
  FROM EMPLOYEES;

-- 06. employees 테이블 직원들 정보를 아래와 같이 나오도록 출력하시오 (107행)
/* total_info 라는 컬럼으로 이름 변경
 * full_name(employee_id) - job_id[hire_date] / phone_number 하나의 컬럼에 나오도록
 * Steven King(100) - AD_PRES[2003-06-17 00:00:00] / 515.123.4567
 * ...
 */
SELECT first_name || ' ' || last_name || '(' || employee_id || ') - ' 
	|| job_id || '[' || hire_date || '] / ' || phone_number AS "total_info"
  FROM EMPLOYEES;

/*
 * 조건절 - WHERE
 */
-- 연습. employees 테이블에서 employee_id가 110인 직원을 출력하세요 (1행)
SELECT *
  FROM EMPLOYEES
 WHERE employee_id = 110;

SELECT *
  FROM EMPLOYEES
 WHERE first_name = 'John';

-- hire_date가 2006-02-12 인 직원을 출력하시오
SELECT * 
  FROM employees 
 WHERE hire_date='2006-02-12'; -- 날짜타입은 문자열처럼 비교하면 됨
 
-- 데이터타입 숫자형, 문자형, 날짜형 등
/*
 * WHERE절에 사용하는 연산자
 * ● = : equal. 타 프로그래밍 언어와 달리 하나만 써도 같다의 의미
 * ● !=, <> : not equal 같지 않다
 * ● >, >=, <, <= : 크다, 크거나 같다, 작다, 작거나 같다
 * ● BETWEEN a AND b : 특정값이 a이상, b이하에 포함되어있다.
 * ● IN(a, b, c) : 특정값이 a이거나 b이거나 c중 하나임
 * ● LIKE : SQL에서 문자열 비교시 특화된 연산자
 * ● IS NULL, IS NOT NULL : NULL값을 검색할 때, NULL값이 아닌 걸 검색할 때
 * ● a AND b : a와 b 조건을 모두 만족해야 True
 * ● a OR b : a와 b 둘 중 하나라도 만족하면 True
 * ● NOT a : a가 아닌 조건. 반대조건
 */
SELECT *
  FROM employees
 WHERE hire_date != '2006-02-12';

-- BETWEEN은 초과, 미만이 아닌 이상, 이하
SELECT *
  FROM employees
 WHERE salary BETWEEN 9000 AND 15000;
-- and와 >= <= 똑같이 구현가능
SELECT *
  FROM employees
 WHERE salary >= 9000 AND salary <= 15000;

SELECT *
  FROM employees
 WHERE first_name IN ('John', 'Steven', 'Neena');

SELECT *
  FROM employees
 WHERE first_name = 'John' 
    OR first_name = 'Steven' 
    OR first_name = 'Neena';

-- NULL비교
SELECT *
  FROM employees
 WHERE commission_pct = NULL;  -- 안 먹음

SELECT *
  FROM employees
 WHERE commission_pct IS NULL;

SELECT *
  FROM employees
 WHERE commission_pct IS NOT NULL;

-- LIKE 문자열 패턴으로 검색
-- % : 0개 이상의 문자와 일치
-- _ : 정확히 1개의 문자와 일치
SELECT *
  FROM employees
 WHERE job_id LIKE '%MAN'; -- MAN으로 끝나는 패턴을 가진 문자열을 찾아라

SELECT *
  FROM employees
 WHERE last_name LIKE 'Ra%'; -- Ra로 시작하는 패턴을 가진 문자열을 찾아라

SELECT *
  FROM employees
 WHERE last_name LIKE 'Ra__'; -- 총 4글자 중 Ra로 시작하는 문자열을 찾아라

SELECT *
 FROM employees
WHERE job_id LIKE '%MAN%'; -- MAN이 들어가는 문자열을 찾아라
 
-- 07. employees에서 hire_date가 2005-01-01 이후에 입사했고, salary가 10000이상인 직원을 출력하시오
--	   이름과 이메일, 전화번호, 입사일, 급여를 표시
SELECT first_name
     , last_name
     , phone_number
     , hire_date
     , salary
  FROM employees
 WHERE hire_date > '2005-01-01'
   AND salary >= 10000;
 
 /*
  * 정렬 - ORDER BY
  * ASCending - 오름차순
  * DESCending - 내림차순
  */
SELECT *
  FROM employees
ORDER BY salary ASC;

SELECT *
  FROM employees
ORDER BY commission_pct ASC;

SELECT *
  FROM employees
ORDER BY job_id ASC, salary DESC;

/* 집합 - UNION, UNION ALL, INTERSECT, MINUS */
-- SELECT * FROM DEPARTMENTS d
-- departments에서 departement_id가 50 이하인 부서아이디와 부서명 데이터
-- employees에서 employee_id가 110에서 150 사이인 직원 아이디와 직원명(first_name || last_name)을 출력하시오
SELECT department_id, department_name
  FROM departments
 WHERE department_id <= 50  -- 5행까지는 department_id
 UNION
SELECT employee_id, first_name || last_name AS "full_name"
  FROM employees
 WHERE employee_id BETWEEN 110 AND 150;  -- 6행부터 employee_id

