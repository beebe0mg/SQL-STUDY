USE market_db;
DROP PROCEDURE IF EXISTS user_proc;
DELIMITER $$
CREATE PROCEDURE user_proc()
BEGIN
	SELECT * FROM member;
END $$
DELIMITER ;

CALL user_proc();

DROP PROCEDURE user_proc;

USE market_db;
DROP PROCEDURE IF EXISTS user_proc1;
DELIMITER $$
CREATE PROCEDURE user_proc1(IN userName VARCHAR(10))
BEGIN
	SELECT * FROM member WHERE mem_name = userName;
END $$
DELIMITER ;

CALL user_proc1('에이핑크');

DROP PROCEDURE IF EXISTS user_proc2;
DELIMITER $$
CREATE PROCEDURE user_proc2(IN userNumber INT, IN userHeight INT)
BEGIN
	SELECT * FROM member WHERE mem_number > userNumber AND height > userHeight;
END $$
DELIMITER ;

CALL user_proc2(6, 165);