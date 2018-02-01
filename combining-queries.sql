-- UNION

SELECT * FROM ab2018.tb_uye_hareketleri uh WHERE uh.uye_id = 15
UNION
SELECT * FROM ab2018.tb_uye_hareketleri uh WHERE uh.uye_id = 32;

-- UNION ALL
SELECT u.ad, u.soyad, k.yazar, k.kitap_adi FROM ab2018.tb_uye_hareketleri uh
JOIN genel.tb_uyeler u ON u.id = uh.uye_id
JOIN genel.tb_kitaplar k ON k.id = uh.kitap_id
WHERE uh.uye_id = 3 AND 
uh.tarih BETWEEN '2015-01-01' AND '2015-12-31'
UNION ALL
SELECT u.ad, u.soyad, k.yazar, k.kitap_adi FROM ab2018.tb_uye_hareketleri uh
JOIN genel.tb_uyeler u ON u.id = uh.uye_id
JOIN genel.tb_kitaplar k ON k.id = uh.kitap_id
WHERE uh.uye_id = 7 AND 
uh.tarih BETWEEN '2015-01-01' AND '2015-12-31';

-- INTERSECT

SELECT u.ad, u.soyad, k.yazar, k.kitap_adi FROM ab2018.tb_uye_hareketleri uh
JOIN genel.tb_uyeler u ON u.id = uh.uye_id
JOIN genel.tb_kitaplar k ON k.id = uh.kitap_id
WHERE uh.uye_id = 3 AND 
uh.tarih BETWEEN '2015-01-01' AND '2015-12-31'
INTERSECT
SELECT u.ad, u.soyad, k.yazar, k.kitap_adi FROM ab2018.tb_uye_hareketleri uh
JOIN genel.tb_uyeler u ON u.id = uh.uye_id
JOIN genel.tb_kitaplar k ON k.id = uh.kitap_id
WHERE uh.uye_id = 7 AND 
uh.tarih BETWEEN '2015-01-01' AND '2015-12-31';

-- EXCEPT

SELECT u.ad, u.soyad, k.yazar, k.kitap_adi FROM ab2018.tb_uye_hareketleri uh
JOIN genel.tb_uyeler u ON u.id = uh.uye_id
JOIN genel.tb_kitaplar k ON k.id = uh.kitap_id
WHERE uh.uye_id = 3 AND 
uh.tarih BETWEEN '2015-01-01' AND '2015-12-31'
EXCEPT
SELECT u.ad, u.soyad, k.yazar, k.kitap_adi FROM ab2018.tb_uye_hareketleri uh
JOIN genel.tb_uyeler u ON u.id = uh.uye_id
JOIN genel.tb_kitaplar k ON k.id = uh.kitap_id
WHERE uh.uye_id = 7 AND 
uh.tarih BETWEEN '2015-01-01' AND '2015-12-31';