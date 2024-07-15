USE market_db;
SET @myVar1 = 5 ;
SET @myVar2 = 4.25 ;

SELECT @myVar1 ;
SELECT @myVar1 + @myVar2 ;

SET @txt = '가수 이름 ==> ' ;
SET @height = 166 ;
SELECT @txt , mem_name FROM member WHERE height > @height ;

SET @count = 3;
PREPARE mySQL FROM 'SELECT mem_name, height FROM member ORDER BY height LIMIT ?';
EXECUTE mySQL USING @count;

SELECT AVG(price) AS '평균 가격' FROM buy;

SELECT CAST(AVG(price) AS SIGNED) '평균 가격' FROM buy;
-- 또는
SELECT CONVERT(AVG(price) , SIGNED) '평균 가격' FROM buy;

SELECT CAST('2022$12$12' AS DATE);
SELECT CAST('2022/12/12' AS DATE);
SELECT CAST('2022%12%12' AS DATE);
SELECT CAST('2022@12@12' AS DATE);