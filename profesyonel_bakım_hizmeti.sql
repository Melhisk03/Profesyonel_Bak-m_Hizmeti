USE ProfesyonelBakýmHizmeti

DROP TABLE IF EXISTS HastaBilgileri;
DROP TABLE IF EXISTS Hemsireler;
DROP TABLE IF EXISTS KullanilanIlaclar;
DROP TABLE IF EXISTS Tedaviler;
DROP TABLE IF EXISTS Adresler;
DROP TABLE IF EXISTS Hemsire_Hasta;
GO

CREATE TABLE Adresler(
	AdresID INT PRIMARY KEY IDENTITY(1,1),
	Mahalle NVARCHAR(50),
	Sokak NVARCHAR(50),
	No_ INT,
	Daire INT,
	Ýl NVARCHAR(20),
	Ýlçe NVARCHAR(20)
);

CREATE TABLE HastaBilgileri(
	HastaID INT PRIMARY KEY IDENTITY(1,1),
	Ad NVARCHAR(30) NOT NULL,
	Soyad NVARCHAR(30) NOT NULL,
	Cinsiyet NVARCHAR(5) NOT NULL,
	TcKimlik NVARCHAR(11) NOT NULL UNIQUE,
	DogumTarihi DATE NOT NULL,
	Telefon NVARCHAR(20) NULL,
	AcilDurum NVARCHAR(10) NOT NULL,
	Hastalýk NVARCHAR(50) NOT NULL,
	AdresID INT

	FOREIGN KEY (AdresID) REFERENCES Adresler(AdresID)
);

CREATE TABLE Hemsireler(
	HemsireID INT PRIMARY KEY IDENTITY(1,1),
	Ad NVARCHAR(30) NOT NULL,
	Soyad NVARCHAR(30) NOT NULL,
	Cinsiyet NVARCHAR(10),
	TcKimlik NVARCHAR(11) NOT NULL UNIQUE,
	Telefon NVARCHAR(20) NULL,
	AdresID INT,

	FOREIGN KEY (AdresID) REFERENCES Adresler(AdresID)
);

DELETE FROM Hemsireler;

CREATE TABLE Hemsire_Hasta (
    HemsireID INT NOT NULL,
    HastaID INT NOT NULL,
    PRIMARY KEY (HemsireID, HastaID),
    FOREIGN KEY (HemsireID) REFERENCES Hemsireler(HemsireID),
    FOREIGN KEY (HastaID) REFERENCES HastaBilgileri(HastaID)
);

DELETE FROM Hemsire_Hasta;

CREATE TABLE KullanilanIlaclar (
	IlacID INT NOT NULL,
	HemsireID INT NOT NULL,
	HastaID INT NOT NULL,
	IlacAdi NVARCHAR(100) NOT NULL,
	Dozaj NVARCHAR(50) NULL,
	Tarih DATETIME NOT NULL,

	FOREIGN KEY (HemsireID) REFERENCES Hemsireler(HemsireID),
	FOREIGN KEY (HastaID) REFERENCES HastaBilgileri(HastaID)
);

ALTER TABLE KullanilanIlaclar
DROP COLUMN IlacID;

ALTER TABLE KullanilanIlaclar
ADD IlacID INT IDENTITY(1,1) PRIMARY KEY;


