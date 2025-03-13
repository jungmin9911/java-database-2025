-- sql실습 p.210 
/* 1. emp테이블을 사용하여 사원 중에서 급여(sal)와 보너스(comm)를 합친 금액이 가장 많은 경우와
 * 가장 적은 경우, 평균 금액을 구하세요. 단, 보너스가 없을 경우는 보너스를 0으로 계산하고
 * 출력 금액은 모두 소수점 첫째자리까지만 나오게 하세요 */
SELECT CASE WHEN comm IS NULL THEN 0 ELSE comm
		END AS 보너스
	 , sal
  FROM emp
GROUP BY comm, sal;

/* 2. student 테이블의 birthday 컬럼을 참조해서 아래와 같이 월별로 생일자 수를 출력하세요 */
SELECT CASE TO_CHAR(birthday, 'MM') WHEN '01' THEN count(*) AS "JAN"
  FROM student
GROUP BY TO_CHAR(birthday, 'MM')
ORDER BY TO_CHAR(birthday, 'MM');	

SELECT CASE to_char(birthday, 'MM') WHEN '01' THEN count(*), 0 AS "1월"
	 , CASE to_char(birthday, 'MM') WHEN '02' THEN count(*) ELSE 0 END AS "2월"
	 , CASE to_char(birthday, 'MM') WHEN '03' THEN count(*) ELSE 0 END AS "3월"
	 , CASE to_char(birthday, 'MM') WHEN '04' THEN count(*) ELSE 0 END AS "4월"
	 , CASE to_char(birthday, 'MM') WHEN '05' THEN count(*) ELSE 0 END AS "5월"
	 , CASE to_char(birthday, 'MM') WHEN '06' THEN count(*) ELSE 0 END AS "6월"
	 , CASE to_char(birthday, 'MM') WHEN '07' THEN count(*) ELSE 0 END AS "7월"
	 , CASE to_char(birthday, 'MM') WHEN '08' THEN count(*) ELSE 0 END AS "8월"
	 , CASE to_char(birthday, 'MM') WHEN '09' THEN count(*) ELSE 0 END AS "9월"
	 , CASE to_char(birthday, 'MM') WHEN '10' THEN count(*) ELSE 0 END AS "10월"
	 , CASE to_char(birthday, 'MM') WHEN '11' THEN count(*) ELSE 0 END AS "11월"
	 , CASE to_char(birthday, 'MM') WHEN '12' THEN count(*) ELSE 0 END AS "12월"
  FROM student
GROUP BY to_char(birthday, 'MM')
ORDER BY to_char(birthday, 'MM');

SELECT birthday FROM student;