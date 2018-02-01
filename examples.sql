---- EXAMPLES

-- Example 1
SELECT COUNT(uye_h.uye_id)	FROM ab2018.tb_uye_hareketleri uye_h
JOIN genel.tb_uyeler uye ON uye.id = uye_h.uye_id 
WHERE uye_h.uye_id = 17;

-- Example 2
SELECT uye.ad, k.kitap_adi, uye_h.tarih FROM ab2018.tb_uye_hareketleri uye_h
JOIN genel.tb_uyeler uye ON uye.id = uye_h.uye_id 
JOIN genel.tb_kitaplar k ON k.id = uye_h.kitap_id
WHERE uye_h.uye_id = 17 AND
uye_h.islem_tipi = 1 AND
uye_h.tarih BETWEEN '01.01.2018' AND NOW();

-- Example 3
SELECT h.tarih, u.tckimlikno, u.ad, u.soyad, k.kitap_adi, k.yazar, h.islem_tipi 
FROM ab2018.tb_uye_hareketleri h
JOIN genel.tb_uyeler u ON u.id = h.uye_id
JOIN genel.tb_kitaplar k ON k.id = h.kitap_id 
WHERE h.uye_id = 17 AND
h.islem_tipi = 1 AND
h.tarih >= '2018-01-01';

-- Example 4
-- 2017 yılı içinde, 1'nolu kütüphane'de en çok çalışan personel kimdir?
SELECT p.ad,p.soyad, COUNT(p.ad) FROM ab2018.tb_uye_hareketleri h
JOIN genel.tb_personel p ON p.id = h.personel_id
JOIN genel.tb_kutuphane ktp ON ktp.id = h.kutuphane_id AND h.kutuphane_id = 1
WHERE h.tarih BETWEEN '01.01.2017' AND '01.01.2018'
GROUP BY p.ad,p.soyad;

-- Example 5
-- 2016 ilk çeyreğinde en çok okunan kitap?

SELECT k.kitap_adi, k.yazar, COUNT(*) FROM ab2018.tb_uye_hareketleri h
JOIN genel.tb_kitaplar k ON k.id = h.kitap_id
WHERE h.tarih BETWEEN '2016-01-01' AND '2016-04-01' AND h.islem_tipi = 1
GROUP BY k.kitap_adi, k.yazar
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT * FROM genel.tb_kitaplar k
JOIN (SELECT h.kitap_id, COUNT(*)
		FROM ab2018.tb_uye_hareketleri h
		WHERE h.tarih BETWEEN '2016-01-01' AND '2016-04-01' AND h.islem_tipi = 1
		GROUP BY h.kitap_id
		ORDER BY COUNT(*) DESC LIMIT 1) h1 on h1.kitap_id = k.id;
		
-- Example 6
-- 2016 Yılında, kadın ve erkeklerin aldığı 'dergi' kitap sayısı

SELECT 
CASE WHEN
	u.cinsiyet is TRUE then 'Erkek'
ELSE 
	CASE WHEN
		u.cinsiyet is NOT NULL then 'Kadın'
	END
END, COUNT(*) 
FROM ab2018.tb_uye_hareketleri h
JOIN genel.tb_uyeler u ON u.id = h.uye_id
JOIN genel.tb_kitaplar k ON k.id = h.kitap_id
JOIN genel.tb_kitap_tipi kt ON kt.id = k.kitap_tipi_id AND kt.kitap_tipi = 'Dergi'
WHERE h.tarih BETWEEN '2016-01-01' AND '2017-01-01'
GROUP BY u.cinsiyet;

		
-- Example 7 
--2016 yılında en çok kitap alan kişi 

SELECT * FROM genel.tb_uyeler u
JOIN (SELECT h.uye_id, COUNT(*)
		FROM ab2018.tb_uye_hareketleri h
		WHERE h.tarih BETWEEN '2016-01-01' AND '2017-01-01' AND h.islem_tipi = 1
		GROUP BY h.uye_id
		ORDER BY COUNT(*) DESC LIMIT 1) h1 on h1.uye_id = u.id;

-- Example 8
-- 2015 Yılı içinde Kitap Tipine göre alınan kitap sayısı

SELECT kt.kitap_tipi, COUNT(*) FROM ab2018.tb_uye_hareketleri h
JOIN genel.tb_kitaplar k ON k.id = h.kitap_id
JOIN genel.tb_kitap_tipi kt ON k.kitap_tipi_id = kt.id
WHERE h.tarih BETWEEN '2015-01-01' AND '2015-12-31' AND h.islem_tipi = 1 
GROUP BY kt.kitap_tipi
ORDER BY COUNT(*) DESC;

-- Example 9
-- 2014 Yılı içinde 15'in üzerinde kitap alan üyeler ve üyelerin aldıkları kitaplar

SELECT * FROM genel.tb_uyeler u
JOIN (SELECT h.uye_id, COUNT(*)
		FROM ab2018.tb_uye_hareketleri h
		WHERE h.tarih BETWEEN '2014-01-01' AND '2015-01-01' AND h.islem_tipi = 1
		GROUP BY h.uye_id
		ORDER BY COUNT(*) DESC) h1 on h1.uye_id = u.id WHERE h1.count >= 15;

SELECT u.ad , u.soyad, COUNT(*) FROM ab2018.tb_uye_hareketleri h
JOIN genel.tb_uyeler u ON u.id = h.uye_id
WHERE h.tarih BETWEEN '2014-01-01' AND '2015-01-01' AND h.islem_tipi = 1
GROUP BY u.ad, u.soyad
HAVING COUNT(*) >=15;

-- Example 10
SELECT DISTINCT u.ad, u.soyad FROM ab2018.tb_uye_hareketleri uh
JOIN genel.tb_uyeler u ON u.id = uh.uye_id
WHERE uh.tarih = '2012-11-10';

-- Example 11
SELECT DISTINCT u.ad, u.soyad, u.id FROM ab2018.tb_uye_hareketleri uh
RIGHT JOIN genel.tb_uyeler u ON u.id = uh.uye_id AND uh.tarih = '2012-11-10'
WHERE uh.uye_id IS NULL;




