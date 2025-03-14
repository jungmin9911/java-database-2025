/* 제약조건 (잘못된 데이터가 들어가지 않도록 막는 기능) */
-- 제약조건 다섯가지 모두 사용한 테이블 생성 쿼리
CREATE TABLE new_emp(
	idx NUMBER PRIMARY KEY,
	name VARCHAR2(20) NOT NULL,
	jumin VARCHAR2(14) NOT NULL UNIQUE,
	loc_code NUMBER(1) CHECK (loc_code > 0 AND loc_code < 5)
);