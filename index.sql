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

-- USE market_db;
-- DROP TABLE IF EXISTS buy, member;
-- CREATE TABLE member
-- ( mem_id	CHAR(8),
--   mem_name 	VARCHAR(10),
--   mem_number	INT,
--   addr		CHAR(2)
-- );

-- INSERT INTO member VALUES('TWC', '트와이스', 9, '서울');
-- INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남');
-- INSERT INTO member VALUES('WMN', '여자친구', 6, '경기');
-- INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울');
-- SELECT * FROM member;

-- ALTER TABLE member
-- 	ADD CONSTRAINT
--     PRIMARY KEY (mem_id);
-- SELECT * FROM member;

-- ALTER TABLE member DROP PRIMARY KEY;
-- ALTER TABLE member
-- 	ADD CONSTRAINT
--     PRIMARY KEY (mem_name);
-- SELECT * FROM member;

-- INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울');
-- SELECT * FROM member;

-- DROP TABLE IF EXISTS member;
-- CREATE TABLE member
-- ( mem_id		CHAR(8),
--   mem_name		VARCHAR(10),
--   mem_number	INT,
--   addr			CHAR(2)
-- );

-- INSERT INTO member VALUES('TWC', '트와이스', 9, '서울');
-- INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남');
-- INSERT INTO member VALUES('WMN', '여자친구', 6, '경기');
-- INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울');
-- SELECT * FROM member;

-- ALTER TABLE member
-- 	ADD CONSTRAINT
-- 	UNIQUE (mem_id);
-- SELECT * FROM member;

-- INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울');
-- SELECT * FROM member;

USE market_db;
DROP TABLE IF EXISTS cluster;
CREATE TABLE cluster
( mem_id	CHAR(8),
  mem_name	VARCHAR(10)
);
INSERT INTO cluster VALUES('TWC', '트와이스');
INSERT INTO cluster VALUES('BLK', '블랙핑크');
INSERT INTO cluster VALUES('WMN', '여자친구');
INSERT INTO cluster VALUES('OMY', '오마이걸');
INSERT INTO cluster VALUES('GRL', '소녀시대');
INSERT INTO cluster VALUES('ITZ', '잇지');
INSERT INTO cluster VALUES('RED', '레드벨벳');
INSERT INTO cluster VALUES('APN', '에이핑크');
INSERT INTO cluster VALUES('SPC', '우주소녀');
INSERT INTO cluster VALUES('MMU', '마마무');
SELECT * FROM cluster;

ALTER TABLE cluster
	ADD CONSTRAINT
    PRIMARY KEY (mem_id);

SELECT * FROM cluster;

USE market_db;
DROP TABLE IF EXISTS second;
CREATE TABLE second
( mem_id	CHAR(8),
  mem_name	VARCHAR(10)
);
INSERT INTO second VALUES('TWC', '트와이스');
INSERT INTO second VALUES('BLK', '블랙핑크');
INSERT INTO second VALUES('WMN', '여자친구');
INSERT INTO second VALUES('OMY', '오마이걸');
INSERT INTO second VALUES('GRL', '소녀시대');
INSERT INTO second VALUES('ITZ', '잇지');
INSERT INTO second VALUES('RED', '레드벨벳');
INSERT INTO second VALUES('APN', '에이핑크');
INSERT INTO second VALUES('SPC', '우주소녀');
INSERT INTO second VALUES('MMU', '마마무');

ALTER TABLE second
	ADD CONSTRAINT
    UNIQUE (mem_id);
SELECT * FROM second;