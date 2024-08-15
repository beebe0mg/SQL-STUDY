USE market_db;
-- DROP PROCEDURE IF EXISTS user_proc;
-- DELIMITER $$
-- CREATE PROCEDURE user_proc()
-- BEGIN
-- 	SELECT * FROM member;
-- END $$
-- DELIMITER ;

-- CALL user_proc();

-- DROP PROCEDURE user_proc;

-- USE market_db;
-- DROP PROCEDURE IF EXISTS user_proc1;
-- DELIMITER $$
-- CREATE PROCEDURE user_proc1(IN userName VARCHAR(10))
-- BEGIN
-- 	SELECT * FROM member WHERE mem_name = userName;
-- END $$
-- DELIMITER ;

-- CALL user_proc1('에이핑크');

-- DROP PROCEDURE IF EXISTS user_proc2;
-- DELIMITER $$
-- CREATE PROCEDURE user_proc2(IN userNumber INT, IN userHeight INT)
-- BEGIN
-- 	SELECT * FROM member WHERE mem_number > userNumber AND height > userHeight;
-- END $$
-- DELIMITER ;

-- CALL user_proc2(6, 165);

-- DROP PROCEDURE IF EXISTS user_proc3;
-- DELIMITER $$
-- CREATE PROCEDURE user_proc3(IN txtValue CHAR(10), OUT outValue INT)
-- BEGIN
-- 	INSERT INTO noTable VALUES(NULL, txtValue);
--     SELECT MAX(id) INTO outValue FROM noTable;
-- END $$
-- DELIMITER ;

-- CREATE TABLE IF NOT EXISTS noTable( id INT AUTO_INCREMENT PRIMARY KEY, txt CHAR(10));

-- CALL user_proc3('테스트1', @myValue);
-- SELECT CONCAT('입력된 ID 값 ==>', @myValue);

-- DROP PROCEDURE IF EXISTS ifelse_proc;
-- DELIMITER $$
-- CREATE PROCEDURE ifelse_proc(
-- 	IN memName VARCHAR(10)
-- )
-- BEGIN
-- 	DECLARE debutYear INT;	-- 변수 선언
--     SELECT YEAR(debut_date) into debutYear FROM member
-- 		WHERE mem_name = memName;
-- 	IF (debutYear >= 2015) THEN
-- 		SELECT '신인 가수네요. 화이팅 하세요.' AS '메시지';
-- 	ELSE
-- 		SELECT '고참 가수네요. 그동안 수고하셨어요.' AS '메시지';
-- 	END IF;
-- END $$
-- DELIMITER ;

-- CALL ifelse_proc('오마이걸');

-- DROP PROCEDURE IF EXISTS while_proc;
-- DELIMITER $$
-- CREATE PROCEDURE while_proc()
-- BEGIN
-- 	DECLARE hap INT;	-- 합계
--     DECLARE num INT;	-- 1부터 100까지 증가
--     SET hap = 0; -- 합계 초기화
--     SET num = 1;

-- 	WHILE (num <= 100) DO 	-- 100까지 반복
-- 		SET hap = hap + num;
-- 		SET num = num + 1;
-- 	END WHILE;
--     SELECT hap AS '1~100 합계';
-- END $$
-- DELIMITER ;

-- CALL while_proc();

DROP PROCEDURE IF EXISTS dynamic_proc;
DELIMITER $$
CREATE PROCEDURE dynamic_proc(
	IN tableName VARCHAR(20)
)
BEGIN
	SET @sqlQuery = CONCAT('SELECT * FROM ', tableName);
    PREPARE myQuery FROM @sqlQuery;
    EXECUTE myQuery;
    DEALLOCATE PREPARE myQuery;
END $$
DELIMITER ;

CALL dynamic_proc('member');