INSERT INTO KullanilanIlaclar (HemsireID, HastaID, IlacAdi, Dozaj, Tarih) VALUES
( 1, 11,'Bronkodilatör' ,'1 Puf','2025-01-02 12:00'),
( 1, 3,'Metformin', '50mg','2025-01-03 09:30'),
( 1, 7,'Metformin' ,'20mg', '2024-01-03 08:30'),
( 2, 4,'Zanax' ,'0.10mg','2024-07-04 12:00'),
( 2, 8,'Ýnsülin' ,'100mg','2024-08-17 13:30'),
( 2, 12,'Becloforte','3 Puf' ,'2024-09-20 15:00'),
( 3, 2,'Ýnsülin','50mg' , '2024-08-20 20:30'),
( 3, 6, 'Delix','2.5mg','2024-08-21 15:30'),
( 3, 10,'Delix', '3.0mg','2024-12-28 20:00'),
( 4, 5,'Ýnsülin' ,'30mg','2024-11-16 15:00'),
( 4, 9, 'Ýnsülin','25mg','2024-12-04 14:00'),
( 4, 13,'Bronkodilatör','2 Puf' ,'2024-12-03 15:00'),
( 5, 11,'Bronkodilatör','3 Puf','2024-12-21 14:00'),
( 5, 15,'Ýnsülin','20mg','2024-12-22 08:00'),
( 5, 19,'Delix','3.0mg','2025-01-01 14:00'),
( 6, 16, 'Lansor', '20mg', '2025-01-02 13:00'), 
( 6, 20, 'Bronkodilatör', '4 Puf', '2025-01-03 18:00'),
(6, 24, 'Zestril', '2.5mg', '2025-01-04 17:00'),
(7, 14, 'Becloforte','2.5mg','2025-05-04 14:00'),
(7, 18, 'Becotide', '3.5mg', '2025-05-08 13:00'), 
(7, 21, 'Gliflozin', '2.5mg', '2025-05-08 07:00'),
(8, 17, 'Vitamin-C', '10mg', '2025-01-09 16:00'),
(8, 22, 'Vitamin-A', '20mg', '2025-01-19 14:00'), 
(8, 26, 'Vitamin-B', '30mg', '2025-01-19 13:00'), 
(9, 23, 'Vitamin-B12', '10mg', '2025-01-18 08:00'),
(9, 27, 'Vitamin-D', '15mg', '2025-01-20 09:00'),
(9, 31, 'Gliptin', '10mg', '2025-01-21 17:00'),
(10, 28, 'Flixotide', '2.5mg', '2025-01-22 18:00'),
(10, 32, 'Ýnsülin', '10mg', '2025-01-23 19:00'),
(10, 36, 'Vitamin-B', '5mg', '2025-01-24 12:00'),
(11, 25, 'Vitamin-A', '5mg', '2025-01-25 17:00'),
(11, 29, 'Gliflozin', '10mg', '2025-01-26 12:00'),
(11, 33, 'Ýnsülin', '20mg', '2025-01-27 15:00'),
(12, 30, 'Gliptin', '10mg', '2025-01-27 18:00'),
(12, 34, 'Ýnsülin', '5mg', '2025-01-28 12:00'),
(12, 38, 'Delix', '2.5mg', '2025-01-29 16:00'),
(13, 35, 'Vitamin-B', '5mg', '2025-01-30 13:00'),
(13, 39, 'Vitamin-C', '5mg', '2025-01-31 12:00'),
(13, 43, 'Zanax', '2.5mg', '2025-02-01 17:00'),
(14, 40, 'Zanax', '3.0mg', '2025-02-02 19:00'),
(14, 50, 'Vitamin-A', '5mg', '2025-02-03 12:00'),
(14, 57, 'Vitamin-C', '15mg', '2025-02-04 11:00'),
(15, 37, 'Flixotide', '2.5mg', '2025-02-05 15:00'),
(15, 41, 'Intal', '3.0mg', '2025-02-06 09:00'),
(15, 44, 'Vilanterol', '3.5mg', '2025-02-06 12:00'),
(16, 42, 'Vitamin-B', '5mg', '2025-02-07 08:00'),
(16, 45, 'Vitamin-A', '20mg', '2025-02-07 09:00'),
(16, 48, 'Ýnsülin', '4.0mg', '2025-02-08 09:00'),
(17, 46, 'Delix', '2.5mg', '2025-02-08 08:00'),
(17, 49, 'Vitamin-C', '5mg', '2025-02-09 11:00'),
(17, 53, 'Krotikostroid', '2.5mg', '2025-02-10 06:00'),
(18, 61, 'Gliflozin', '3.0mg', '2025-02-11 16:00'),
(18, 65, 'Delix', '5mg', '2025-02-11 10:00'),
(18, 69, 'Vitamin-C', '10mg', '2025-02-12 12:00'),
(19, 47, 'Vitamin-B12', '5mg', '2025-02-08 13:00'),
(19, 51, 'Vitamin-B', '10mg', '2025-01-20 08:00'),
(19, 54, 'Vilanterol', '3.5mg', '2025-02-20 10:00'),
(20, 52, 'Becotide', '20mg', '2025-02-17 09:00'),
(20, 55, 'Zanax', '10mg', '2025-01-18 12:00'),
(20, 59, 'Ýnsulin', '20mg', '2025-01-18 08:00'),
(21, 56, 'Gliptin', '10mg', '2025-02-19 12:00'),
(21, 60, 'Flixotide', '10mg', '2025-02-20 11:00'),
(21, 72, 'Rilace', '2.5mg', '2025-02-21 09:00'),
(1, 76, 'Intal', '15mg', '2025-02-22 10:00'),
(1, 80, 'Krotikostroid','10mg','2025-02-22 13:00'),
(2, 61,'Ýnsülin','15mg','2025-02-22 07:00'),
(2, 65, 'Vitamin-A', '10mg', '2025-02-23 08:00'),
(3, 58, 'Vitamin-C', '15mg', '2025-02-23 09:00'), 
(3, 62, 'Vitamin-D', '20mg', '2025-02-24 12:00'),
(4, 79, 'Becloforte', '15mg', '2025-03-01 18:00'),
(4, 83, 'Lansor', '20mg', '2025-03-02 20:00'),
(5, 68, 'Arveles', '15mg', '2025-03-02 19:00'),
(5, 72, 'Ibu-Cold' , '30mg', '2025-03-03 22:00'),
(6, 69, 'Katarin' , '15mg' , '2025-03-03 16:00'),
(6, 73, 'Vitamin-A', '10mg', '2025-03-04 14:00'),
(7, 66, 'Lansor', '5mg', '2025-03-05 08:00'),
(7, 70, 'Vilanterol', '15mg', '2025-03-05 09:00'),
(8, 87, 'Becotide', '20mg', '2025-03-06 08:00'),
(8, 91, 'Katarin', '15mg', '2025-03-07 11:00'),
(9, 76, 'Parol', '10mg', '2025-03-07 15:00'),
(9, 80, 'Vitamin-A', '15mg', '2025-03-07 19:00'), 
(10, 77, 'Delix', '10mg', '2025-03-08 11:30'), 
(10, 81, 'Lansor', '15mg', '2025-03-09 12:00'), 
(11, 74, 'Arveles' , '10mg', '2025-03-10 16:00'), 
(11, 78, 'Parol', '20mg', '2025-03-10 17:00'), 
(12, 95, 'Dolarex', '10mg', '2025-03-11 18:00'), 
(12, 99, 'Zanax', '0.5 mg', '2025-03-11 15:00'), 
(13, 76, 'Vitamin-C', '10mg', '2025-03-11 07:00'), 
(13, 80, 'Dolarex', '15mg', '2025-03-12 09:00'), 
(14, 85, 'Vitamin-A', '20mg', '2025-03-12 07:00'),
(14, 89, 'Arveles', '10mg', '2025-03-13 09:00'), 
(15, 82, 'Dopalevo', '5mg', '2025-03-13 10:00'), 
(15, 86, 'Dolarex', '10mg', '2025-03-14 10:30'),
(16, 91,'Vitamin-C', '15mg', '2025-03-14 09:00'),
(16, 99, 'Vitamin-B12', '10mg', '2025-03-15 08:00'),
(17, 96, 'Vitamin-B12', '15mg', '2025-03-15 09:00'), 
(18, 93, 'Zanax', '0.5mg', '2025-03-16 15:00'),
(19, 98, 'Enapril', '20mg', '2025-03-16 14:00'), 
(20, 99, 'Arveles', '10mg', '2025-03-16 16:00');





