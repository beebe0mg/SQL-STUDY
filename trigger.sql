-- USE market_db;
-- CREATE TABLE IF NOT EXISTS trigger_table (id INT, txt VARCHAR(10));
-- INSERT INTO trigger_table VALUES(1, '레드벨벳');
-- INSERT INTO trigger_table VALUES(2, '잇지');
-- INSERT INTO trigger_table VALUES(3, '블랙핑크');

-- DROP TRIGGER IF EXISTS myTrigger;
-- DELIMITER $$
-- CREATE TRIGGER myTrigger
-- 	AFTER DELETE
--     ON trigger_table
--     FOR EACH ROW
-- BEGIN
-- 	SET @msg = '가수 그룹이 삭제됨';		-- 트리거 실행 시 작동되는 코드들
-- END $$
-- DELIMITER ;

-- SET @msg = '';
-- INSERT INTO trigger_table VALUES(4, '마마무');
-- SELECT @msg;
-- UPDATE trigger_table SET txt = '블핑' WHERE id = 3;
-- SELECT @msg;
-- DELETE FROM trigger_table WHERE id = 4;
-- SELECT @msg;

USE market_db;
DROP TABLE IF EXISTS singer;
CREATE TABLE singer (SELECT mem_id, mem_name, mem_number, addr FROM member);

DROP TABLE IF EXISTS backup_singer;
CREATE TABLE backup_singer
( mem_id	CHAR(8) NOT NULL,
  mem_name 	VARCHAR(10) NOT NULL,
  mem_number INT NOT NULL,
  addr		CHAR(2) NOT NULL,
  modType	CHAR(2),	-- 변경된 타입. '수정' 또는 '삭제'
  modDate	DATE,		-- 변경된 날짜
  modUser	VARCHAR(30)	-- 변경한 사용자
);

DROP TRIGGER IF EXISTS singer_updateTrg;
DELIMITER $$
CREATE TRIGGER singer_updateTrg -- 트리거 이름
	AFTER UPDATE	-- 변경 후에 작동하도록 지정
    ON singer	-- 트리거에 부착할 테이블
	FOR EACH ROW
BEGIN
	INSERT INTO backup_singer VALUES ( OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr, '수정', CURDATE(), CURRENT_USER() );
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS singer_deleteTrg;
DELIMITER $$
CREATE TRIGGER singer_deleteTrg -- 트리거 이름
	AFTER DELETE	-- 삭제 후에 작동하도록 지정
    ON singer	-- 트리거에 부착할 테이블
	FOR EACH ROW
BEGIN
	INSERT INTO backup_singer VALUES ( OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr, '삭제', CURDATE(), CURRENT_USER() );
END $$
DELIMITER ;

UPDATE singer SET addr = '영국' WHERE mem_id = 'BLK';
DELETE FROM singer WHERE mem_number >= 7;

SELECT * FROM backup_singer;

