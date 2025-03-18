-- 함수 실행
SELECT max_sal(10) FROM dual;

SELECT * FROM emp
 WHERE deptno = 10;		-- 진짜 최대값이 5000인지 확인

-- 스칼라 서브쿼리
SELECT e.empno, e.name, e.deptno
	 , (SELECT dname FROM dept2 WHERE dcode = e.deptno) AS "부서명"
	 , (SELECT area FROM dept2 WHERE dcode = e.deptno) AS "지역"
  FROM emp2 e;

SELECT 1 FROM dual;		-- 이건 뭐임?

-- 함수로 변경
SELECT e.empno, e.name, e.deptno
	 , get_dname(e.deptno) AS "부서명"	-- sql08 파일
	 , get_area(e.deptno) AS "지역"		-- sql09 파일
  FROM emp2 e;
-- 스칼라 서브쿼리 결과랑 다른 거 없어야함

-- 조인으로 가능
SELECT e.empno, e.name, e.deptno
	 , d.dname, d.area
  FROM emp2 e, dept2 d
 WHERE e.deptno = d.dcode;

COMMIT;