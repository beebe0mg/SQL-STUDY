USE market_db;
SELECT *
	FROM buy
    INNER JOIN member
    ON buy.mem_id = member.mem_id
WHERE buy.mem_id = 'GRL';

SELECT *
	FROM buy
    INNER JOIN member
    ON buy.mem_id = member.mem_id;

SELECT buy.mem_id, mem_name, prod_name, addr, CONCAT(phone1, phone2) '연락처'
	FROM buy
    INNER JOIN member
    ON buy.mem_id = member.mem_id;
    
SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, CONCAT(phone1, phone2) '연락처'
	FROM buy B
    INNER JOIN member M
    ON B.mem_id = M.mem_id;
    
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
	FROM member M
    LEFT OUTER JOIN buy B
    ON M.mem_id = B.mem_id
ORDER BY M.mem_id;

SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
	FROM buy B
    RIGHT OUTER JOIN member M
    ON M.mem_id = B.mem_id
ORDER BY M.mem_id;

SELECT DISTINCT M.mem_id, M.mem_name, B.prod_name, M.addr
	FROM member M
    LEFT OUTER JOIN buy B
    ON M.mem_id = B.mem_id
WHERE B.prod_name IS NULL
ORDER BY M.mem_id;

SELECT *
	FROM buy
		CROSS JOIN member;
        
SELECT DISTINCT M.mem_id, M.mem_name, M.addr
	FROM buy B
    INNER JOIN member M
	ON B.mem_id = M.mem_id
    ORDER BY M.mem_id;
    
DROP PROCEDURE IF EXISTS ifProc1;
DELIMITER $$
CREATE PROCEDURE ifProc1()
BEGIN
	IF 100 = 100 THEN
		SELECT '100은 100과 같습니다.';
	END IF;
END $$
DELIMITER ;
CALL ifProc1();

DROP PROCEDURE IF EXISTS ifProc2;
DELIMITER $$
CREATE PROCEDURE ifProc2()
BEGIN
	DECLARE myNum INT;
    SET myNum = 200;
	IF myNum = 100 THEN
		SELECT '100입니다.';
	ELSE 
		SELECT '100이 아닙니다.';
	END IF;
END $$
DELIMITER ;
CALL ifProc2();

DROP PROCEDURE IF EXISTS ifProc3;
DELIMITER $$
CREATE PROCEDURE ifProc3()
BEGIN
	DECLARE debutDate DATE;
    DECLARE curDate DATE;
    DECLARE days INT;
    SELECT debut_date INTO debutDate
		FROM market_db.member
        WHERE mem_id = 'APN';
        
    SET curDate = CURRENT_DATE();
    SET days = DATEDIFF(curDate, debutDate);
    
	IF (days/365) >= 5 THEN
		SELECT CONCAT('데뷔한 지 ', days, '일이나 지났습니다. 핑순이들 축하합니다!');
	ELSE 
		SELECT '데뷔한 지 ' +  days + '일밖에 안 되었네요. 핑순이들 화이팅~';
	END IF;
END $$
DELIMITER ;
CALL ifProc3();

SELECT M.mem_id, M.mem_name, SUM(price*amount) "총구매액",
	CASE
		WHEN (SUM(price*amount) >= 1500) THEN '최우수고객'
        WHEN (SUM(price*amount) >= 1000) THEN '우수고객'
        WHEN (SUM(price*amount) >= 1) THEN '일반고객'
        ELSE '유령고객'
	END "회원등급"
	FROM buy B
		RIGHT OUTER JOIN member M
        ON B.mem_id = M.mem_id
    GROUP BY M.mem_id
    ORDER BY SUM(price*amount) DESC;
    
USE market_db;
PREPARE myQuery FROM 'SELECT * FROM member WHERE mem_id = "BLK"';
EXECUTE myQuery;
deallocate prepare myQuery;