INSERT INTO Adresler (Mahalle, Sokak, No_, Daire, Ýl, Ýlçe) VALUES
-- 120 Adres
('Yýldýz', 'Hanýmeli', 34, 2, 'Ankara', 'Çankaya'),
('Suadiye', 'Sümbül', 18, 5, 'Ýstanbul', 'Kadýköy'),
('Alsancak', 'Karanfil', 77, 1, 'Ýzmir', 'Konak'),
('Nilüfer', 'Menekþe', 25, 3, 'Bursa', 'Nilüfer'),
('Mamak', 'Zambak', 44, 6, 'Ankara', 'Mamak'),
('Maltepe', 'Lavanta', 11, 4, 'Ýstanbul', 'Maltepe'),
('Buca', 'Akasya', 30, 2, 'Ýzmir', 'Buca'),
('Osmangazi', 'Meþe', 9, 7, 'Bursa', 'Osmangazi'),
('Batýkent', 'Gül', 62, 1, 'Ankara', 'Yenimahalle'),
('Ataþehir', 'Kavak', 17, 5, 'Ýstanbul', 'Ataþehir'),
('Karþýyaka', 'Zeytin', 38, 2, 'Ýzmir', 'Karþýyaka'),
('Görükle', 'Söðüt', 70, 3, 'Bursa', 'Nilüfer'),
('Cebeci', 'Sarmaþýk', 21, 6, 'Ankara', 'Altýndað'),
('Beykoz', 'Çam', 46, 1, 'Ýstanbul', 'Beykoz'),
('Bornova', 'Lale', 54, 4, 'Ýzmir', 'Bornova'),
('Ýnegöl', 'Ardýç', 29, 2, 'Bursa', 'Ýnegöl'),
('Kýzýlay', 'Ihlamur', 12, 3, 'Ankara', 'Çankaya'),
('Bakýrköy', 'Fesleðen', 33, 7, 'Ýstanbul', 'Bakýrköy'),
('Gaziemir', 'Nergis', 47, 1, 'Ýzmir', 'Gaziemir'),
('Yýldýrým', 'Papatya', 60, 5, 'Bursa', 'Yýldýrým'),
('Barbaros', 'Çiçek', 10, 1, 'Ýstanbul', 'Beþiktaþ'),
('Atatürk', 'Menekþe', 23, 3, 'Ankara', 'Mamak'),
('Yýldýz', 'Gül', 5, 2, 'Ýzmir', 'Karþýyaka'),
('Cumhuriyet', 'Lale', 41, 5, 'Bursa', 'Osmangazi'),
('Þehitler', 'Karanfil', 18, 4, 'Ýstanbul', 'Ümraniye'),
('Bahçelievler', 'Zambak', 31, 6, 'Ankara', 'Çankaya'),
('Kazým Karabekir', 'Nilüfer', 22, 1, 'Ýzmir', 'Bornova'),
('Ýnönü', 'Orkide', 17, 2, 'Bursa', 'Nilüfer'),
('Yeni', 'Begonya', 12, 3, 'Ýstanbul', 'Kadýköy'),
('Fatih', 'Yasemin', 29, 7, 'Ankara', 'Yenimahalle'),
('Mevlana', 'Lavanta', 26, 4, 'Ýzmir', 'Buca'),
('Sakarya', 'Papatya', 33, 6, 'Bursa', 'Yýldýrým'),
('Gazi', 'Þebboy', 15, 2, 'Ýstanbul', 'Maltepe'),
('Yunus Emre', 'Defne', 36, 5, 'Ankara', 'Keçiören'),
('Fevzi Çakmak', 'Sardunya', 9, 1, 'Ýzmir', 'Gaziemir'),
('Hürriyet', 'Akasya', 27, 3, 'Bursa', 'Osmangazi'),
('Zafer', 'Fesleðen', 20, 6, 'Ýstanbul', 'Bakýrköy'),
('Karþýyaka', 'Hanýmeli', 14, 4, 'Ankara', 'Etimesgut'),
('Ulus', 'Meþe', 11, 2, 'Ýzmir', 'Karabaðlar'),
('Esentepe', 'Zeytin', 38, 5, 'Bursa', 'Mudanya'),
('Çamlýk', 'Çam', 6, 3, 'Ýstanbul', 'Sarýyer'),
('Tandoðan', 'Ardýç', 19, 7, 'Ankara', 'Altýndað'),
('Egekent', 'Sarmaþýk', 43, 1, 'Ýzmir', 'Çiðli'),
('Küçükçekmece', 'Söðüt', 13, 4, 'Ýstanbul', 'Küçükçekmece'),
('Kocatepe', 'Leylak', 21, 6, 'Ankara', 'Pursaklar'),
('Hilal', 'Gülbahar', 30, 2, 'Ýzmir', 'Bayraklý'),
('Soðanlýk', 'Ihlamur', 8, 5, 'Ýstanbul', 'Kartal'),
('Demetevler', 'Erguvan', 44, 3, 'Ankara', 'Yenimahalle'),
('Evka', 'Yonca', 28, 1, 'Ýzmir', 'Buca'),
('Fomara', 'Servi', 24, 7, 'Bursa', 'Osmangazi'),
('Zeytinburnu', 'Lavanta', 35, 4, 'Ýstanbul', 'Zeytinburnu'),
('Bahçeþehir', 'Sümbül', 32, 6, 'Ankara', 'Sincan'),
('Maviþehir', 'Limon', 16, 2, 'Ýzmir', 'Karþýyaka'),
('Beylikdüzü', 'Gülçimen', 25, 3, 'Ýstanbul', 'Beylikdüzü'),
('Batýkent', 'Nergis', 7, 5, 'Ankara', 'Yenimahalle'),
('Bostanlý', 'Ortanca', 34, 1, 'Ýzmir', 'Karþýyaka'),
('Gürsu', 'Kavak', 42, 7, 'Bursa', 'Gürsu'),
('Kozyataðý', 'Zambak', 39, 6, 'Ýstanbul', 'Kadýköy'),
('Cebeci', 'Çýnar', 40, 4, 'Ankara', 'Mamak'),
('Þirinyer', 'Lavanta', 37, 2, 'Ýzmir', 'Buca'),
('Mudanya', 'Fýstýk', 45, 5, 'Bursa', 'Mudanya'),
('Çýnar', 'Menekþe', 12, 1, 'Ýstanbul', 'Kadýköy'),
('Gül', 'Lale', 8, 2, 'Ankara', 'Çankaya'),
('Papatya', 'Zambak', 5, 3, 'Ýzmir', 'Bornova'),
('Meþe', 'Nilüfer', 16, 4, 'Bursa', 'Nilüfer'),
('Sümbül', 'Nergis', 21, 1, 'Ýstanbul', 'Üsküdar'),
('Gülbahar', 'Karanfil', 9, 2, 'Ankara', 'Keçiören'),
('Zeytin', 'Zeybek', 14, 3, 'Ýzmir', 'Konak'),
('Kavak', 'Karanlýk', 6, 4, 'Bursa', 'Osmangazi'),
('Ihlamur', 'Kardelen', 18, 1, 'Ýstanbul', 'Beþiktaþ'),
('Karanfil', 'Yasemin', 22, 2, 'Ankara', 'Etimesgut'),
('Sedir', 'Leylak', 3, 3, 'Ýzmir', 'Buca'),
('Ardýç', 'Begonya', 11, 4, 'Bursa', 'Yýldýrým'),
('Funda', 'Þebboy', 17, 1, 'Ýstanbul', 'Maltepe'),
('Defne', 'Çiçek', 7, 2, 'Ankara', 'Mamak'),
('Servi', 'Sardunya', 19, 3, 'Ýzmir', 'Gaziemir'),
('Kestane', 'Mimoza', 15, 4, 'Bursa', 'Gemlik'),
('Sarmaþýk', 'Kekik', 13, 1, 'Ýstanbul', 'Sarýyer'),
('Kayýn', 'Lavanta', 2, 2, 'Ankara', 'Yenimahalle'),
('Akasya', 'Papatya', 10, 3, 'Ýzmir', 'Balçova'),
('Ladin', 'Defne', 4, 4, 'Bursa', 'Mudanya'),
('Kavun', 'Erguvan', 23, 1, 'Ýstanbul', 'Pendik'),
('Armut', 'Yonca', 20, 2, 'Ankara', 'Altýndað'),
('Viþne', 'Menekþe', 24, 3, 'Ýzmir', 'Çiðli'),
('Elma', 'Akasya', 25, 4, 'Bursa', 'Orhangazi'),
('Kiraz', 'Nilüfer', 26, 1, 'Ýstanbul', 'Bakýrköy'),
('Ayva', 'Zambak', 27, 2, 'Ankara', 'Polatlý'),
('Karpuz', 'Leylak', 28, 3, 'Ýzmir', 'Aliaða'),
('Kavun', 'Kardelen', 29, 4, 'Bursa', 'Kestel'),
('Nar', 'Hanýmeli', 30, 1, 'Ýstanbul', 'Beylikdüzü'),
('Muz', 'Nergis', 31, 2, 'Ankara', 'Sincan'),
('Ýncir', 'Lale', 32, 3, 'Ýzmir', 'Narlýdere'),
('Þeftali', 'Menekþe', 33, 4, 'Bursa', 'Ýnegöl'),
('Ceviz', 'Yasemin', 34, 1, 'Ýstanbul', 'Avcýlar'),
('Badem', 'Karanfil', 35, 2, 'Ankara', 'Ayaþ'),
('Fýstýk', 'Zeybek', 36, 3, 'Ýzmir', 'Urla'),
('Hurma', 'Çiçek', 37, 4, 'Bursa', 'Karacabey'),
('Hodan', 'Lavanta', 38, 1, 'Ýstanbul', 'Esenler'),
('Kekik', 'Begonya', 39, 2, 'Ankara', 'Gölbaþý'),
('Nane', 'Sardunya', 40, 3, 'Ýzmir', 'Tire'),
('Rezene', 'Þebboy', 41, 4, 'Bursa', 'Yeniþehir'),
('Adaçayý', 'Erguvan', 42, 1, 'Ýstanbul', 'Beykoz'),
('Melisa', 'Yonca', 43, 2, 'Ankara', 'Pursaklar'),
('Tarhun', 'Papatya', 44, 3, 'Ýzmir', 'Foça'),
('Keklik', 'Mimoza', 45, 4, 'Bursa', 'Mustafakemalpaþa'),
('Biberiye', 'Hanýmeli', 46, 1, 'Ýstanbul', 'Zeytinburnu'),
('Fesleðen', 'Çiçek', 47, 2, 'Ankara', 'Elmadað'),
('Anason', 'Leylak', 48, 3, 'Ýzmir', 'Torbalý'),
('Sakýz', 'Menekþe', 49, 4, 'Bursa', 'Harmancýk'),
('Karanfil', 'Lavanta', 50, 1, 'Ýstanbul', 'Þiþli'),
('Zeytin', 'Begonya', 51, 2, 'Ankara', 'Kazan'),
('Çörekotu', 'Sardunya', 52, 3, 'Ýzmir', 'Menemen'),
('Hardal', 'Þebboy', 53, 4, 'Bursa', 'Gürsu'),
('Zencefil', 'Erguvan', 54, 1, 'Ýstanbul', 'Kaðýthane'),
('Safran', 'Yonca', 55, 2, 'Ankara', 'Akyurt'),
('Keklikotu', 'Papatya', 56, 3, 'Ýzmir', 'Bayraklý'),
('Mahlep', 'Kekik', 57, 4, 'Bursa', 'Keles'),
('Sumak', 'Nane', 58, 1, 'Ýstanbul', 'Fatih'),
('Tarçýn', 'Zambak', 59, 2, 'Ankara', 'Beypazarý'),
('Karanfil', 'Menekþe', 60, 3, 'Ýzmir', 'Ödemiþ');

