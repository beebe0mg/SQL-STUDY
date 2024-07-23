USE market_db;
-- SELECT mem_id, mem_name, addr FROM member;

-- CREATE VIEW v_member
-- AS
--	SELECT mem_id, mem_name, addr FROM member;

-- SELECT * FROM v_member;

-- SELECT mem_name, addr FROM V_member
--	WHERE addr IN ('서울', '경기');

-- ALTER VIEW v_viewtest1
-- AS
-- 	SELECT B.mem_id '회원 아이디', M.mem_name AS '회원 이름',
--     B.prod_name "제품 이름",
-- 		CONCAT(M.phone1, M.phone2) AS "연락처"
-- 	FROM buy B
-- 		INNER JOIN member M
--         ON B.mem_id = M.mem_id;
--         
-- SELECT DISTINCT `회원 아이디`, `회원 이름` FROM v_viewtest1;

-- DROP VIEW v_viewtest1;

CREATE OR REPLACE VIEW v_viewtest2
AS
	SELECT mem_id, mem_name, addr FROM member;
    
DESCRIBE v_viewtest2;
DESCRIBE member;

SHOW CREATE VIEW v_viewtest2;