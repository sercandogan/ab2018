-- VIEW


-- vw_uye_hareketleri
SELECT u.ad, 
		u.soyad, 
		CONCAT(p.ad,' ',p.soyad) personel, 
		k.yazar, k.kitap_adi, 
		k.basim_tarihi, 
		uh.islem_tipi, 
		uh.tarih, 
		kt.kitap_tipi
FROM ab2018.tb_uye_hareketleri uh
JOIN genel.tb_uyeler u ON u.id = uh.uye_id
JOIN genel.tb_personel p ON p.id = uh.personel_id
JOIN genel.tb_kitaplar k ON k.id = uh.kitap_id
JOIN genel.tb_kitap_tipi kt ON kt.id = k.kitap_tipi_id;

SELECT * FROM ab2018.vw_uye_hareketler h WHERE h.personel = 'Muhammed ÇELİK';

-- vw_uye_hareket_toplamlar

SELECT u.ad, u.soyad, uh.uye_id, COUNT(*) FROM ab2018.tb_uye_hareketleri uh
JOIN genel.tb_uyeler u ON u.id = uh.uye_id
WHERE uh.islem_tipi = 1
GROUP BY u.ad, u.soyad, uh.uye_id;

SELECT * FROM ab2018.wv_uye_hareket_toplamlar t
WHERE t.adet >= 1540;

-- vw_personel
SELECT * FROM genel.tb_personel;

SELECT p.ad || ' ' || p.soyad "Ad Soyad" FROM genel.vw_personel p; 

-- mvw_personel MATERIALIAZED VIEW

SELECT p.ad || ' ' || p.soyad "Ad Soyad" FROM genel.mvw_personel p; 

-- Example

SELECT * FROM genel.vw_personel -- when
UNION ALL
SELECT * FROM genel.mvw_personel;

REFRESH MATERIALIZED VIEW genel.mvw_personel; -- now mvw_personel materialized view updated.