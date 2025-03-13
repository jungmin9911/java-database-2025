-- sql실습 p.210 
/* 1. emp테이블을 사용하여 사원 중에서 급여(sal)와 보너스(comm)를 합친 금액이 가장 많은 경우와
 * 가장 적은 경우, 평균 금액을 구하세요. 단, 보너스가 없을 경우는 보너스를 0으로 계산하고
 * 출력 금액은 모두 소수점 첫째자리까지만 나오게 하세요 */
SELECT 
    ROUND(MAX(NVL(comm, 0) + sal), 1) AS 최대_급여,
    ROUND(MIN(NVL(comm, 0) + sal), 1) AS 최소_급여,
    ROUND(AVG(NVL(comm, 0) + sal), 1) AS 평균_급여
FROM emp;


/* 2. student 테이블의 birthday 컬럼을 참조해서 아래와 같이 월별로 생일자 수를 출력하세요 */
SELECT birthday 
  FROM student;