-- madang 로그인
-- 조회
SELECT * FROM Students;

-- 더미데이터 삽입
INSERT INTO STUDENTS(std_id, std_name, std_mobile, std_regyear)  
VALUES (SEQ_STUDENT.nextval, '홍길동', '010-1234-5678', 1997);
INSERT INTO STUDENTS(std_id, std_name, std_mobile, std_regyear)  
VALUES (SEQ_STUDENT.nextval, '홍길순', '010-1234-8765', 2000);

COMMIT;