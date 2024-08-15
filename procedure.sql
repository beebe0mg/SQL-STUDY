-- USE market_db;
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

-- DROP PROCEDURE IF EXISTS dynamic_proc;
-- DELIMITER $$
-- CREATE PROCEDURE dynamic_proc(
-- 	IN tableName VARCHAR(20)
-- )
-- BEGIN
-- 	SET @sqlQuery = CONCAT('SELECT * FROM ', tableName);
--     PREPARE myQuery FROM @sqlQuery;
--     EXECUTE myQuery;
--     DEALLOCATE PREPARE myQuery;
-- END $$
-- DELIMITER ;

-- CALL dynamic_proc('member');

SET GLOBAL log_bin_trust_function_creators = 1;

-- USE market_db;
-- DROP FUNCTION IF EXISTS sumFunc;
-- DELIMITER $$
-- CREATE FUNCTION sumFunc(number1 INT, number2 INT)
-- 	RETURNS INT
-- BEGIN
-- 	RETURN number1 + number2;
-- END $$
-- DELIMITER ;

-- SELECT sumFunc(100, 200) AS '합계';

-- DROP FUNCTION IF EXISTS calcYearFunc;
-- DELIMITER $$
-- CREATE FUNCTION calcYearFunc(dYear INT)
-- 	RETURNS INT
-- BEGIN
-- 	DECLARE runYear INT;	-- 활동 기간(연도)
-- 	SET runYear = YEAR(CURDATE()) - dYear;
-- 	RETURN runYear;
-- END $$
-- DELIMITER ;

-- SELECT calcYearFunc(2010) AS '활동 횟수';

-- SELECT calcYearFunc(2007) INTO @debut2007;
-- SELECT calcYearFunc(2013) INTO @debut2013;
-- SELECT @debut2007-@debut2013 AS '2007과 2013 차이';

-- SELECT mem_id, mem_name, calcYearFunc(YEAR(debut_date)) AS '활동 횟수'
-- 	FROM member;
--     
-- DROP FUNCTION calcYearFunc;

USE market_db;
DROP PROCEDURE IF EXISTS cursor_proc;
DELIMITER $$
CREATE PROCEDURE cursor_proc()
BEGIN
	DECLARE memNumber INT;
	DECLARE cnt INT DEFAULT 0;
	DECLARE totNumber INT DEFAULT 0;
	DECLARE endOfRow BOOLEAN DEFAULT FALSE;

	DECLARE memberCursor CURSOR FOR
		SELECT mem_number FROM member;
    
	DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET endOfRow = TRUE;
    
    OPEN memberCursor;

	cursor_loop: LOOP
		FETCH memberCursor INTO memNumber;
    
		IF endOfRow THEN
			LEAVE cursor_loop;
		END IF;
    
		SET cnt = cnt + 1;
		SET totNumber = totNumber + memNumber;
	END LOOP cursor_loop;

	SELECT (totNumber/cnt) AS '회원의 평균 인원 수';
    
    CLOSE memberCursor;
END $$
DELIMITER ;

CALL cursor_proc();