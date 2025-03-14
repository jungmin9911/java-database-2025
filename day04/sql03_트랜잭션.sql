/* 트랜잭션, COMMIT, ROLLBACK */
SET TRANSACTION READ WRITE;		-- 안 써도 무방

-- REGIONS 테이블을 REGIONS_NEW 이름으로 복사
CREATE TABLE REGIONS_NEW
	AS
SELECT * FROM REGIONS;

-- 조회
SELECT * FROM REGIONS_NEW;

-- 위 방법 또는 이 방법으로 데이터 삽입
INSERT INTO REGIONS_NEW
SELECT * FROM REGIONS;

-- 조회
SELECT * FROM REGIONS_NEW;

-- 실험용 데이터 삭제
DELETE FROM REGIONS_NEW;

-- 롤백 실행
ROLLBACK;	-- 원상복구, 트랜잭션은 종료안됨
COMMIT;		-- 확정짓고 트랜잭션 종료

-- 조회 (복구되어있어야함)
SELECT * FROM REGIONS_NEW;

-- 실험용 데이터 수정
UPDATE REGIONS_NEW SET
	REGION_NAME = 'North America';

-- 롤백 실행
ROLLBACK;	-- 원상복구, 트랜잭션은 종료안됨
COMMIT;		-- 확정짓고 트랜잭셩 종료

-- 조회 (복구되어있어야함)
SELECT * FROM REGIONS_NEW;