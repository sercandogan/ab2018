
-- Stored Prodecures and Functions
CREATE OR REPLACE FUNCTION genel.sp_kitap_tipi_infov1(
    IN g_bdate DATE,
    IN g_edate DATE,
    IN g_islem_tipi INTEGER
    )
  RETURNS TABLE (
  	o_kitap_tipi CHARACTER VARYING,
  	o_count BIGINT
  ) AS
$func$
BEGIN
	RETURN QUERY 
	SELECT kt.kitap_tipi, COUNT(*) 
	FROM ab2018.tb_uye_hareketleri h
	JOIN genel.tb_kitaplar k ON k.id = h.kitap_id
	JOIN genel.tb_kitap_tipi kt ON k.kitap_tipi_id = kt.id
	WHERE h.tarih BETWEEN g_bdate AND g_edate AND h.islem_tipi = g_islem_tipi 
	GROUP BY kt.kitap_tipi
	ORDER BY COUNT(*) DESC;
	
	RETURN;
	
END;
$func$
  LANGUAGE plpgsql VOLATILE
  COST 100;

  
SELECT * FROM genel.sp_kitap_tipi_infov1('2016-01-01','2016-03-31',2);