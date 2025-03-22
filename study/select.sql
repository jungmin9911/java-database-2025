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
COMMIT;