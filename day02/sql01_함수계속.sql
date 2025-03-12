/* 단일행함수 */

SELECT CONCAT('Hello', 'Oracle')  -- 한 행에 한 열만 출력되는 값 = 스칼라(Scalar)값
  FROM dual;

-- SUBSTR(변환할 값, 인덱스, 길이) - 파이썬 substring() 함수와 동일, 자주 쓰임
-- SQL은 인덱스가 1부터 시작. 일반 프로그래밍 언어의 배열이 0부터 시작하는 것과의 차이
-- 인덱스 : 뒤에서부터 위치
-- 전화번호 자를때, 주민번호 자를때 사용
SELECT substr(email, 1, 2)  -- 앞에서 2자리까지
     , substr(email, -2, 2)  -- 뒤에서 2자리
     , email
  FROM employees;

-- INSTR(체크할 문자열, 찾는글자, 시작위치, 몇번째)
SELECT '010-9999-8888'
	 , instr('010-9999-8888', '-', 1, 2)
  FROM dual;

-- LPAD(문자열, 자리수, 채울문자)
-- 2025-11-23
-- 2025-3-12 -> 2025-03-12 이런식으로 자리 맞추는 거
SELECT LPAD('100', 7, '0')	-- 자주 쓰임
	 , RPAD('ABC', 7, '-')
  FROM dual;

-- TRIM() 함수 트리플, 파이썬 strip() 함수와 동일
-- 공백 없애기
-- LTRIM(), RTRIM(), TRIM()
SELECT '<<<' || '     Hello Oracle     ' || '>>>'
	 , '<<<' || ltrim('     Hello Oracle     ') || '>>>'
	 , '<<<' || rtrim('     Hello Oracle     ') || '>>>'
	 , '<<<' || trim('     Hello Oracle     ') || '>>>'  -- 자주 쓰임
  FROM dual;

-- REPLACE(), 파이썬과 동일
SELECT phone_number
	 , replace(phone_number, '123', '786')  -- 자주 쓰임
  FROM employees;

/* 숫자함수 */
-- ROUND() 반올림함수 (파이썬에도 존재)
-- CEIL() 올림함수, FLOOR() 내림함수, TRUNC() 내림함수 소수점
-- MOD() 나누기 나머지값(파이썬 mode(), % 연산과 동일)
-- POWER() 파이썬 math.pow(), power(), 2^10 승수계산 동일
SELECT 786.5427 AS res1
	 , round(786.5427) AS round0  -- 소수점없이
	 , round(786.5427, 1) AS round1  -- 반올림해서 소수점 1자리까지
	 , round(786.5427, 2) AS round2  -- 반올림해서 소수점 2자리까지
	 , ceil(786.5427) AS ceilRes  -- 올림
	 , floor(786.5427) AS floorRes  -- 내림
	 , trunc(786.5427, 3) AS truncRes  -- 반올림 없이 3번째 자리까지 출력
	 , mod(10, 3) AS truncRes 
	 , power(2, 10) AS "2의 10승"
  FROM dual;

/* 날짜함수
 * <나라마다 표현방식 다름>
 * 2025-03-12 아시아...
 * March/12/2025 미국, 캐나다...
 * 12/March/2025 유럽, 인도, 베트남...
 * 포맷팅을 많이 함 */
-- 오늘 날짜
SELECT sysdate AS 오늘날짜 -- GMT기준, +09필요
	-- 날짜 포맷팅 사용되는 YY, YYYY, MM, DD, DAY(요일) 년월일
	-- AM/PM, HH, HH24, MI, SS, W, Q(분기) 시간
	 , TO_CHAR(sysdate, 'YYYY-MM-DD DAY') AS 한국식 -- 'YYYY-MM-DD'로 바꾸면서 왼쪽정렬
	 , TO_CHAR(sysdate, 'AM HH24:MI:SS') AS 시간
	 , TO_CHAR(sysdate, 'MON/DD/YYYY')  AS 미국식
	 , TO_CHAR(sysdate, 'DD/MON/YYYY')  AS 영국식
  FROM dual;

-- ADD_MONTHS() 월을 추가함수
SELECT hire_date
	 , to_char(hire_date, 'yyyy-mm-dd') AS 입사일자
	 , add_months(hire_date, 3) AS 정규직일자
	 , next_day(hire_date, '월') AS 돌아오는월요일  -- 'MON' == '월'
	 , last_day('2025-02-01') AS 달마지막날
  FROM employees;

-- GMT + 9
SELECT to_char(sysdate + INTERVAL '9' HOUR, 'YYYY-MM-DD HH24:MI:SS') AS seoul_time
  FROM dual;

/* 형 변환 함수 */
-- TO_CHAR()
