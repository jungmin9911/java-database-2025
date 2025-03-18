-- 프로시저 02번 실행코드
CALL update_30();

-- 프로시저 03번 실행코드
CALL up_sal(7369);
CALL up_sal(7900);
-- 확인코드
SELECT * FROM emp WHERE empno = 7900;

-- 프로시저 04번 실행코드
CALL ename_sal(7369);

-- 프로시저 05번 실행코드
-- sql06파일

-- =========================================

-- 프로시저 11번 실행코드
CALL professor_info(1001);

-- 프로시저 12번 실행코드
CALL emp_info(7934);

-- 프로시저 13번 실행코드
-- 커서로 반복하는 프로시저 실행
CALL emp_list();

-- FOR문
DECLARE
	v_sum	NUMBER;
BEGIN
	v_sum := 0;
	FOR i IN 1..10 LOOP
		v_sum := v_sum + i;
	END LOOP;	
	DBMS_OUTPUT.PUT_LINE(v_sum);
END;
/


COMMIT;