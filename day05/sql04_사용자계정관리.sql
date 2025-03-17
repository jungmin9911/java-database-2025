/* 사용자 생성, 기존 사용자 사용해제, 권한주기 */
-- sysdba 연결
-- HR 계정 잠금해제
ALTER USER HR ACCOUNT UNLOCK;
ALTER USER HR IDENTIFIED BY 12345;
-- HR 테이블 조회 가능
-- sampleuser 테이블은 조회 불가 (권한이 없어서)

-- HR 연결
SELECT *
  FROM employees;

-- PRIVILEGES 권한
-- CREATE SESION - 접속권한
-- CREATE TABLE, ALTER TABLE, DROP ANY TABLE, ...
-- 권한은 하나하나 다 부여해야함

/*
-- 다시 sysdba 연결
-- scott 계정 잠금해제
ALTER USER scott ACCOUNT UNLOCK;

-- scott은 create session 권한없음. login denied
-- scott에서 접속권한 부여
GRANT CREATE SESSION TO scott;

scott이 없어서 일단 보류
*/

SELECT * FROM JOBS;

CREATE VIEW JOBS_VIEW
AS
	SELECT *
	  FROM JOBS;

-- hr계정에 어떤 권한이 있는지 조회
SELECT *
  FROM USER_TAB_PRIVS;

-- HR로 테이블 생성
CREATE TABLE TEST(
	id NUMBER PRIMARY KEY,
	name varchar(20) NOT NULL
);

-- Role(역할) 관리
-- 여러 권한을 묶어놓은 개념
-- role 확인
-- CONNECT - DB접속 및 테이블 생성 조회 권한
-- RESOURCE - PL/SQL 사용권한
-- DBA - 모든 시스템 권한
-- EXP_FULL_DATABASE - DB익스포트 권한
-- hr, sysdba, normal 등등에서 돌려보기...
SELECT * FROM user_role_privs;

SELECT * FROM dba_role_privs;

-- HR에게 DBA역할 role 부여
-- HR에서도 SAMPLEUSER 조회 가능
GRANT DBA TO HR;

SELECT * FROM MEMBER;

-- HR에게 DBA역할 권한 해제
REVOKE DBA FROM	HR;

COMMIT;