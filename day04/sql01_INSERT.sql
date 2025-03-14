/* DML 중 SELECT 이외에
 * INSERT, UPDATE, DELETE */
-- INSERT
SELECT *
  FROM new_table;

-- INSERT QUERY 기본
INSERT INTO new_table (NO, name, jumin, birth, salary)
VALUES (1, '홍길동', '900326-1848327', '1990-03-26', 5000);

-- 테이블 컬럼리스트와 동일한 순서, 동일한 값을 넣을때
-- 단, 컬럼리스트와 순서도 다르고, 값리스트 개수도 다르면 컬럼리스트 생략불가
INSERT INTO new_table
VALUES (2, '홍길순', '900326-2848327', '1990-03-26', 5000);

-- 컬럼리스트 순서와 개수가 다를때에는 테이블명 뒤에 요소값을 꼭 적어줘야함
INSERT INTO new_table (jumin, name, no)
VALUES ('900326-2848327', '홍길은', 3);

-- 값이 뭔지 모를때는 NULL로 삽입
INSERT INTO new_table
VALUES (4, '쌍둥일', '900326-2848327', NULL, NULL);

-- 테이블을 만들면서 데이터를 모두 옮기면서 새로운 테이블 생성
-- 단, PK는 복사 불가
CREATE TABLE professor_new
	AS
SELECT * FROM professor;

SELECT * FROM professor_new;

-- 만들어진 테이블에 데이터 한꺼번에 옮기기
INSERT INTO professor_new
SELECT * FROM professor;

-- 새로 만들어진 테이블 professor_new 데이터를 삽입 테스트
INSERT INTO professor_new(profno, name, id, POSITION, pay, hiredate)
VALUES (4008, 'Tom Cruise', 'Cruise', 'instructor', 300, '2025-03-14')

-- PROFESSOR_NEW는 PK가 없기때문에 같은 값이 들어감
INSERT INTO professor_new(profno, name, id, POSITION, pay, hiredate)
VALUES (4008, 'Tom Holland', 'Holland', 'instructor', 310, '2025-03-14');

-- 대량의 데이터를 삽입
INSERT ALL
	INTO new_table VALUES (5, '홍길동', '900326-1848327', '1990-03-26', 5000)
	INTO new_table VALUES (6, '홍길은', '900326-1848327', '1990-03-26', 5000)
	INTO new_table VALUES (7, '홍길금', '900326-1848327', '1990-03-26', 5000)
	INTO new_table VALUES (8, '홍길군', '900326-1848327', '1990-03-26', 5000)
	INTO new_table VALUES (9, '홍길양', '900326-1848327', '1990-03-26', 5000)
SELECT * FROM dual;

SELECT * FROM NEW_TABLE;