-- 특정부서 최고 급여 리턴 함수
CREATE OR REPLACE FUNCTION MAX_SAL
(
	v_deptno	emp.deptno%TYPE
) 
RETURN NUMBER
IS
	max_sal		emp.sal%TYPE;
BEGIN
	SELECT max(sal) INTO max_sal
	  FROM emp
	 WHERE deptno = v_deptno;

	RETURN max_sal;
END MAX_SAL;

-- 실행은 sql10 파일에서