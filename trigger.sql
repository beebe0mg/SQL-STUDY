USE market_db;
CREATE TABLE IF NOT EXISTS trigger_table (id INT, txt VARCHAR(10));
INSERT INTO trigger_table VALUES(1, '레드벨벳');
INSERT INTO trigger_table VALUES(2, '잇지');
INSERT INTO trigger_table VALUES(3, '블랙핑크');

DROP TRIGGER IF EXISTS myTrigger;
DELIMITER $$
CREATE TRIGGER myTrigger
	AFTER DELETE
    ON trigger_table
    FOR EACH ROW
BEGIN
	SET @msg = '가수 그룹이 삭제됨';		-- 트리거 실행 시 작동되는 코드들
END $$
DELIMITER ;

SET @msg = '';
INSERT INTO trigger_table VALUES(4, '마마무');
SELECT @msg;
UPDATE trigger_table SET txt = '블핑' WHERE id = 3;
SELECT @msg;
DELETE FROM trigger_table WHERE id = 4;
SELECT @msg;