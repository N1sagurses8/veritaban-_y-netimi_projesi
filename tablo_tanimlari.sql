CREATE TABLE Urun(
    urun_id INT,
    urun_adi VARCHAR(100),
    kategori VARCHAR(100),
    birim_fiyat INT,
    mevcut_stok INT,
    kritik_stok_seviye INT,
    PRIMARY KEY(urun_id)
);
CREATE  TABLE stok_hareketi (
    hareket_id INT PRIMARY KEY,
    urun_id INT,
    hareket_tipi VARCHAR(10),
    miktar INT,
    tarih DATE,
    FOREIGN KEY (urun_id) REFERENCES URUN(urun_id)
);
CREATE TABLE Tedarikci (
    tedarikci_id INT,
    tedarikci_adi VARCHAR(50),
    telefon VARCHAR(20),
    tedarikci_sehir VARCHAR(20),
    firma_tipi VARCHAR(10),
    PRIMARY KEY(tedarikci_id)
);
CREATE TABLE Siparis(
    siparis_id INT PRIMARY KEY,
    urun_id INT,
    tedarikci_id INT,
    tarih DATE,
    smiktar INT,
    FOREIGN KEY(urun_id) REFERENCES URUN(urun_id),
    FOREIGN KEY(tedarikci_id) REFERENCES TEDARIKCI(tedarikci_id)
);
CREATE TABLE Musteri(
    musteri_id INT,
    musteri_adi VARCHAR(50),
    urun_id INT,
    siparis_id INT,
    telefon VARCHAR(20),
    sex VARCHAR(1),
    müsteri_sehir VARCHAR(50),
    PRIMARY KEY(musteri_id),
    FOREIGN KEY(urun_id) REFERENCES Urun(urun_id),
    FOREIGN KEY(siparis_id)REFERENCES Siparis(siparis_id)
);
CREATE TABLE Urun_siparis(
    urun_siparis_id INT,
    urun_id INT,
    siparis_id INT,
    siparis_edilen_miktar INT,
    toplam_fiyat INT,
    PRIMARY KEY (urun_siparis_id),
    FOREIGN KEY(urun_id) REFERENCES Urun(urun_id),
    FOREIGN KEY(siparis_id) REFERENCES Siparis(siparis_id)
);
