/* 복수행함수 마무리
 * 24.7.365 - 서버 */
-- GROUP BY
-- 그룹핑시 GROUP BY에 들어가는 컬럼만 SELECT 절에 사용가능
-- WHERE 절은 일반적 조건만 비교, HAVING 집계함수를 조건에 사용할 때
SELECT * FROM EMPLOYEES ORDER BY department_id;
SELECT department_id, sum(salary) FROM employees GROUP BY department_id ORDER BY department_id;

-- 부서ID가 70보다 크거나 같고, 급여합계가 20000보다 크거나 같은 사람의 부서ID와 급여합계를 급여합계의 오름차순으로 구하라 
SELECT department_id
	 , sum(salary)
  FROM employees
 WHERE department_id <= 70
 GROUP BY department_id
HAVING sum(salary) <= 20000
ORDER BY 2 ASC;  -- sum(salary)와2가 동일. (SELECT절 순서)

/* GROUP BY와 함께 쓰이는 집계함수
 * MAX(), MIN(), MEDIAN() - 최대값, 최소값, 중앙값
 * SUM(), AVG() - 합, 평균
 * VARIANCE(), STDDEV(), COUNT() - 분산, 표준편차, 관측값(row)수 */

-- RANK()  -- 1, 2, 3, 4, 5 순서
-- DENSE_RANK()  -- 1, 2, 2, 3 순서
-- ROW_NUMBER()  -- 행번호
-- 전체 employees에서 급여가 높은 사람부터 순위를 매길때
SELECT first_name || ' ' || last_name AS "full_name"
	 , salary
	 , department_id
	 , rank() OVER (ORDER BY salary DESC) AS "RANK"
	 , dense_rank() OVER (ORDER BY salary DESC) AS "DENSE_RANK"  -- 일상에선 DENSE_RANK 더 많이 사용
	 , row_number() OVER (ORDER BY salary DESC) AS "ROW_NUM"
  FROM employees
WHERE salary IS NOT NULL;

-- 부서별(department_id), 급여높은 사람부터 랭킹을 매길때
SELECT first_name || ' ' || last_name AS "full_name"
	 , salary
	 , department_id
	 , rank() OVER (PARTITION BY department_id ORDER BY salary DESC) AS "RANK"
	 , dense_rank() OVER (PARTITION BY department_id ORDER BY salary DESC) AS "DENSE_RANK"  -- 일상에선 DENSE_RANK 더 많이 사용
	 , row_number() OVER (PARTITION BY department_id ORDER BY salary DESC) AS "ROW_NUM"  -- PARTITION BY는 잘 사용 안 함
  FROM employees
WHERE salary IS NOT NULL
ORDER BY department_id;


