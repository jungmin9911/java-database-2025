/* VIEW */
-- sysdba로 실행
GRANT CREATE VIEW TO sampleuser;
-- 다시 sampleuser로 연결

--
SELECT * FROM emp2;

-- 뷰생성 DDL (컬럼 6개)
CREATE OR REPLACE VIEW V_emp2
AS
	SELECT empno, name, deptno, tel, POSITION, pempno 
	  FROM emp2;
-- sysdba에서 권한을 주면 생성 됨. 그냥 하면 오류

-- NOT NULL인 dept컬럼 빼고 뷰 수정
CREATE OR REPLACE VIEW V_emp2
AS
	SELECT empno, name, tel, POSITION, pempno 
	  FROM emp2;

-- 뷰 select
SELECT *
  FROM V_emp2;

-- 뷰 insert
INSERT INTO v_emp2 VALUES (20000219, 'Tom Halland', 1004, '051)627-9968', 'IT Programmer', 19960303);

-- 단, 뷰에 속하지 않는 컬럼 중 NOT NULL 조건이 있으면 데이터 삽입 불가
-- deptno 컬럼이 not null인데 뷰에는 존재하지 않아 insert 불가
INSERT INTO v_emp2 VALUES (20000221, 'Zen Daiya', '051)627-9968', 'IT Programmer', 19960303);

COMMIT;

-- CRUD 중 SELECT만 가능하게 만들려면
CREATE OR REPLACE VIEW V_emp2
AS
	SELECT empno, name, deptno, tel, POSITION, pempno 
	  FROM emp2
WITH READ ONLY;

-- 삽입불가 에러발생
INSERT INTO v_emp2 VALUES (2000221, 'Hugo Sung', 1004, '051)627-9768', 'IT Programmer', 19960303);

-- 복합뷰 : 조인 등으로 여러 테이블을 합쳐서 보여주는 뷰
-- 복합뷰는 insert, update, delete(DML) 거의 불가
CREATE OR REPLACE VIEW V_emp3
AS
	SELECT e.empno, e.name, e.deptno, d.dname
	  FROM emp2 e, dept2 d
	 WHERE e.deptno = d.dcode;

-- 조회
SELECT * FROM V_emp3;

COMMIT;