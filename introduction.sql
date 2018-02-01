-- Basic SQL Examples

SELECT kitap_adi, yazar FROM genel.tb_kitaplar WHERE kitap_tipi_id = 4; -- First Example

-- Examples with tb_uyeler table
SELECT u.tckimlikno, u.ad, u.soyad, u.adres
FROM genel.tb_uyeler AS u 
WHERE u.adres = 'İstanbul'
AND u.d_tarihi > '01.01.1990';

-- all names without 'beyza'
SELECT u.tckimlikno, u.ad, u.soyad, u.adres
FROM genel.tb_uyeler AS u 
WHERE u.adres = 'İstanbul'
AND u.d_tarihi > '01.01.1990'
AND u.ad != 'beyza'; 

-- birtdate between 01.01.1995 and 01.01.1996
SELECT u.tckimlikno, u.ad, u.soyad, u.adres
FROM genel.tb_uyeler AS u 
WHERE u.adres = 'İstanbul' AND
u.d_tarihi BETWEEN '01.01.1995' AND '01.01.1996'
AND u.ad <> 'beyza'; 

-- Example about IN function
SELECT u.ad, u.soyad
FROM genel.tb_uyeler AS u
WHERE u.ad IN('beyza','ahmet','Muhammed','AYŞE'); 

-- Order ascending by name 
SELECT u.ad, u.soyad
FROM genel.tb_uyeler AS u
WHERE u.ad IN('beyza','ahmet','Muhammed','AYŞE')
ORDER BY u.ad ASC; 

SELECT u.ad, u.soyad
FROM genel.tb_uyeler AS u
WHERE u.ad IN('beyza','ahmet','Muhammed','AYŞE')
ORDER BY u.ad DESC, u.soyad ASC;

-- Distinct Example
SELECT DISTINCT u.ad
FROM genel.tb_uyeler AS u
WHERE u.ad IN('beyza','ahmet','Muhammed','AYŞE')
ORDER BY u.ad DESC;

-- Count Function with group by
SELECT u.ad, COUNT(u.ad)
FROM genel.tb_uyeler AS u
GROUP BY u.ad
ORDER BY 2 DESC;

-- HAVING 
SELECT u.ad, COUNT(u.ad)
FROM genel.tb_uyeler AS u
GROUP BY u.ad
HAVING COUNT(u.ad) < 2
ORDER BY u.ad;


-- LIMIT AND OFFSET
SELECT  u.ad, u.soyad, u.tckimlikno
FROM genel.tb_uyeler AS u
ORDER BY u.ad
LIMIT 10
OFFSET 5;