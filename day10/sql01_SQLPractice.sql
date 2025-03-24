/* 기본 SELECT문 */
-- 문제1. employees 테이블에서 사원번호, 이름(이름 + 성), 급여, 업무, 입사일, 상사의 사원번호로 출력하시오 (107행)
SELECT employee_id AS "사원번호"
	 , first_name || ' ' || last_name AS "이름"
	 , salary AS "급여"
	 , job_id AS "업무"
	 , to_char(hire_date, 'yyyy-MM-dd') AS "입사일"
	 , manager_id AS "상사의 사원번호"
  FROM employees;

-- 문제2. employees 테이블에서 모든 사원의 이름(last_name)과 연봉을 "이름 : 1 year salary = $연봉" 형식으로 출력하고,
-- 컬럼명을 1 year salary로 변경하시오 (107행)
SELECT last_name || ' : 1 year salary = ' || to_char(salary * 12, '$999,999.99') AS "1 Year Salary"
  FROM employees;

-- 문제3. 부서별로 담당하는 업무를 한번씩만 출력하시오 (20행)
SELECT DISTINCT department_id, job_id
  FROM employees;

/* WHERE절, ORDER BY절 */
-- 문제4. employees 테이블에서 급여가 7000~10000달러 이외인 사람의 이름과 성을 급여 오름차순으로 출력하시오 (75행)
SELECT first_name || ' ' || last_name AS "full_name"
	 , salary
  FROM employees
 WHERE salary NOT BETWEEN 7000 AND 10000 -- salary < 7000 OR salary > 10000
 ORDER BY salary ASC;

-- 문제5. 현재 날짜타입을 날짜함수를 통해서 확인하고, 
-- 입사일자가 2003년 5월 20일부터 2004년 5월 20일 사이에 입사한 사원의 이름 (full_name), 사원번호, 고용일자를 출력하시오
-- 단 입사일을 빠른 순으로 정렬하시오 (10행)
SELECT first_name || ' ' || last_name AS "full_name"
	 , employee_id
	 , to_char(hire_date, 'yyyy-mm-dd') AS "hire_date"
  FROM employees
 WHERE hire_date BETWEEN '2003-05-20' AND '2004-05-20'
 ORDER BY hire_date;

/* 단일행 함수와 변환함수 */
-- 문제6. 이번 분기, 60번부터 IT부서가 지대한 공헌을 해서 IT부서 사원 급여를 15.3% 인상하기로 했다.
-- 정수만 반올림하는 보고서를 작성하시오.
-- 출력형식 : 사번, 이름(이름+성), 급여, 인상된 급여(컬럼명 Increased Salary) 출력(5행)
SELECT employee_id
	 , first_name || ' ' || last_name AS "full_name"
	 , salary
	 , round(salary * 1.153) AS "Increased Salary"	
  FROM employees
 WHERE job_id = 'IT_PROG';

-- 문제7. 모든 사원의 연봉을 표시하는 보고서 작성
-- 사원 full_name, 급여, 수당여부에 따라 연봉을 표시하시오 (107행)
-- 수당이 있으면 salary + commission, 없으면 salary only라고 표시
-- 연봉이 높은순으로 정렬 (107행)
SELECT first_name || ' ' || last_name AS "fuii_name"
	 , salary
	 , (salary * 12) + (salary * nvl(commission_pct, 0)) AS "Annual Salary"
	 , CASE WHEN commission_pct IS NULL THEN 'salary_only'
	 		WHEN commission_pct IS NOT NULL THEN 'salary + commission'
			END AS "Commission?"
  FROM employees
 ORDER BY 3 DESC;	-- "Annual Salary" 보다 컬럼순서인 3을 적는 게 훨씬 효율적
 
/* 집계함수 - MIN, MAX, SUM, AVG, COUNT... */
-- 문제8. employees에서 각 사원이 소속된 부서별 급여합계, 급여평균, 급여최대값, 급여최소값 집계
-- 출력형식 : 급여는 여섯자리와 세자리 구분기호, $를 앞에 표시, 부서번호의 오름차순
-- 단, 부서에 소속되지 않은 사원은 제외 (11행)
SELECT department_id
	 , to_char(sum(salary), '$999,999') AS "급여합계"
	 , to_char(AVG(salary), '$999,999') AS "급여평균"
	 , to_char(MAX(salary), '$999,999') AS "급여최대값"
	 , to_char(MIN(salary), '$999,999') AS "급여최소값"
  FROM employees
 WHERE department_id IS NOT NULL
 GROUP BY department_id
 ORDER BY department_id;

/* JOIN */
-- 문제9. employees, departments, locations 테이블 구조파악
-- Oxford에 근무하는 사원 full_name, 업무, 부서명, 도시명을 출력하시오 (34행)
SELECT e.first_name || ' ' || e.last_name AS "full_name"
	 , e.job_id
	 , d.department_name
	 , l.city
  FROM EMPLOYEES e , DEPARTMENTS d , LOCATIONS l 
 WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
   AND d.LOCATION_ID = l.LOCATION_ID 
   AND l.CITY = 'Oxford';

-- 문제10. full_name, 업무, 부서명을 출력하시오. 단, 부서가 없는 직원까지 모두
SELECT e.first_name || ' ' || e.last_name AS "full_name"
	 , e.job_id
	 , d.department_name
  FROM EMPLOYEES e , DEPARTMENTS d 
 WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID(+);	-- (+) : null까지 조회?
 
/* 서브쿼리 */
-- 문제11. Tucker 사원보다 급여를 많이 받는 사원의 full_name, 업무, 급여를 출력(15행)
SELECT first_name || ' ' || last_name AS "full_name"
	 , job_id
	 , salary
  FROM employees
 WHERE salary > (SELECT salary
				  FROM employees
				 WHERE last_name = 'Tucker');

-- 문제12. 부서와 업무별 급여합계를 구하여서 급여수준 레벨을 지정하고자 함
-- 부서/업무별 급여합계 및 각 부서별 총합, 각 부서/업무별 직원수를 출력하시오
SELECT department_id, job_id
	 , to_char(sum(salary), '$99,999') AS "Sum Salary"
	 , count(*) AS "Employees Cnt"
  FROM employees
 GROUP BY ROLLUP (department_id, job_id);
 

COMMIT;


