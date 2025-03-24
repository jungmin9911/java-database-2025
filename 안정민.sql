-- 1. 회원 테이블에서 이메일, 모바일, 이름, 주소 순으로 나오도록 검색하시오.
-- (결과는 아래와 동일하게 나와야 하며, 전체 행의 개수는 23개입니다)
SELECT email, mobile, names, addr
  FROM MEMBERTBL;

-- 2. 함수를 사용하여 아래와 같은 결과가 나오도록 쿼리를 작성하시오.
-- (전체 행의 개수는 59개입니다)
SELECT names AS "도서명"
	 , author AS "저자"
	 , ISBN
	 , price AS "정가"
  FROM BOOKSTBL
 ORDER BY ISBN ASC;

-- 3. 다음과 같은 결과가 나오도록 SQL 문을 작성하시오.
-- (책을 한번도 빌린적이 없는 회원을 뜻합니다. 11명이 나옵니다.)
SELECT m.names AS "비대여자명"
	 , m.levels AS "등급"
	 , m.addr AS "주소"
	 , r.rentaldate AS "대여일"
  FROM membertbl m, rentaltbl r
 WHERE m.idx = r.memberidx(+)
   AND r.rentaldate IS NULL
 ORDER BY m.levels ASC;

-- 4. 다음과 같은 결과가 나오도록 SQL 문을 작성하시오.(총 7건)
SELECT nvl(d.NAMES, '--합계--') AS "장르"
	 , to_char(sum(b.PRICE), '99,999,999') || '원' AS "총합계금액"
  FROM DIVTBL d, BOOKSTBL b
 WHERE d.DIVISION = b.DIVISION
 GROUP BY ROLLUP(d.names)
 ORDER BY d.names ASC;

COMMIT;