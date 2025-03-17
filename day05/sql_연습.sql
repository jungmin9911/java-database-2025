/* 연습문제 p.420 */
-- 1. Professor 테이블과 department 테이블을 조인하여 교수번호와 교수이름, 소속 학과이름을 조회하는 view를 생성하시오
-- 뷰의 이른으 v_prof_dept2로 하세요
SELECT * FROM professor;
SELECT * FROM department;

CREATE OR REPLACE VIEW v_prof_dept2
AS
	SELECT p.profno AS "교수번호"
		 , p.name AS "교수이름"
		 , d.dname AS "학과명"
	  FROM PROFESSOR p, DEPARTMENT d 
	 WHERE p.deptno = d.deptno;

SELECT * FROM v_prof_dept2;

-- 2. Inline View로 아래 그림과 같이 Student 테이블과 department 테이블을 사용하여
-- 학과별로 학생들의 최대 키와 최대 몸무게, 학과 이름을 출력하세요
SELECT * FROM student;
SELECT * FROM department;

SELECT d.dname AS "DNAME"
	 , max(s.height) AS "MAX_HEIGHT"
	 , max(s.weight) AS "MAX_WEIGHT"
  FROM DEPARTMENT d, STUDENT s ;
 
COMMIT;