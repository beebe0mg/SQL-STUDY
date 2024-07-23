USE market_db;
-- SELECT mem_id, mem_name, addr FROM member;

-- CREATE VIEW v_member
-- AS
--	SELECT mem_id, mem_name, addr FROM member;

-- SELECT * FROM v_member;

-- SELECT mem_name, addr FROM V_member
--	WHERE addr IN ('서울', '경기');

CREATE VIEW v_viewtest1
AS
	SELECT B.mem_id 'Member ID', M.mem_name AS 'Member Name',
    B.prod_name "Product Name",
		CONCAT(M.phone1, M.phone2) AS "Office Phone"
	FROM buy B
		INNER JOIN member M
        ON B.mem_id = M.mem_id;
        
SELECT DISTINCT `Member ID`, `Member Name` FROM v_viewtest1;