-- sys(sysdba)로 작업
-- madang 스키마, 사용자 생성
CREATE USER madang IDENTIFIED BY madang;

-- 권한 설정
GRANT CONNECT, resource TO madang;

-- madang으로 사용 스키마 변경 (단축키 : Ctrl + 0)

-- 테이블 Student 생성
CREATE TABLE Students(
	std_id 		NUMBER 			PRIMARY KEY,
	std_name	varchar2(100) 	NOT NULL,
	std_mobile 	varchar2(15) 	NULL,
	std_regyear number(4,0)		NOT NULL
);

-- Student용 Sequence 생성
CREATE SEQUENCE SEQ_STUDENT
	INCREMENT BY 1		-- 숫자를 1씩 증가
	START WITH 1;		-- 1부터 숫자가 증가

COMMIT;
-- 사용자를 madang으로 변경

INSERT INTO MADANG.STUDENTS (STD_ID, STD_NAME, STD_MOBILE, STD_REGYEAR)
VALUES(SEQ_STUDENT.NEXTVAL, :v_std_name, :v_std_mobile, :v_std_regyear");

