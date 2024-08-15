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

DROP PROCEDURE IF EXISTS user_proc3;
DELIMITER $$
CREATE PROCEDURE user_proc3(IN txtValue CHAR(10), OUT outValue INT)
BEGIN
	INSERT INTO noTable VALUES(NULL, txtValue);
    SELECT MAX(id) INTO outValue FROM noTable;
END $$
DELIMITER ;

CREATE TABLE IF NOT EXISTS noTable( id INT AUTO_INCREMENT PRIMARY KEY, txt CHAR(10));

CALL user_proc3('테스트1', @myValue);
SELECT CONCAT('입력된 ID 값 ==>', @myValue);