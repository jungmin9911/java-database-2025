-- 서브쿼리 대신 부서명 가져오는 함수
CREATE OR REPLACE FUNCTION GET_DNAME
(
--	v_deptno		dept2.dcode%TYPE;
	v_deptno		emp2.deptno%TYPE
) RETURN VARCHAR2
IS
	deptname		dept2.dname%TYPE;
BEGIN
	SELECT dname INTO deptname
	  FROM dept2
	 WHERE dcode = v_deptno;

	RETURN deptname;	-- 꼭 써줘야됨
END GET_DNAME;

-- 실행은 sql10 파일에서