INSERT INTO HastaBilgileri (Ad, Soyad, Cinsiyet, TcKimlik, DogumTarihi, Telefon, AcilDurum, Hastalýk, AdresID) VALUES
('Gökay', 'Ýnönü', 'Erkek', '19005269202', '1976-03-05', '05453001204', 'Hayýr', 'Hipertansiyon', 1),
('Ayþe', 'Gülen', 'Kadýn', '17362886917', '1997-09-21', '05463018546', 'Evet', 'Diyabet', 2),
('Görkem', 'Alemdar', 'Erkek', '29873785268', '1964-06-26', '02242846604', 'Hayýr', 'Diyabet', 3),
('Pedriye', 'Çetin', 'Kadýn', '94612625770', '2000-07-04', '025412345677', 'Hayýr', 'Alzheimer', 4),
('Nazlý', 'Ýhsanoðlu', 'Kadýn', '87763109422', '1943-02-18', '0856-467 9970', 'Hayýr', 'Diyabet', 5),
('Hayriye', 'Aslan', 'Kadýn', '28910629180', '1984-01-23', '+90(653)0745054', 'Hayýr', 'Hipertansiyon', 6),
('Taylan', 'Aslan', 'Erkek', '78044507885', '1942-10-03', '02475469137', 'Hayýr', 'Diyabet', 7),
('Mahmut', 'Çamurcuoðlu', 'Erkek', '69373496635', '1995-04-28', '+90(508)214-8628', 'Hayýr', 'Diyabet', 8),
('Mürvet', 'Dumanlý', 'Kadýn', '78163195887', '2004-06-03', '(524)140 6029', 'Hayýr', 'Diyabet', 9),
('Begüm', 'Akdeniz', 'Kadýn', '96850041567', '1960-01-10', '04680072290', 'Evet', 'Hipertansiyon', 10),
('Arif', 'Eraslan', 'Erkek', '52704881157', '1966-11-13', '0546403741', 'Evet', 'KOAH', 11),
('Dicle', 'Fýrat', 'Kadýn', '95144766654', '1983-06-10', '+90 (085) 8994417', 'Evet', 'Astým', 12),
('Aleyna', 'Þama', 'Kadýn', '48604716387', '1973-08-21', '0443-283 0965', 'Evet', 'Astým', 13),
('Enes', 'Yaman', 'Erkek', '13097887746', '1997-01-29', '0466-609 9353', 'Evet', 'Astým', 14),
('Ege', 'Duran', 'Erkek', '80259210186', '1970-03-30', '0824 172 48 25', 'Hayýr', 'Diyabet', 15),
('Efe', 'Çorlu', 'Erkek', '58199211815', '1959-10-13', '0655-494 7170', 'Hayýr', 'Diyabet', 16),
('Can', 'Zengin', 'Erkek', '21255626239', '1993-08-28', '08168460223', 'Evet', 'Alzheimer', 17),
('Erhan', 'Seven', 'Erkek', '91549366971', '1991-08-30', '0521 752 50 07', 'Hayýr', 'Astým', 18),
('Þenay', 'Bilir', 'Kadýn', '88033567542', '1950-12-13', '+90(129)6670083', 'Evet', 'Hipertansiyon', 19),
('Þener', 'Arsoy', 'Erkek', '14080513633', '1973-03-29', '+90(300)335-4216', 'Hayýr', 'Astým', 20),
('Fikriye', 'Alemdar', 'Kadýn', '48851064499', '1968-12-20', '+90(898)562-5753', 'Hayýr', 'Diyabet', 21),
('Gülcan', 'Bilgin', 'Kadýn', '36333328309', '1932-05-15', '+90(215)064-9100', 'Hayýr', 'Astým', 22),
('Yasemen', 'Demir', 'Kadýn', '71919579574', '1981-02-20', '+90 (847) 2304618', 'Hayýr', 'KOAH', 23),
('Bahtiyar', 'Mansýz', 'Erkek', '66423687691', '1943-09-01', '+90(914)117-3956', 'Hayýr', 'Hipertansiyon', 24),
('Suat', 'Aksu', 'Erkek', '83183690264', '1996-12-09', '07530011972', 'Hayýr', 'Diyabet', 25),
('Berna', 'Öcalan', 'Kadýn', '20787692334', '1943-03-05', '0374-470 1204', 'Evet', 'KOAH', 26),
('Bayse', 'Sezgin', 'Kadýn', '55856363076', '1987-05-14', '+90 (100) 2255794', 'Evet', 'Astým', 27),
('Þeref', 'Çorlu', 'Erkek', '32946819386', '1944-11-17', '674 61 76', 'Hayýr', 'Astým', 28),
('Mesut', 'Yaman', 'Erkek', '23569499934', '1986-01-03', '+90(972)965-4716', 'Evet', 'Diyabet', 29),
('Aynur', 'Türk', 'Kadýn', '44631764609', '1972-02-26', '+90(899)3588916', 'Hayýr', 'Diyabet', 30),
('Fatih', 'Gül', 'Erkek', '75492139488', '1976-06-11', '289 0 028', 'Hayýr', 'Diyabet', 31),
('Bilal', 'Akdeniz', 'Erkek', '19300338816', '1996-04-19', '(354)083 8663', 'Hayýr', 'Diyabet', 32),
('Emel', 'Ertaþ', 'Kadýn', '72590708429', '1941-05-14', '+90(751)701-6801', 'Hayýr', 'Diyabet', 33),
('Nefaret', 'Mansýz', 'Kadýn', '51392911048', '1998-07-28', '+90(375)503-9757', 'Evet', 'Diyabet', 34),
('Huriye', 'Sakarya', 'Kadýn', '10952396600', '1975-11-05', '(488)510 2726', 'Hayýr', 'Diyabet', 35),
('Fatma', 'Eraslan', 'Kadýn', '38393392155', '1954-11-29', '+90 (637) 3516091', 'Hayýr', 'Diyabet', 36),
('Ahmet', 'Ertaþ', 'Erkek', '90137461297', '1998-01-03', '0708 086 97 82', 'Hayýr', 'Astým', 37),
('Yakup', 'Zengin', 'Erkek', '30681316178', '1943-06-25', '995 8 669', 'Hayýr', 'Hipertansiyon', 38),
('Yasin', 'Ýnönü', 'Erkek', '45425915860', '1983-07-16', '(472)269 8485', 'Evet', 'Diyabet', 39),
('Özlem', 'Korutürk', 'Kadýn', '87032437793', '1958-12-20', '03945228851', 'Evet', 'Alzheimer', 40),
('Yaren', 'Durmuþ', 'Kadýn', '89372584447', '2007-01-19', '846 0 810', 'Hayýr', 'Astým', 41),
('Çisem', 'Manço', 'Kadýn', '36012919448', '1965-09-21', '0442 043 80 57', 'Hayýr', 'Diyabet', 42),
('Binnur', 'Mansýz', 'Kadýn', '86190540056', '1959-12-01', '+90(638)406-0043', 'Hayýr', 'Alzheimer', 43),
('Celil', 'Bilge', 'Erkek', '73866670906', '1960-02-01', '(989)334 7212', 'Evet', 'KOAH', 44),
('Mustafa', 'Korutürk', 'Erkek', '25091857325', '1980-09-21', '+90(648)4229405', 'Evet', 'Alzheimer', 45),
('Bartu', 'Demirel', 'Erkek', '31206377204', '1934-10-28', '0590 947 98 51', 'Evet', 'Hipertansiyon', 46),
('Yücel', 'Hayrioðlu', 'Erkek', '42321325706', '1954-05-31', '+90(182)688-3555', 'Evet', 'Diyabet', 47),
('Serkan', 'Bilir', 'Erkek', '81374971705', '1994-01-06', '+90(015)739-6164', 'Evet', 'Diyabet', 48),
('Hacer', 'Gül', 'Kadýn', '11214741296', '1999-09-25', '(887)704 3581', 'Hayýr', 'Astým', 49),
('Deniz', 'Aksu', 'Erkek', '86335821775', '2001-12-15', '+90(133)6138612', 'Evet', 'KOAH', 50),
('Olcay', 'Ertaþ', 'Erkek', '56028598792', '1934-07-18', '+90 (102) 4819346', 'Hayýr', 'Hipertansiyon', 51),
('Yaren', 'Dumanlý', 'Kadýn', '64246370092', '1988-04-27', '(061)809 1901', 'Hayýr', 'Astým', 52),
('Yaðýz', 'Ýhsanoðlu', 'Erkek', '25044570160', '1968-10-31', '0914-766 0728', 'Evet', 'KOAH', 53),
('Melih', 'Yaman', 'Erkek', '64746891188', '2003-08-30', '0245-088 2100', 'Evet', 'KOAH', 54),
('Meliha', 'Tevetoðlu', 'Kadýn', '84707012032', '2003-11-27', '+90 (435) 3682223', 'Hayýr', 'Alzheimer', 55),
('Nurhayat', 'Karadeniz', 'Kadýn', '36855321468', '1944-12-26', '0908 781 41 41', 'Evet', 'Diyabet', 56),
('Ayþe', 'Gül', 'Kadýn', '76918148784', '1974-06-01', '(231)491 3577', 'Evet', 'Diyabet', 57),
('Sinem', 'Mansýz', 'Kadýn', '51486902665', '1950-02-16', '(562)053 3645', 'Evet', 'Diyabet', 58),
('Dilan', 'Tarhan', 'Kadýn', '56097767136', '1994-09-16', '+90(754)781-1283', 'Hayýr', 'Diyabet', 59),
('Remziye', 'Gül', 'Kadýn', '99706129318', '1939-10-17', '+90 (080) 9969308', 'Hayýr', 'Astým', 60),
('Ramadan', 'Duran', 'Erkek', '76742405010', '1949-08-13', '(639)427 8816', 'Hayýr', 'Diyabet', 61),
('Yurdanur', 'Zorlu', 'Kadýn', '95821406006', '1951-12-17', '+90(272)299-3731', 'Hayýr', 'KOAH', 62),
('Esin', 'Arsoy', 'Kadýn', '15300069855', '1957-07-12', '+90(567)700-4989', 'Hayýr', 'Astým', 63),
('Halim', 'Kýsakürek', 'Erkek', '64347121657', '1979-02-08', '+90 (846) 3865577', 'Hayýr', 'KOAH', 64),
('Nergiz', 'Yýlmaz', 'Kadýn', '70726406469', '1951-12-05', '01843222591', 'Hayýr', 'Hipertansiyon', 65),
('Selim', 'Bilgin', 'Erkek', '74911295445', '1994-07-22', '+90(392)603-4228', 'Evet', 'Astým', 66),
('Aslý', 'Akçay', 'Kadýn', '29637747106', '1936-12-30', '0428 699 04 13', 'Hayýr', 'Hipertansiyon', 67),
('Aykut', 'Tevetoðlu', 'Erkek', '78688449143', '1994-12-10', '0369 292 98 42', 'Hayýr', 'Diyabet', 68),
('Ýsmail', 'Tarhan', 'Erkek', '93552018050', '1938-10-04', '06621038862', 'Evet', 'KOAH', 69),
('Nur', 'Sakarya', 'Kadýn', '75186531918', '1934-09-13', '+90(811)729-6118', 'Evet', 'KOAH', 70),
('Ayþe', 'Bilgin', 'Kadýn', '64841027252', '1977-02-03', '+90 (624) 7314986', 'Hayýr', 'Hipertansiyon', 71),
('Peyker', 'Akar', 'Kadýn', '87339966070', '2000-07-03', '+90 (806) 3565126', 'Hayýr', 'Hipertansiyon', 72),
('Þermin', 'Zengin', 'Kadýn', '45449082653', '2002-05-08', '959 4 636', 'Hayýr', 'KOAH', 73),
('Hülya', 'Çetin', 'Kadýn', '76819222910', '1953-09-17', '(887)449 5621', 'Evet', 'Alzheimer', 74),
('Mülâyim', 'Dumanlý', 'Erkek', '35551813484', '1943-01-13', '08658902601', 'Hayýr', 'Alzheimer', 75),
('Fetullah', 'Güçlü', 'Erkek', '95580924722', '1988-08-22', '+90 (143) 0669', 'Evet', 'Astým', 76),
('Sevginar', 'Fýrat', 'Kadýn', '95742707683', '1937-03-17', '0770 384 30 98', 'Hayýr', 'Hipertansiyon', 77),
('Gökçe', 'Sezer', 'Kadýn', '92599397877', '1952-06-15', '+90(530)2146566', 'Evet', 'Astým', 78),
('Muhammet', 'Akar', 'Erkek', '12223687972', '1938-09-22', '+90 (848) 9554393', 'Hayýr', 'Astým', 79),
('Adem', 'Ýhsanoðlu', 'Erkek', '89044391153', '1930-01-08', '0268-181 8451', 'Evet', 'KOAH', 80),
('Servet', 'Eraslan', 'Erkek', '86777320926', '1963-06-07', '+90(697)357 141', 'Hayýr', 'Astým', 81),
('Sena', 'Þener', 'Kadýn', '43076299503', '1972-05-11', '588 0 434', 'Evet', 'Alzheimer', 82),
('Çiðdem', 'Gülen', 'Kadýn', '56476161906', '1939-09-26', '+90(275)531 3334', 'Hayýr', 'Diyabet', 83),
('Çisem', 'Bilgin', 'Kadýn', '59901493709', '1950-08-14', '+90 (117) 0759', 'Evet', 'Alzheimer', 84),
('Tülay', 'Soylu', 'Kadýn', '75604478845', '1954-04-11', '+90(463)920-0856', 'Evet', 'Alzheimer', 85),
('Vecide', 'Öcalan', 'Kadýn', '70880303977', '1945-10-08', '+90(750)036-9428', 'Evet', 'Hipertansiyon', 86),
('Ramazan', 'Yüksel', 'Erkek', '75581608986', '1976-01-31', '(276)365 5647', 'Evet', 'Astým', 87),
('Ýlayda', 'Durdu', 'Kadýn', '84027219522', '1988-03-18', '322 7 026', 'Evet', 'Astým', 88),
('Evgin', 'Yaman', 'Kadýn', '99547447808', '1999-10-02', '+90(574)489-0347', 'Evet', 'Hipertansiyon', 89),
('Rahmiye', 'Sakarya', 'Kadýn', '45797077254', '1978-07-07', '(884)506 1593', 'Hayýr', 'KOAH', 90),
('Melahat', 'Durdu', 'Kadýn', '98690496910', '2002-09-01', '0455 877 16 94', 'Hayýr', 'Hipertansiyon', 91),
('Belkýz', 'Þener', 'Erkek', '31288411003', '1952-03-12', '(699)611 2535', 'Evet', 'Astým', 92),
('Ergün', 'Þensoy', 'Erkek', '92753163796', '1983-03-18', '0759-876 2202', 'Hayýr', 'Alzheimer', 93),
('Þener', 'Yüksel', 'Erkek', '47203103566', '1940-04-14', '02611178006', 'Evet', 'Hipertansiyon', 94),
('Gülizar', 'Ýnönü', 'Erkek', '22867781016', '1943-07-14', '0921-643 3472', 'Evet', 'Diyabet', 95),
('Ergül', 'Fýrat', 'Kadýn', '35076242920', '1933-04-11', '+90(557)7848728', 'Hayýr', 'Alzheimer', 96),
('Zeynep', 'Zengin', 'Kadýn', '72696146727', '2006-02-22', '884 5 783', 'Hayýr', 'Diyabet', 97),
('Cemil', 'Dumanlý', 'Erkek', '58566924045', '1985-06-27', '0240-082 5478', 'Hayýr', 'Hipertansiyon', 98),
('Cemal', 'Sezer', 'Erkek', '78384848954', '1994-04-26', '0064-930 8536', 'Hayýr', 'Alzheimer', 99);

