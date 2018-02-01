----- Random ab2018.tb_uye_hareketleri
INSERT INTO ab2018.tb_uye_hareketleri (tarih, islem_tipi, uye_id, kitap_id, personel_id,kutuphane_id) 
Select 
CURRENT_DATE - (floor(random()*(10000-1+1))::TEXT ||' DAYS')::INTERVAL, 
floor(random()*(2-1+1))+1, 
floor(random()*(32-1+1))+1, 
floor(random()*(66-1+1))+3,
floor(random()*(2-1+1))+1,
floor(random()*(4-1+1))+1 
FROM generate_series(1,90000);
