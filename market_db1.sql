USE market_db;
SET @myVar1 = 5 ;
SET @myVar2 = 4.25 ;

SELECT @myVar1 ;
SELECT @myVar1 + @myVar2 ;

SET @txt = '가수 이름 ==> ' ;
SET @height = 166 ;
SELECT @txt , mem_name FROM member WHERE height > @height ;