INSERT INTO Hemsireler (Ad, Soyad,Cinsiyet, TcKimlik, Telefon, AdresID) VALUES
('Sezer', 'Þafak', 'Erkek','41760218340', '0663 416 38 94', 100),
('Serdar', 'Þensoy', 'Erkek','86205290744', '0631-224 1797', 101),
('Mithat', 'Sezer', 'Erkek' , '77099216564', '05020802144', 102),
('Erens', 'Demirel', 'Erkek', '40100007367', '+90 (207) 3564757', 103),
('Zehra', 'Çetin', 'Kadýn','53085982850', '+90 (204) 6187234', 104),
('Zeliha', 'Karadeniz', 'Kadýn' ,'22939085014', '06730371837', 105),
('Övgü', 'Tarhan', 'Kadýn' ,'52783087916', '(208)814 7435', 106),
('Aslý', 'Bilge', 'Kadýn', '38633236078', '+90 (365) 0249163', 107),
('Ada', 'Türk', 'Kadýn','77391264171', '0513 271 95 00', 108),
('Yasin', 'Þensoy', 'Erkek', '27641112834', '+90(358)573-0407', 109),
('Yakup', 'Dumanlý', 'Erkek','51055698848', '+90(739)285-5718', 110),
('Ayþenur', 'Dumanlý', 'Kadýn', '84145520541', '(708)620 9593', 111),
('Gülizar', 'Gül', 'Kadýn','87168378161', '387 8 294', 112),
('Tolunay', 'Seven','Erkek','55702334370', '+90 (181) 0220317', 113),
('Kayra', 'Sakarya', 'Kadýn','87446064953', '789 9 405', 114),
('Milay', 'Tevetoðlu', 'Kadýn','21673056238', '+90(371)7058650', 115),
('Nurhayat', 'Aslan', 'Kadýn','16567094469', '+90 (413) 8113863', 116),
('Kemal', 'Fýrat', 'Erkek' ,'42886034236', '0886 195 76 12', 117),
('Gülden', 'Durmuþ', 'Kadýn','80444151670', '(289)755 8556', 118),
('Ece', 'Þafak', 'Kadýn','92993589743', '09836845776', 119),
('Melih' , 'Iþýk' , 'Erkek' , '34291174013' , '05453605758',120);


