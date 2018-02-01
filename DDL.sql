CREATE SCHEMA genel AUTHORIZATION postgres;
CREATE SCHEMA ab2018 AUTHORIZATION postgres;

CREATE TABLE genel.tb_kitap_tipi (
  id SMALLSERIAL,
  kitap_tipi VARCHAR(50),
  CONSTRAINT tb_kitap_tipi_pkey PRIMARY KEY(id)
) 
WITH (oids = false);

CREATE TABLE genel.tb_kitaplar (
  id SERIAL,
  kitap_tipi_id SMALLINT,
  kitap_adi VARCHAR(50),
  yazar VARCHAR(70),
  basim_tarihi DATE,
  dil VARCHAR(3),
  kitap_kodu VARCHAR(20),
  CONSTRAINT tb_kitaplar_pkey PRIMARY KEY(id),
  CONSTRAINT tb_kitaplar_fk FOREIGN KEY (kitap_tipi_id)
    REFERENCES genel.tb_kitap_tipi(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE
) 
WITH (oids = false);

CREATE TABLE genel.tb_kutuphane (
  id SMALLINT NOT NULL,
  adi VARCHAR(100) NOT NULL,
  adres VARCHAR(250) NOT NULL,
  telefon VARCHAR(20) NOT NULL,
  CONSTRAINT tb_kutuphane_pkey PRIMARY KEY(id)
) 
WITH (oids = false);

CREATE TABLE genel.tb_personel (
  id SERIAL,
  ad VARCHAR(50),
  soyad VARCHAR(50),
  gorevi VARCHAR(30),
  cinsiyet BOOLEAN,
  mail VARCHAR(40),
  tel VARCHAR(20),
  adres VARCHAR(250),
  tckimlikno BIGINT,
  durum BOOLEAN DEFAULT true,
  CONSTRAINT tb_personel_pkey PRIMARY KEY(id),
  CONSTRAINT tb_personel_tckimlikno_key UNIQUE(tckimlikno)
) 
WITH (oids = false);


CREATE TABLE genel.tb_uyeler (
  id SERIAL,
  tckimlikno BIGINT,
  ad VARCHAR(50),
  soyad VARCHAR(50),
  adres VARCHAR(250),
  tel VARCHAR(20),
  cinsiyet BOOLEAN,
  d_tarihi DATE,
  durum BOOLEAN DEFAULT true,
  CONSTRAINT tb_uyeler_pkey PRIMARY KEY(id),
  CONSTRAINT tb_uyeler_tckimlikno_key UNIQUE(tckimlikno)
) 
WITH (oids = false);


CREATE TABLE ab2018.tb_uye_hareketleri (
  id SERIAL,
  tarih TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
  islem_tipi SMALLINT NOT NULL,
  uye_id INTEGER NOT NULL,
  kitap_id INTEGER NOT NULL,
  personel_id INTEGER,
  kutuphane_id SMALLINT,
  CONSTRAINT table1_pkey PRIMARY KEY(id),
  CONSTRAINT table1_fk FOREIGN KEY (uye_id)
    REFERENCES genel.tb_uyeler(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE,
  CONSTRAINT table1_fk1 FOREIGN KEY (kitap_id)
    REFERENCES genel.tb_kitaplar(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE,
  CONSTRAINT tb_uye_hareketleri_fk FOREIGN KEY (personel_id)
    REFERENCES genel.tb_personel(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE
) 
WITH (oids = false);