---------------------------------
-- TRANSACTION

WITH t as(
	DELETE FROM tb_t1 WHERE id=1 RETURNING *
)

INSERT INTO tb_t2 SELECT * FROM t;


----------------------------------