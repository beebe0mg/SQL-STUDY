-- CREATE TABLE member
-- ( mem_id		CHAR(8) NOT NULL PRIMARY KEY,
--   mem_name		VARCHAR(10) NOT NULL,
--   mem_number	INT NOT NULL,
--   addr			CHAR(2) NOT NULL,
--   phone1		CHAR(3),
--   phone2		CHAR(8),
--   height		SMALLINT,
--   debut_table	DATE
-- );

-- CREATE TABLE table1_new (
--     col1 INT PRIMARY KEY,
--     col2 INT ,
--     col3 INT
-- );

-- SHOW INDEX FROM table1_new;

-- CREATE TABLE table2_new (
--     col1 INT PRIMARY KEY,
--     col2 INT UNIQUE,
--     col3 INT UNIQUE
-- );

-- SHOW INDEX FROM table2_new;

USE market_db;
DROP TABLE IF EXISTS buy, member;
CREATE TABLE member
( mem_id	CHAR(8),
  mem_name 	VARCHAR(10),
  mem_number	INT,
  addr		CHAR(2)
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울');
SELECT * FROM member;

ALTER TABLE member
	ADD CONSTRAINT
    PRIMARY KEY (mem_id);
SELECT * FROM member;

ALTER TABLE member DROP PRIMARY KEY;
ALTER TABLE member
	ADD CONSTRAINT
    PRIMARY KEY (mem_name);
SELECT * FROM member;

INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울');
SELECT * FROM member;