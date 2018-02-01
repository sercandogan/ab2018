-- DML

-- INSERT
INSERT INTO genel.tb_kutuphane
VALUES(1, 'Milli Kütüphane', 'Ankara', '03128379281');

INSERT INTO genel.tb_kutuphane (id,adi,adres,telefon)
VALUES(2,'Beşiktaş', 'İstanbul','02126565612');

INSERT INTO genel.tb_kutuphane (id,adi,adres,telefon)
VALUES(3,'Alsancak', 'İzmir','02312235467'),
	  (4,'Beşocak', 'Adana', '31232512345');
	 
-- INSERT with subquery	 
INSERT INTO genel.tb_personel (ad,soyad, tel, cinsiyet, tckimlikno,gorevi)
(SELECT ad, soyad, tel, cinsiyet, tckimlikno, 'Personel' FROM genel.tb_uyeler WHERE id = 2);

-- UPDATE
UPDATE genel.tb_personel  SET cinsiyet = TRUE, adres = 'İstanbul' WHERE id = 3;

-- DELETE
DELETE FROM genel.tb_personel WHERE gorevi = 'Personel';

----------------------------