INSERT INTO Hemsire_Hasta (HemsireID, HastaID) VALUES
(1, 11), --Ýzmir
(1, 3),  --
(1, 7),  --
(2, 4),  --Bursa
(2, 8),  --
(2, 12), --
(3, 2),  --Ýstanbul 
(3, 6),  --
(3, 10), --
(4, 5),  --Ankara
(4, 9),  --
(4, 13), --
(5, 11), --Ýzmir
(5, 15), --
(5, 19), --
(6, 16), --Bursa
(6, 20), --
(6, 24), --
(7, 14), --Ýstanbul
(7, 18), --
(7, 21), --
(8, 17), --Ankara
(8, 22), --
(8, 26), --
(9, 23), --Ýzmir
(9, 27), --
(9, 31), --
(10, 28), --Bursa
(10, 32), --
(10, 36), --
(11, 25), --Ýstanbul
(11, 29), --
(11, 33), --
(12, 30), --Ankara
(12, 34), --
(12, 38), --
(13, 35), --Ýzmir
(13, 39), --
(13, 43), --
(14, 40), --Bursa
(14, 50), --
(14, 57), --
(15, 37), --Ýstanbul
(15, 41), --
(15, 44), --
(16, 42), --Ankara
(16, 45), --
(16, 48), --
(17, 46), --Ýzmir
(17, 49), --
(17, 53), --
(18, 61), --Bursa
(18, 65), --
(18, 69), --
(19, 47), --Ýstanbul
(19, 51), --
(19, 54), --
(20, 52), --Ankara
(20, 55), --
(20, 59), --
(21, 56), --Ýzmir
(21, 60), --
(21, 72), --
(1, 76), --Ýzmir
(1, 80), --
(2, 61), --Bursa
(2, 65), --
(3, 58), --Ýstanbul
(3, 62), -- 
(4, 79), --Ankara
(4, 83), --
(5, 68), --Ýzmir
(5, 72), --
(6, 69), --Bursa
(6, 73), --
(7, 66), --Ýstanbul
(7, 70), --
(8, 87), --Ankara
(8, 91), --
(9, 76), --Ýzmir
(9, 80), --
(10, 77), --Bursa
(10, 81), --
(11, 74), --Ýstanbul
(11, 78), --
(12, 95), --Ankara
(12, 99), --
(13, 76), --Ýzmir
(13, 80), --
(14, 85), --Bursa
(14, 89), --
(15, 82), --Ýstanbul 
(15, 86), --
(16, 91), --Ankara
(16, 99), --
(17, 96), --Ýzmir
(18, 93), --Bursa
(19, 98), --Ýstanbul
(20, 99); --Ankara

