-- PROCEDURE
-- 부서번호가 30번인 사람들의 job을 MANAGER로 변경하는 프로시저
-- SELECT * FROM emp;
CREATE OR REPLACE PROCEDURE UPDATE_30
IS
BEGIN
	UPDATE emp SET
		   job = 'MANAGER'
	 WHERE deptno = 30;
END;
/

SELECT * FROM emp;

-- 프로시저 실행
CALL update_30;

-- 프로시저 실행
CALL UP_SAL(7900);

COMMIT; 
-- 이건 안 되는데 일단 저장;;