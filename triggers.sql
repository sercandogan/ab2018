-----------------------------------
-- TRIGGERS



CREATE OR REPLACE FUNCTION ab2018.sp_t_uye_hareketleri_tr()
  RETURNS trigger AS
$BODY$
DECLARE
l_uye_id  INTEGER;
BEGIN
	SELECT k.verilen_uye_id INTO l_uye_id FROM genel.tb_kitaplar k WHERE k.id = new.kitap_id;
	
	IF new.islem_tipi = 1 THEN
		IF l_uye_id IS NOT NULL THEN RAISE EXCEPTION 'Kitap Zaten Uyede'; END IF;
		UPDATE genel.tb_kitaplar k SET verilen_uye_id = new.uye_id
		WHERE id = new.kitap_id;
	END IF;
	
	IF new.islem_tipi = 2 THEN
		IF l_uye_id <> new.uye_id THEN RAISE EXCEPTION 'Kitap başka birinde'; END IF;
		UPDATE genel.tb_kitaplar k SET verilen_uye_id = NULL
		WHERE id = new.kitap_id;
	END IF;
	
RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql;

 
CREATE TRIGGER t_uye_hareketleri_tr
	AFTER INSERT ON ab2018.tb_uye_hareketleri
	FOR EACH ROW
	EXECUTE PROCEDURE ab2018.sp_t_uye_hareketleri_tr();

DROP TRIGGER t_uye_hareketleri_tr ON ab2018.tb_uye_hareketleri;


-------------------------------------------