SELECT DISTINCT IlacAdi AS "Kullanýlan Ýlaç Listesi"
FROM KullanilanIlaclar;

SELECT IlacAdi, COUNT(DISTINCT HastaID) AS HastaSayisi
FROM KullanilanIlaclar
GROUP BY IlacAdi;


SELECT Ad, Soyad
FROM HastaBilgileri
WHERE Hastalýk = 'Diyabet';


SELECT Ad, Soyad
FROM HastaBilgileri
WHERE AcilDurum = 'Evet';


SELECT TOP 1 IlacAdi
FROM KullanilanIlaclar
GROUP BY IlacAdi
ORDER BY COUNT(*) DESC;


SELECT TOP 1 Hastalýk, COUNT(*) AS "En Yaygýn Hastalýk"
FROM HastaBilgileri
GROUP BY Hastalýk
ORDER BY COUNT(*) DESC;


SELECT Hastalýk
FROM HastaBilgileri
WHERE Ad = 'Can' AND Soyad = 'Zengin';


SELECT Ad, Soyad
FROM HastaBilgileri
WHERE HastaID IN (
SELECT HastaID
FROM KullanilanIlaclar
WHERE Tarih BETWEEN '2025-05-01' AND '2025-05-31'
);



SELECT Ad + ' ' + Soyad AS [Ad Soyad]
FROM HastaBilgileri
WHERE HastaID IN (
SELECT HastaID
FROM KullanilanIlaclar
WHERE IlacAdi = 'ecoprin'
);


SELECT Ad + ' ' + Soyad AS [Ad Soyad]
FROM HastaBilgileri
WHERE DogumTarihi BETWEEN '1970-01-01' AND '1980-12-31';


SELECT Ad, Soyad, DogumTarihi
FROM HastaBilgileri
WHERE DogumTarihi < '1960-01-01';


SELECT Ad, Soyad
FROM HastaBilgileri
WHERE AdresID IN (
SELECT AdresID
FROM Adresler
WHERE Ýl = 'Ankara'
);


SELECT Ad, Soyad
FROM Hemsireler
WHERE AdresID IN (
SELECT AdresID
FROM Adresler
WHERE Ýl = 'Ýzmir'
);


SELECT COUNT(*) AS "Bursa Hasta Sayisi"
FROM HastaBilgileri
WHERE AdresID IN (
SELECT AdresID
FROM Adresler
WHERE Ýl = 'Bursa'
);


select distinct h.Ad, h.Soyad from HastaBilgileri h
join KullanilanIlaclar k ON h.HastaID = k.HastaID
WHERE YEAR(k.Tarih) = 2024;


SELECT COUNT(*) AS KadýnHastaSayisi
FROM HastaBilgileri
WHERE Cinsiyet = 'Kadýn';


SELECT Ad, Soyad
FROM HastaBilgileri
WHERE Cinsiyet = 'Erkek';

SELECT COUNT(*)
FROM HastaBilgileri
WHERE HastaID IN (
SELECT HastaID
FROM Hemsire_Hasta
WHERE HemsireID = (
SELECT HemsireID
FROM Hemsireler
WHERE Ad = 'Zeliha' AND Soyad = 'Karadeniz'
)
);


SELECT TOP 1 Hastalýk
FROM HastaBilgileri
WHERE DogumTarihi < '1960-01-01'
GROUP BY Hastalýk
ORDER BY COUNT(*) DESC;


SELECT TOP 1 IlacAdi
FROM KullanilanIlaclar
WHERE HastaID IN (
SELECT HastaID
FROM HastaBilgileri
WHERE DogumTarihi < '1960-01-01'
)
GROUP BY IlacAdi
ORDER BY COUNT(*) DESC;

