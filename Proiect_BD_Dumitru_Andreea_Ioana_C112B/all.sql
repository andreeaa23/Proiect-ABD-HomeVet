---------------------------------------- CREARE BAZA DE DATE -------------------------------

-- 1. Creati baza de date cu un nume corespunzator.

create database TomService

ON PRIMARY
(
Name = TomServiceData1,
Filename = 'D:\Proiect_BD_Dumitru_Andreea_Ioana_C112B\TomService.mdf',
size = 10MB,
maxsize = 50MB,
filegrowth = 10MB
),
(
Name = TomServiceData2,
Filename = 'D:\Proiect_BD_Dumitru_Andreea_Ioana_C112B\TomService.ndf',
size = 10MB,
maxsize = 50MB,
filegrowth = 10MB
) --view trig cte procStocate tranz delete

LOG ON
(
Name = TomServiceLog1,
Filename = 'D:\Proiect_BD_Dumitru_Andreea_Ioana_C112B\TomService.ldf',
size = 10MB,
maxsize = 50MB,
filegrowth = 10MB
)

-- 2. Creati tabelul SERVICE

if OBJECT_ID('Service','U') is not null
drop table Service
go
CREATE TABLE Service
(
  idService INT not null PRIMARY KEY,
  Adresa nvarchar(64) not null,
  NrTelefon nvarchar(11) not null,
  Oras nvarchar(16) not null,
  Program nvarchar(16) not null
)


-- 3. Creati tabelul ANGAJATI

if OBJECT_ID('Angajati','U') is not null
drop table Angajati
go
CREATE TABLE Angajati
(
  idAngajat int not null PRIMARY KEY,
  idService int not null FOREIGN KEY REFERENCES Service(idService),
  Nume nvarchar(16) not null,
  Prenume nvarchar(16) not null,
  Adresa nvarchar(64),
  Oras nvarchar(32),
  DataNastere date not null,
  NrTelefon nvarchar(16) not null
)


-- 4. Creati tabelul FUNCTII

if OBJECT_ID('Functii','U') is not null
drop table Functii
go
CREATE TABLE Functii
(
  idFunctie int not null PRIMARY KEY,
  Denumire nvarchar(64) not null,

)


-- 5. Creati tabelul FUNTII ANGAJATI

if OBJECT_ID('FunctiiAngajati','U') is not null
drop table FunctiiAngajati
go
CREATE TABLE FunctiiAngajati
(
  idFunctieAngajat int not null PRIMARY KEY,
  idAngajat int not null FOREIGN KEY REFERENCES Angajati(idAngajat),
  idFunctie int not null FOREIGN KEY REFERENCES Functii(idFunctie),
  DataAngajare date not null,
  DataPlecare date,
  Sefi int
)
ALTER TABLE FunctiiAngajati ALTER COLUMN Sefi int NULL;
ALTER TABLE FunctiiAngajati
  ADD CONSTRAINT FK_Sefi FOREIGN KEY (Sefi) REFERENCES FunctiiAngajati(idFunctieAngajat)

-- 6. Creati tabelul PROPRIETAR

if OBJECT_ID('Proprietar','U') is not null
drop table Proprietar
go
CREATE TABLE Proprietar
(
  idProprietar int not null PRIMARY KEY,
  Nume nvarchar(32) not null,
  Prenume nvarchar(32) not null,
  Adresa nvarchar(64),
  Oras nvarchar(32) not null,
  NrTelefon nvarchar(11) not null,
  Email nvarchar(32)
)

 
-- 7. Creati tabelul AUTOVEHICUL

if OBJECT_ID('Autovehicul','U') is not null
drop table Autovehicul
go
CREATE TABLE Autovehicul
(
   idAutovehicul int not null PRIMARY KEY,
   Categorie nvarchar(16) not null,
   Model nvarchar(32) not null,
   Culoare nvarchar(16),
   Carburant nvarchar(16) not null,
   NrKm nvarchar(16) not null,
   PutereMotor int not null,
   SerieSasiu nvarchar(32) not null
)


-- 8. Creati tabelul AUTOVEHICULE PROPRIETAR

if OBJECT_ID('AutovehiculeProprietar','U') is not null
drop table AutovehiculeProprietar
go
CREATE TABLE AutovehiculeProprietar
(
  idProprietate int not null PRIMARY KEY,
  idProprietar int not null FOREIGN KEY REFERENCES Proprietar(idProprietar),
  idAutovehicul int not null FOREIGN KEY REFERENCES Autovehicul(idAutovehicul),
  NrInmatriculare nvarchar(10) not null
)


-- 9. Creati tabelul PROGRAMARI

if OBJECT_ID('Programari','U') is not null
drop table Programari
go
CREATE TABLE Programari
(
  idProgramare int not null PRIMARY KEY,
  idProprietate int not null FOREIGN KEY REFERENCES AutovehiculeProprietar(idProprietate),
  idService int not null FOREIGN KEY REFERENCES Service(idService),
  DataVenire date not null,
  DataIesire date
)


-- 10. Creati tabelul CATEGORIE

if OBJECT_ID('Categorie','U') is not null
drop table Categorie
go
CREATE TABLE Categorie
(
  idCategorie int not null PRIMARY KEY,
  Tip nvarchar(32) not null,
  Pret decimal(18,2) not null,
  Cantitate int not null
)


-- 11. Creati tabelul FURNIZORI

if OBJECT_ID('Furnizori','U') is not null
drop table Furnizori
go
CREATE TABLE Furnizori
(
  idFurnizor int not null PRIMARY KEY,
  Nume nvarchar(16) not null,
  Adresa nvarchar(64) not null,
  Oras nvarchar(32) not null,
  CodPostal nvarchar(8) not null,
  Tara nvarchar(16) not null,
  NrTelefon nvarchar(11) not null
)


-- 12. Creati tabelul PIESE

if OBJECT_ID('Piese','U') is not null
drop table Piese
go
CREATE TABLE Piese
(
   idPiesa int not null PRIMARY KEY,
   idCategorie int not null FOREIGN KEY REFERENCES Categorie(idCategorie),
   idFurnizor int not null FOREIGN KEY REFERENCES Furnizori(idFurnizor),
   Denumire nvarchar(32) not null,
)


-- 13. Creati tabelulL REPARATII

if OBJECT_ID('Reparatii','U') is not null
drop table Reparatii
go
CREATE TABLE Reparatii
(
   idReparatie int not null PRIMARY KEY,
   idProgramare int not null FOREIGN KEY REFERENCES Programari(idProgramare),
   idPiesa int not null FOREIGN KEY REFERENCES Piese(idPiesa),
   Defectiune nvarchar(32) not null,
   Taxa decimal(18,2) not null,
   Manopera decimal(18,2) not null
  -- PretTotal decimal(18,2) not null
)


--14. Creati tabelulL REPARATII AUTOVEHICULE

if OBJECT_ID('ReparatiiAutovehicule','U') is not null
drop table ReparatiiAutovehicule
go
CREATE TABLE ReparatiiAutovehicule
(
   idReparatieAuto int not null PRIMARY KEY,
   idReparatie int not null FOREIGN KEY REFERENCES Reparatii(idReparatie),
   idAngajat int not null FOREIGN KEY REFERENCES Angajati(idAngajat)
)


-- 15. Creati tabelul SALARIU

if OBJECT_ID('Salariu','U') is not null
drop table Salariu
go
CREATE TABLE Salariu
(
   idSalariu int not null PRIMARY KEY,
   idFunctieAngajat int not null FOREIGN KEY REFERENCES FunctiiAngajati(idFunctieAngajat),
   SalariuBrut money not null,
   DataIntrareVigoare date not null,
   DataIesireVigoare date
)


-- 16. Creati tabelul IMPOZITE

if OBJECT_ID('Impozite','U') is not null
drop table Impozite
go
CREATE TABLE Impozite
(
   idImpozit int not null PRIMARY KEY,
   Nume nvarchar(32) not null,
   Procent decimal(18,2) not null
)


-- 17. Creati tabelul IMPOZITE SALARIU

if OBJECT_ID('ImpoziteSalariu','U') is not null
drop table ImpoziteSalariu
go
CREATE TABLE ImpoziteSalariu
(
   idImpoziteSalariu int not null PRIMARY KEY,
   idSalariu int not null FOREIGN KEY REFERENCES Salariu(idSalariu),
   idImpozit int not null FOREIGN KEY REFERENCES Impozite(idImpozit)
)

----------------------------------------- INSERT QUERIES(48) ---------------------------------------


-- 18. Inserati inregistrari in tabelul SERVICE:

INSERT INTO Service(idService,Adresa,NrTelefon,Oras,Program) VALUES
(1,'str. Bobilna, nr. 12','0712345678','Ploiesti','Non-stop'),
(2,'str. Sforii, nr. 10','0798765432','Brasov','Non-stop'),
(3,'str. Viilor, nr. 30','0722334455','Bucuresti','Non-stop'),
(4,'str. Latina, nr.48','0799887766','Timisoara','Non-stop'),
(5,'str. Constructorilor, nr. 3','0744567788','Constanta','Non-stop')
INSERT INTO Service(idService,Adresa,NrTelefon,Oras,Program) VALUES
(6,'str. Gh. Doja, nr. 189','0789987667','Sibiu','Inchis') --service fara programare
--(7,'str. Castanelor, nr. 6','0745678788','Cluj-Napoca','Non-stop')

-- 19. Inserati inregistrari in tabelul PROPRIETAR:

INSERT INTO Proprietar(idProprietar,Nume,Prenume,Adresa,Oras,NrTelefon,Email) VALUES
(1,'Barbu','Madalina','str. Mihai Viteazu, nr. 3','Paulesti','0737658967','madalina.barbu@mta.ro'),
(2,'Craciun','Cristian','str. Patriei, nr. 10','Navodari','0788456723','cristian.craciun@mta.ro'),
(3,'Soare','Octavian','str. Fagului, nr.2','Brazii de Jos','0723325665','soare.octavina@mta.ro'),
(4,'Ionita','Daniel','str. Merilor, nr. 19','Craiova','0733355578','daniel.ionita@mta.ro'),
(5,'Moise','Sarah','str. Fat-Frumos, nr. 12-13','Alba-Iulia','0766688899','sarah.moise@mta.ro')
INSERT INTO Proprietar(idProprietar,Nume,Prenume,Adresa,Oras,NrTelefon,Email) VALUES
(6,'Toma','Cristina','str. Principala, nr. 34A','Mamaia','0722335566','cristina.toma@mta.ro'),
(7,'Chiva','Elena','str. Primaverii, nr. 90-91','Galati','0712332145','elena.chiva@mta.ro'),
(8,'Petrea','Tudor','str. Muresului, nr. 7A','Iasi','0799999988','tudor.petrea@mta.ro'),
(9,'Ilie','Roxana','str. Fericirii, nr. 759','Ciorani','0766655534','roxana.ilie@mta.ro'),
(10,'Onea', 'George','str. Democratiei, nr. 11','Sighisoara','0777777788','george.onea@mta.ro')

-- 20. Inserati inregistrari in tabelul AUTOVEHICUL: 

INSERT INTO Autovehicul(idAutovehicul,Categorie,Model,Culoare,Carburant,NrKm,PutereMotor,SerieSasiu) VALUES
(1,'Autoturism','Peugeot 508','Negru','Benzina','198.123',112,'AB01CDE34F1234567'),
(2,'Autoturism','BMW Seria 3','Argintiu','Motorina','203.125',180,'WCDYC7CF8DX201851'),
(3,'Autoturism','Audi A5','Maro','Motorina','245.560',195,'WBAGG83461DN81194'),
(4,'Motocicleta','Honda VFR 800x','Alb','Motorina','150.255',102,'JH2PC35051M200020'),
(5,'Autoturism','Volkswagen Passat CC','Maro','Benzina','199.000',170,'1G1YY24UX5X7120EX')

INSERT INTO Autovehicul(idAutovehicul,Categorie,Model,Culoare,Carburant,NrKm,PutereMotor,SerieSasiu) VALUES
(6,'Autoturism','Skoda Octavia','Verde','Motorina','178.980',115,'WAULC68E92A140677'),
(7,'Autoturism','Citroen C4','Rosu','Electric','150.000',120,'1HGBH41JXMN109186'),
(8,'Autoturism','Audi Q7','Albastru','Motorina','50.000',286,'LJCPCBLCX11000237'),
(9,'Autoturism','Mercedes GLC','Alb','Benzina','103.520',194,'SGES000EX5CRC0199'),
(10,'Autoturism','Peugeot 308','Negru','Benzina','256.000',108,'WF04XXGBB4YS85432'),
(11,'Autoturism','Dacia Logan','Negru','Motorina','190.520',100,'SKES030ER5CPO0189')



-- 21. Inserati inregistrari in tabelul AUTOVEHICULE PROPRIETAR 

INSERT INTO AutovehiculeProprietar(idProprietate,idProprietar,idAutovehicul,NrInmatriculare) VALUES
(1,1,3,'PX03BRB'),
(2,2,5,'CT76CCC'),
(3,4,2,'DJ32DNY'),
(4,3,8,'PH18SUN')
INSERT INTO AutovehiculeProprietar(idProprietate,idProprietar,idAutovehicul,NrInmatriculare) VALUES
(5,8,9,'IS12TDR'),
(6,9,1,'PH01RXV'),
(7,7,4,'GL45ELE'),
(8,10,10,'MS08NEA'),
(9,5,6,'AB67SRA'),
(10,6,7,'CT17CRS'),
(11,6,11,'CT78CSS')

-- 22. Inserati inregistrari in tabelul ANGAJATI

---angajati SERVICE cu id=1 cu locatia in Ploiesti
INSERT INTO Angajati(idAngajat,idService,Nume,Prenume,Adresa,Oras,DataNastere,NrTelefon) VALUES
(1,1,'Dumitru','Victoria','str. Postei, nr. 89','Ploiesti','1977-01-28','0789898989'),
(2,1,'Aciu','Lia','str. Rafiei, nr. 3','Ploiestiori','1978-01-05','0790909090'),
(3,1,'Badic','Mihai','str. Plopeni, nr. 9','Paulesti','1974-02-15','0767676767'),
(4,1,'Badea','Ion','str. Boldesti, nr. 178','Ploiesti', '1987-11-23','0734343434'),
(5,1,'Coca','Eugen','str. Bazaltului, nr. 19','Tantareni','1989-11-20','0723342356')
INSERT INTO Angajati(idAngajat,idService,Nume,Prenume,Adresa,Oras,DataNastere,NrTelefon) VALUES
(6,1,'Lascu','Dan','str. Militari, nr. 46','Bucov','1990-11-11','0712333344'),
(7,1,'Enache','Sorin','str. Crisu Alb, nr. 2','Albesti-Paleologu','1998-02-17','0737834155'),
(8,1,'Munteanu','Adrian','str. Carpati, nr. 897','Ploiesti','1985-02-28','0721929239'),
(9,1,'Ofrim','Dragos','str. Transilvaniei, nr. 27','Ploiesti','1980-11-30','0756677888'),
(10,1,'Neamtu','Liviu','str. Bucegi, nr. 3A','Blejoi', '1986-04-18','0756544332')

---angajati SERVICE cu id=2 cu locatia in Brasov
INSERT INTO Angajati(idAngajat,idService,Nume,Prenume,Adresa,Oras,DataNastere,NrTelefon) VALUES
(11,2,'Munteanu','George','str. Zeicani, nr. 2','Predeal','1987-03-28','0789900988'),
(12,2,'Radu','Serghei','str. Prasilei, nr. 178','Brasov','1990-02-14','0756776589'),
(13,2,'Samoilescu','Gheorghe','str. Amara, nr. 9','Sinaia','1984-11-26','0767676769'),
(14,2,'Stoian','Dan','str. Panselelor, nr. 18','Azuga','1991-09-25','0756678790'),
(15,2,'Topa','Vasile','str. Zambilelor, nr. 2','Brasov','1982-01-09','0734433443')
INSERT INTO Angajati(idAngajat,idService,Nume,Prenume,Adresa,Oras,DataNastere,NrTelefon) VALUES
(16,2,'Voncila','Ionel','str. Soarelui, nr. 456','Brasov','1996-12-13','0788888888'),
(17,2,'Voicu','Violeta','str. Garofitei, nr. 18','Brasov','1983-12-27','0723445665'),
(18,2,'Ursachi','Robert','str. Mierei, nr. 12A','Busteni','1981-02-02','0789987656'),
(19,2,'Teodor','Emanuel','str. Nicoarei, nr. 89','Brasov','1996-04-21','0711122231'),
(20,2,'Timoftei','Radu','str. Bucurei, nr. 9','Brasov','1974-02-15','0723472476')


---angajati SERVICE cu id=3 cu locatia in Bucuresti
INSERT INTO Angajati(idAngajat,idService,Nume,Prenume,Adresa,Oras,DataNastere,NrTelefon) VALUES
(21,3,'Dima','Stefan','str. Urziceni, nr. 18','Bragadiru','1998-02-17','0721314151'),
(22,3,'Darie','George','str. Resita, nr. 8','Bucuresti','1994-06-19','0742526272'),
(23,3,'Herdea','Adrian','str. Stelelor, nr. 780','Pipera','1997-03-06','0753599787'),
(24,3,'Radu','Codrut','str. Principala, nr. 5','Bucuresti','1992-01-05','0789858412'),
(25,3,'David','Alexandru','str. Luica, nr. 8','Balotesti','1980-12-08','0789624153')
INSERT INTO Angajati(idAngajat,idService,Nume,Prenume,Adresa,Oras,DataNastere,NrTelefon) VALUES
(26,3,'Miclaus','Marian','str. Zanoaga, nr. 46','Bucuresti','1996-12-13','0788778888'),
(27,3,'Petrea','Victor','str. Scropoasa, nr. 8','Gherghita','1983-12-27','0723435665'),
(28,3,'Popescu','Cornel','str. Odei, nr. 1','Bucuresti','1981-02-02','0789187656'),
(29,3,'Purcaru','Emil','str. Pogoanele, nr. 83','Pipera','1996-04-21','0731122231'),
(30,3,'Popovici','Andrei','str. Ciubarului, nr. 79','Balotesti','1974-02-15','0723572476')


---angajati SERVICE cu id=4 cu locatia in Timisoara
INSERT INTO Angajati(idAngajat,idService,Nume,Prenume,Adresa,Oras,DataNastere,NrTelefon) VALUES
(31,4,'Dima','Cosmin','str. Lacului, nr. 128','Timisoara','1998-03-17','0722314151'),
(32,4,'Ursu','George','str. Simleu, nr. 38','Timisoara','1994-06-13','0742526282'),
(33,4,'Soare','Octavian','str. Morii, nr. 70','Timisoara','1997-08-05','0753599789'),
(34,4,'Radu','Toader','str. Zapezii, nr. 57','Timisoara','1992-05-13','0789858413'),
(35,4,'David','Ionut','str. Raureni, nr. 85','Timisoara','1980-08-17','0789637153')
INSERT INTO Angajati(idAngajat,idService,Nume,Prenume,Adresa,Oras,DataNastere,NrTelefon) VALUES
(36,4,'Miclaus','Marin','str. Docuri, nr. 63','Timisoara','1996-12-11','0788677833'),
(37,4,'Petre','Victoras','str. Radacinei, nr. 81','Timisoara','1983-12-30','0723315661'),
(38,4,'Ionescu','Corneliu','str. Semanatorului, nr. 91','Timisoara','1981-02-22','078913256'),
(39,4,'Vasilache','Serbastian','str. Florica, nr. 283','Timisoara','1996-04-23','0741135231'),
(40,4,'Popescu','Vlad','str. Paunului, nr. 739','Timisoara','1974-02-15','0763586476')


---angajati SERVICE cu id=5 cu locatia in Constanta
INSERT INTO Angajati(idAngajat,idService,Nume,Prenume,Adresa,Oras,DataNastere,NrTelefon) VALUES
(41,5,'Dumitrascu','Vasile','str. Veseliei, nr. 32','Constanta','1978-01-28','0789898999'),
(42,5,'Achim','Liliana','str. Stanescu, nr. 30','Navodari','1977-01-05','0790909091'),
(43,5,'Badea','Tudor','str. Stana de Vale, nr.89','Mamaia','1974-03-15','0767676777'),
(44,5,'Tudose','Mihai','str. Doina, nr. 18','Constanta', '1987-12-23','0734343334'),
(45,5,'Raicu','Andrei','str. Telita, nr. 99','Mamaia','1997-11-20','0723342387')
INSERT INTO Angajati(idAngajat,idService,Nume,Prenume,Adresa,Oras,DataNastere,NrTelefon) VALUES
(46,5,'Lascuzeanu','Daniel','str. Dunavat, nr. 66','Jupiter','1995-11-11','0735333344'),
(47,5,'Avram','Sorinel','str. Ferentari, nr. 22','Constanta','1998-07-18','0738934155'),
(48,5,'Aldea','Adrian','str. Rahovei, nr. 877','Mamaia','1985-04-28','0721929240'),
(49,5,'Iordache','Dragos','str. Barnova, nr. 277','Constanta','1988-12-30','0756678388'),
(50,5,'Rusu','Liviu','str.Iancu Jianu, nr. 33','Constanta', '1986-07-18','0756544212')



-- 23. Inserati inregistrari in tabelul FUNCTII

INSERT INTO Functii(idFunctie,Denumire) VALUES
(1,'Vopsitor'),
(2,'Mecanic auto'),
(3,'Manager'),
(4,'Electrician'),
(5,'Contabil')
INSERT INTO Functii(idFunctie,Denumire) VALUES
(6, 'Tinichigiu'),
(7,'Inginer diagnoza'),
(8,'Tehnician'),
(9,'Dispecer'),
(10,'Patron'),
(11,'Inspector ITP'),
(12,'Mecanic mentenanta')


-- 24. Inserati inregistrari in tabelul FUNCTII ANGAJATI 

INSERT INTO FunctiiAngajati(idFunctieAngajat,idAngajat,idFunctie,DataAngajare,DataPlecare,Sefi) VALUES
(1,1,10,'2005-05-17',NULL,NULL),
(2,2,3,'2008-07-25',NULL,1),
(3,3,5,'2008-08-23',NULL,2),
(4,4,4,'2009-09-20',NULL,2),
(5,5,12,'2011-11-15',NULL,2)
INSERT INTO FunctiiAngajati(idFunctieAngajat,idAngajat,idFunctie,DataAngajare,DataPlecare,Sefi) VALUES
(6,6,1,'2008-02-06',NULL,2),
(7,7,2,'2010-12-30',NULL,2),
(8,8,11,'2012-01-04',NULL,2),
(9,9,8,'2009-03-23',NULL,2),
(10,10,7,'2018-04-04',NULL,2)

--INSERT INTO FunctiiAngajati(idFunctieAngajat,idAngajat,idFunctie,DataAngajare,DataPlecare,Sefi) VALUES --angajatul cu 2 fct
--(51,7,12,'2010-12-30',NULL,2)


INSERT INTO FunctiiAngajati(idFunctieAngajat,idAngajat,idFunctie,DataAngajare,DataPlecare,Sefi) VALUES
(11,11,3,'2017-08-18',NULL,1),
(12,12,9,'2008-07-20',NULL,11),
(13,13,5,'2020-01-06',NULL,11),
(14,14,4,'2011-09-08',NULL,11),
(15,15,6,'2013-11-15',NULL,11)
INSERT INTO FunctiiAngajati(idFunctieAngajat,idAngajat,idFunctie,DataAngajare,DataPlecare,Sefi) VALUES
(16,16,1,'2021-02-06',NULL,11),
(17,17,2,'2020-12-30',NULL,11),
(18,18,11,'2004-01-04',NULL,11),
(19,19,8,'2008-03-23',NULL,11),
(20,20,7,'2005-04-04',NULL,11)


INSERT INTO FunctiiAngajati(idFunctieAngajat,idAngajat,idFunctie,DataAngajare,DataPlecare,Sefi) VALUES
(21,21,3,'2014-03-08',NULL,1),
(22,22,6,'2008-11-25',NULL,21),
(23,23,5,'2017-03-03',NULL,21),
(24,24,4,'2007-09-20',NULL,21),
(25,25,12,'2019-12-15',NULL,21)
INSERT INTO FunctiiAngajati(idFunctieAngajat,idAngajat,idFunctie,DataAngajare,DataPlecare,Sefi) VALUES
(26,26,1,'2010-01-06',NULL,21),
(27,27,2,'2011-08-29',NULL,21),
(28,28,9,'2014-02-02',NULL,21),
(29,29,8,'2020-07-20',NULL,21),
(30,30,7,'2016-05-19',NULL,21)


INSERT INTO FunctiiAngajati(idFunctieAngajat,idAngajat,idFunctie,DataAngajare,DataPlecare,Sefi) VALUES
(31,31,3,'2005-05-17',NULL,1),
(32,32,6,'2008-07-25',NULL,31),
(33,33,5,'2008-08-23',NULL,31),
(34,34,4,'2009-09-20',NULL,31),
(35,35,12,'2011-11-15',NULL,31)
INSERT INTO FunctiiAngajati(idFunctieAngajat,idAngajat,idFunctie,DataAngajare,DataPlecare,Sefi) VALUES
(36,36,1,'2008-02-06',NULL,31),
(37,37,2,'2010-12-30',NULL,31),
(38,38,11,'2012-01-04',NULL,31),
(39,39,8,'2009-03-23',NULL,31),
(40,40,7,'2018-04-04',NULL,31)


INSERT INTO FunctiiAngajati(idFunctieAngajat,idAngajat,idFunctie,DataAngajare,DataPlecare,Sefi) VALUES
(41,41,3,'2010-05-17',NULL,1),
(42,42,9,'2016-07-25',NULL,41),
(43,43,5,'2015-08-23',NULL,41),
(44,44,4,'2009-10-20',NULL,41),
(45,45,12,'2011-05-15',NULL,41)
INSERT INTO FunctiiAngajati(idFunctieAngajat,idAngajat,idFunctie,DataAngajare,DataPlecare,Sefi) VALUES
(46,46,1,'2008-02-06',NULL,41),
(47,47,2,'2010-12-30',NULL,41),
(48,48,11,'2012-01-04',NULL,41),
(49,49,8,'2009-03-23',NULL,41),
(50,50,7,'2018-04-04',NULL,41)

INSERT INTO FunctiiAngajati(idFunctieAngajat,idAngajat,idFunctie,DataAngajare,DataPlecare,Sefi) VALUES --angajatul cu 2 fct
(51,7,12,'2010-12-30',NULL,2)


-- 25. Inserati inregistrari in tabelul CATEGORIE:

INSERT INTO Categorie(idCategorie,Tip,Pret,Cantitate) VALUES
(1,'Ulei',60,100),
(2,'Suruburi',5,350),
(3,'Vopsea',35,400),
(4,'Radiator',100,200),
(5,'Bujii',70,800)
INSERT INTO Categorie(idCategorie,Tip,Pret,Cantitate) VALUES
(6,'Antigel',150,417),
(7,'Parbriz',700,500),
(8,'Baterii',350,80),
(9,'Becuri',10,985),
(10,'Furtun',45,800)
INSERT INTO Categorie(idCategorie,Tip,Pret,Cantitate) VALUES
(11,'Filtre',100,652)

-- 26. Inserati inregistrari in tabelul FURNIZORI:


INSERT INTO Furnizori(idFurnizor,Nume,Adresa,Oras,CodPostal,Tara,NrTelefon) VALUES
(1,'Total','str. Stejarilor, nr. 2','Brasov','507055',' Romania','0268401711'),
(2,'Bosch','49 Gilbert St.','Munchen','EC1 4SD','Germania','1715552222'),
(3,'A.B.S.','Josef-Orlopp-Strabe 55','Berlin','10365','Germania','0316302230'),
(4,'Ridex','92 Setsuko Chuo-ku','Osaka','545','Japonia','064317877'),
(5,'Stark','Kaloadagatan 13','Göteborg','S-345 67','Suedia','0319876543'),
(6,'Van Wezel','Tiergartenstraße 5','Berlin','10785','Germania','0109984510'),
(7,'Mann Filter','Sales Representative','Ravenna','48100','Italia','054460323')

-- 27. Inserati inregistrari in tabelul PIESE:

INSERT INTO Piese(idPiesa,idCategorie,idFurnizor,Denumire) VALUES
(1,1,1,'Ulei motor'),
(2,2,4,'Suruburi metrice'),
(3,3,6,'Vopsea Neagra'),
(4,3,6,'Vopsea Alba'),
(5,3,6,'Vopsea Gri'),
(6,3,6,'Vopsea Rosie'),
(7,3,6,'Vopsea Albastra'),
(8,4,4,'Radiator de racire auto'),
(9,5,2,'Bujii'),
(10,6,7,'Antigel')
INSERT INTO Piese(idPiesa,idCategorie,idFurnizor,Denumire) VALUES
(11,7,5,'Parbriz'),
(12,7,5,'Geamuri laterale'),
(13,7,5,'Luneta'),
(14,8,2,'Acumulator auto'),
(15,9,3,'Becuri auto'),
(16,10,7,'Furtun'),
(17,11,7,'Filtru polen'),
(18,11,7,'Filtru aer'),
(19,11,7,'Filtru ulei'),
(20,11,7,'Filtru combustibil')


-- 28. Inserati inregistrari in tabelul IMPOZITE:

INSERT INTO Impozite(idImpozit,Nume,Procent) VALUES
(1,'Asigurare Sanatate',25),
(2,'Asigurare Sociala',10),
(3,'Impozit pe Venit',10),
(4,'CAM',2.25)


-- 29. Inserati inregistrari in tabelul SALARIU:

INSERT INTO Salariu(idSalariu,idFunctieAngajat,SalariuBrut,DataIntrareVigoare,DataIesireVigoare) VALUES
(1,1,2200,'2020-02-23',NULL),
(2,2,3000,'2021-05-26',NULL),
(3,3,6000,'2022-03-17',NULL),
(4,4,2300,'2021-02-23','2021-10-29'),
(5,4,2500,'2021-10-30',NULL),
(6,5,4675,'2022-03-25',NULL),
(7,6,2000,'2021-12-14',NULL)
INSERT INTO Salariu(idSalariu,idFunctieAngajat,SalariuBrut,DataIntrareVigoare,DataIesireVigoare) VALUES
(8,7,2460,'2019-09-01',NULL),
(9,8,2030,'2020-08-26',NULL),
(10,9,1950,'2020-10-10',NULL),
(11,10,7800,'2021-04-04',NULL),
(12,11,2840,'2020-06-02',NULL),
(13,12,2610,'2017-05-02','2020-05-05'),
(14,12,2715,'2020-05-06',NULL)


-- 30. Inserati inregistrari in tabelul IMPOZITE SALARIU:

INSERT INTO ImpoziteSalariu(idImpoziteSalariu,idSalariu,idImpozit) VALUES
(1,1,1),
(2,1,2),
(3,1,3),
(4,1,4),
(5,2,1),
(6,2,2),
(7,2,3),
(8,2,4),
(9,3,1),
(10,3,2),
(11,3,3),
(12,3,4)
INSERT INTO ImpoziteSalariu(idImpoziteSalariu,idSalariu,idImpozit) VALUES
(13,4,1),
(14,4,2),
(15,4,3),
(16,4,4),
(17,5,1),
(18,5,2),
(19,5,3),
(20,5,4),
(21,6,1),
(22,6,2),
(23,6,3),
(24,6,4),
(25,7,1),
(26,7,2),
(27,7,3),
(28,7,4),
(29,8,1)
INSERT INTO ImpoziteSalariu(idImpoziteSalariu,idSalariu,idImpozit) VALUES
(30,8,2),
(31,8,3),
(32,8,4),
(33,9,1),
(34,9,2),
(35,9,3),
(36,9,4),
(37,10,1),
(38,10,2),
(39,10,3),
(40,10,4),
(41,11,1),
(42,11,2),
(43,11,3),
(44,11,4),
(45,12,1),
(46,12,2),
(47,12,3),
(48,12,4)


-- 31. Inserati inregistrari in tabelul PROGRAMARI:

INSERT INTO Programari(idProgramare,idProprietate,idService,DataVenire,DataIesire) VALUES
(1,1,1,'2022-04-20',NULL),
(2,2,5,'2022-04-20',NULL),
(3,3,4,'2022-04-10','2022-04-20'),
(4,4,1,'2022-03-02','2022-03-18'),
(5,5,2,'2022-01-23','2022-01-29'),
(6,6,1,'2022-04-20',NULL)
INSERT INTO Programari(idProgramare,idProprietate,idService,DataVenire,DataIesire) VALUES
(7,7,2,'2021-12-25','2022-01-05'),
(8,8,4,'2021-11-23','2021-12-03'),
(9,9,4,'2021-08-08','2021-09-01'),
(10,10,5,'2022-02-17','2022-02-19'),
(11,11,5,'2022-04-20',NULL)


-- 32. Inserati inregistrari in tabelul REPARATII:

INSERT INTO Reparatii(idReparatie,idProgramare,idPiesa,Defectiune,Taxa,Manopera) VALUES
(1,1,1,'Schimb ulei',0.1,12),
(2,1,19,'Schimb ulei',0.1,20),
(3,2,13,'Inlocuire luneta',0.5,50),
(4,3,3,'Vopsire si polish',0.6,48),
(5,4,15,'Inlocuire baterie auto',0.2,21),
(6,5,10,'Completare antigel',0.1,5),
(7,6,17,'Schimbare filtre',0.1,10),
(8,6,18,'Schimbare filtre',0.1,10)
INSERT INTO Reparatii(idReparatie,idProgramare,idPiesa,Defectiune,Taxa,Manopera) VALUES
(9,6,20,'Schimbare filtre',0.1,10),
(10,7,9,'Inlocuire bujii',0.05,5),
(11,7,2,'Inlocuire suruburi',0.02,5),
(12,8,15,'Schimbare becuri',0.1,5),
(13,9,8,'Inlocuire radiator',0.2,30),
(14,9,18,'Schimbare filtru aer',0.1,10),
(15,10,16,'Schimb furtun lichid parbriz',0.1,5),
(16,11,11,'Inlocuire parbriz',0.5,50)



-- 33. Inserati inregistrari in tabelul REPARATII AUTOVEHICULE:

INSERT INTO ReparatiiAutovehicule(idReparatieAuto,idReparatie,idAngajat) VALUES
(1,1,10),
(2,1,10), --prima reparatie
(3,2,49),
(4,2,44), -- a doua reparatie
(5,3,36), --3
(6,4,4), --4
(7,5,17), --5
(8,6,10), --6
(9,6,7),
(10,6,8),
(11,6,10), 
(12,7,17),--7
(13,8,34), --8
(14,9,35),
(15,9,34), --9
(16,10,47), --10
(17,11,44),
(18,11,45) --11



-----------------------------------------------SELECT(30) ---------------------------------------------
select * from Autovehicul
select * from AutovehiculeProprietar
select * from Proprietar
select * from Angajati
select * from Functii
select * from FunctiiAngajati
select * from Service
select * from Piese
select * from Furnizori
select * from Categorie
select * from Salariu
select * from Impozite
select * from ImpoziteSalariu


-- 34. Afisati toti numele si prenumele angajatilor ce au functia de manager.

select a.Nume as NumeAngajati, a.Prenume as PrenumeAngajati
from FunctiiAngajati as fa
inner join Angajati as a on fa.idAngajat=a.idAngajat
inner join Functii as f on fa.idFunctie=f.idFunctie
where f.Denumire='Manager'


-- 35. Afisati numele si prenumele angajatilor care s-au angajat dupa anul 2008.

select a.Nume as NumeAngajati,a.Prenume as PrenumeAngajati,fa.DataAngajare as DataAngajare
from FunctiiAngajati as fa
inner join Angajati as a on fa.idAngajat=a.idAngajat
where year(fa.DataAngajare) > 2008

--select *
--from Autovehicul
--where idAutovehicul=4
--update Autovehicul
--set Categorie='Motocicleta'
--where idAutovehicul=4

-- 36. Afisati toate vehiculele din categoria motocicleta.
select *
from Autovehicul
where Categorie='Motocicleta'

-- 37. Afisati proprietarii ce detin autovehicule din categoria motocicleta.

select p.Nume as Nume,p.Prenume as Prenume,a.Categorie as Categorie
from AutovehiculeProprietar as ap
inner join Proprietar p on ap.idProprietar=p.idProprietar
inner join Autovehicul a on ap.idAutovehicul=a.idAutovehicul
where a.Categorie='Motocicleta'


-- 38. Afisati angajatii ce lucreaza la service-ul din Bucuresti.

select a.Nume as NumeAngajati, a.Prenume as PrenumeAngajati,s.Oras as Oras
from Angajati a
inner join Service s on a.idService=s.idService
where s.Oras='Bucuresti'


-- 39. Afisati numele si prenumele patronului ce detine lantul de service-uri auto.

select a.Nume as NumePatron, a.Prenume as PrenumePatron
from FunctiiAngajati as fa
inner join Angajati as a on fa.idAngajat=a.idAngajat
inner join Functii as f on fa.idFunctie=f.idFunctie
where f.Denumire='Patron'

--sau

select distinct a.Nume+' '+a.Prenume as Sef
from FunctiiAngajati fa 
inner join Angajati as a on fa.idAngajat=a.idAngajat
inner join Functii as f on fa.idFunctie=f.idFunctie
where fa.Sefi is null

-- 40. Selectati toate autovehiculele ce au carburantul benzina.

select a.Model as Model, a.Carburant as Carburant
from Autovehicul a
where a.Carburant='#Benzina'

-- 41. Afisati toti proprietarii ce detin autovehicule ce au carburantul motorina.

select p.Nume as Nume,p.Prenume as Prenume,a.Model as Model,a.Carburant as Carburant
from AutovehiculeProprietar as ap
inner join Proprietar p on ap.idProprietar=p.idProprietar
inner join Autovehicul a on ap.idAutovehicul=a.idAutovehicul
where a.Carburant='Motorina'

-- 42. Selectati autoturismele ce au peste 120 CP si numele proprietarilor lor.

select p.Nume as Nume,p.Prenume as Prenume,a.Model as Model, a.PutereMotor as PutereMotor
from AutovehiculeProprietar as ap
inner join Proprietar p on ap.idProprietar=p.idProprietar
inner join Autovehicul a on ap.idAutovehicul=a.idAutovehicul
where a.PutereMotor > 120

-- 43. Afisati toti angajatii cu varsta peste 30 de ani.

select a.Nume as Nume, a.Prenume as Prenume,year(a.DataNastere) as AnNastere, DATEDIFF(year,a.DataNastere,current_timestamp) as Varsta
from Angajati a
where  DATEDIFF(year,a.DataNastere,current_timestamp) > 30

-- 44. Afisati toate piesele din categoria 'Filtre'.

select p.Denumire as Filtre
from Piese p
inner join Categorie c on p.idCategorie=c.idCategorie
where c.Tip='Filtre'


-- 45. Afisati numele furnizorului care livreaza piese din categoria 'Parbriz'.

select distinct f.Nume as Nume
from Piese p
inner join Categorie c on p.idCategorie=c.idCategorie
inner join Furnizori f on p.idFurnizor=f.idFurnizor
where c.Tip='Parbriz'


-- 46. Scrieti o interogare care sa afiseze numarul de produse din fiecare categorie si numele categoriei.

select c.Tip as Categorie, c.Cantitate as Cantitate
from Categorie c

-- 47. Afisati toate orasele din 'Germania' in care furnizorii de piese au sediul.

select f.Oras as Oras
from Furnizori f
where f.Tara='Germania'

-- 48. Afisati toate orasele din 'Germania' in care furnizorii de piese au sediul. Afisati si categoriile de piese
--     pe care le fabrica si denumirea furnizorului.


select distinct f.Oras as Oras, c.Tip as Categorie, f.Nume as Furnizor
from Piese p
inner join Categorie c on p.idCategorie=c.idCategorie
inner join Furnizori f on p.idFurnizor=f.idFurnizor
where f.Tara='Germania'

-- 49. Afisati toate salariile ce au suferit modificari.

select s.SalariuBrut as Salariu
from Salariu s
inner join FunctiiAngajati fa on s.idFunctieAngajat=fa.idFunctieAngajat
where s.DataIesireVigoare is not null

-- 50. Afisati toate impozitele pentru functiile angajatilor cu id=3.

select i.Nume as Impozite
from ImpoziteSalariu imp
inner join Salariu s on imp.idSalariu=s.idSalariu
inner join Impozite i on imp.idImpozit=i.idImpozit
where s.idFunctieAngajat=3


-- 51. Afisati salariile brute ordonate descrescator.

select SalariuBrut
from Salariu
order by SalariuBrut desc

-- 52. Selectati toti angajatii nascuti in data de '1996-04-21'

select a.Nume+' '+a.Prenume as NumeAngajati
from Angajati a
where a.DataNastere='1996-04-21'

-- 53. Afisati toti angajati ai caror nume incepe cu 'A'.

select *
from Angajati
where Nume like 'A%'

-- 54. Afisati toate masinile inregistrate in service-ul cu id=1 si numele proprietarilor acestora.

select prop.Nume+' '+prop.Prenume as Proprietar, auto.Model as Model, ap.NrInmatriculare as NrInmatriculare
from AutovehiculeProprietar ap
inner join Programari p on ap.idProprietate=p.idProprietate
inner join Proprietar prop on ap.idProprietar=prop.idProprietar
inner join Autovehicul auto on ap.idAutovehicul=auto.idAutovehicul
where p.idService=1

-- 55. Sa se afiseze toti angajatii al caror nume incepe cu "Dum".

select a.Nume+' '+a.Prenume as NumeAngajat
from Angajati a
where a.Nume like 'Dum%'

-- 56. Sa se afiseze toti angajatii nascuti dupa data de '1980-01-01'.

select a.Nume+' '+a.Prenume as NumeAngajat, a.DataNastere
from Angajati a
where a.DataNastere > '1980-01-01'

-- 57. Sa se afiseze toate salariile pentru fiecare functie, ordonate crescator.

select distinct f.Denumire as Functie, s.SalariuBrut
from FunctiiAngajati fa
inner join Salariu s on fa.idFunctieAngajat=s.idFunctieAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
order by s.SalariuBrut asc

-- 58. Sa se afiseze urmatoarele 5 programari in ordine crescatoare.

select top(5) *
from Programari p
order by p.DataVenire asc

-- 59. Sa se afiseze angajatii nascuti in luna februarie, august, octombrie sau decembrie, 
--ordonati crescator dupa anul nasterii.

select *
from Angajati a
where DATEPART(m,a.DataNastere) IN (2,8,10,12)
order by DATEPART(year,a.DataNastere) asc

-- 60. Sa se afiseze cati proprietari sunt al caror nume incepe cu 'I'.

select count(distinct p.Nume)
from Proprietar p
where p.Nume like 'I%'


-- 61. Sa se afiseze service-urile ce contin in numarul de telefon '56' si orasul in care se afla.
    
select s.Oras,s.NrTelefon
from Service s
where s.NrTelefon like '%56%'

-- 62. Sa se afiseze numele proprietarilor ce detin masini aduse in service intr-o luna para
--    si sa fie intr-o zi cuprinsa intre 10-21.

select p.Nume+' '+p.Prenume as Proprietar,ap.NrInmatriculare
from AutovehiculeProprietar ap
inner join Autovehicul a on ap.idAutovehicul=a.idAutovehicul
inner join Proprietar p on ap.idProprietar=p.idProprietar
inner join Programari prog on ap.idProprietate=prog.idProprietate
where month(prog.DataVenire)%2=0 and day(prog.DataVenire) between 10 and 20


-- 63. Sa se afiseze media salariilor, numai primele 4 cifre.

select left(avg(s.SalariuBrut),4) as Salariu
from Salariu s




----------------------------------------------------- SUBINTEROGARI(10) ----------------------------------------


-- 64. Sa se afiseze toate numele companiilor care furnizeaza produse cu un pret pe unitate 
--     mai mic decat 20.

select f.Nume
from Furnizori f
where EXISTS
( select p.Denumire 
  from Piese p
  inner join Categorie c on p.idCategorie=c.idCategorie
  where p.idFurnizor=f.idFurnizor and c.Pret<20
)

-- 65. Sa se afiseze doar service-urile(numele orasului) care au programari.
select s.Oras
from Service s
where EXISTS
(select p.idProgramare
from Programari p
where p.idService=s.idService
)

-- 66. Sa se afiseze doar nr. de inmatriculare al masinilor a caror reparatie a durat mai putin de 5 zile.

select ap.NrInmatriculare,ap.idProprietate
from AutovehiculeProprietar ap
where EXISTS
( select p.idProgramare
  from Programari as p
   where DATEDIFF(day,p.DataVenire,p.DataIesire) < 5 and p.idProprietate=ap.idProprietate and p.DataIesire is not null
)

-- 67. Sa se afiseze nr. de inmatriculare al masinilor care au fost reparate.

select ap.NrInmatriculare,ap.idProprietate
from AutovehiculeProprietar ap
where EXISTS
( select p.idProgramare
  from Programari as p
   where p.idProprietate=ap.idProprietate and p.DataIesire is not null
)



-- 68. Sa se afiseze angajatii cu functia de 'manager' din fiecare service.

select a.Nume+' '+a.Prenume as Manageri
from Angajati a
where EXISTS
(
select fa.idFunctie
from FunctiiAngajati fa
inner join Functii f on fa.idFunctie=f.idFunctie
where fa.idAngajat=a.idAngajat and f.Denumire='Manager'
) 

-- 69. Sa se afiseze piesele care sunt in cantitati mai mari de 800 bucati.

select p.Denumire
from Piese p
where p.idCategorie=any
(select c.idCategorie
from Categorie c
where c.Cantitate > 800
)

-- 70. Afisati toate piesele daca au toate cantitatea egala cu 800 bucati.

select p.Denumire
from Piese p
where p.idCategorie=all
(select c.idCategorie
from Categorie c
where c.Cantitate = 800
)

-- 71. Sa se afiseze numele  proprietarilor care au lungimea mai mare de 6 litere in ordine alfabetica.

select p.Nume+' '+p.Prenume as Nume
from Proprietar p
where p.idProprietar=any
(
select p.idProprietar
from Proprietar p
where len(p.Nume)>6 
)
order by p.Nume asc


-- 72. Sa se afiseze numele angajatilor al caror nume de telefon se termina cu 7.

select a.Nume+' '+a.Prenume,a.NrTelefon
from Angajati a
where a.idAngajat=any
(select a.idAngajat
from Angajati a
where a.NrTelefon like '%7'
)

-- 73. Sa se afiseze angajatii nascuti in an impar.

select a.Nume+' '+a.Prenume,a.NrTelefon,year(a.DataNastere) as An
from Angajati a
where a.idAngajat=any
(
select a.idAngajat
from Angajati a
where year(a.DataNastere)%2=1
)



------------------------------ OPERATORI PE SETURI DE DATE(6)-------------------------


-- 74. Sa se afiseze orasele din care provin clientii si angajatii.

select p.Oras --10 rows
from Proprietar p
UNION
select a.Oras --50 rows
from Angajati a
--total: 29 rows, elimina duplicatele

-- 75. Sa se afiseze orasele comune pentru clienti si angajati.

select p.Oras --10 rows
from Proprietar p
INTERSECT
select a.Oras --50 rows
from Angajati a
--total: 3 rows

-- 76. Sa se afiseze angajatii care au functia de 'Mecanic auto' si 'Mecanic mentenanta'.

select a.Nume+' '+a.Prenume as NumeAngajat
from FunctiiAngajati fa
inner join Angajati a on a.idAngajat=fa.idAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
where f.Denumire='Mecanic auto'
INTERSECT
select a.Nume+' '+a.Prenume as NumeAngajat
from FunctiiAngajati fa
inner join Angajati a on a.idAngajat=fa.idAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
where f.Denumire='Mecanic mentenanta'


-- 77. Sa se afiseze angajatii care au functia de 'Mecanic auto', dar nu si de 'Mecanic mentenanta'.

select a.Nume+' '+a.Prenume as NumeAngajat
from FunctiiAngajati fa
inner join Angajati a on a.idAngajat=fa.idAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
where f.Denumire='Mecanic auto'
EXCEPT
select a.Nume+' '+a.Prenume as NumeAngajat
from FunctiiAngajati fa
inner join Angajati a on a.idAngajat=fa.idAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
where f.Denumire='Mecanic mentenanta'

-- 78. Sa se afiseze proprietarii care au programare si au masinile reparate.

select p.Nume+' '+p.Prenume as NumeProprietar
from AutovehiculeProprietar ap
inner join Proprietar p on ap.idProprietar=p.idProprietar
inner join Programari prog on ap.idProprietate=prog.idProgramare
where prog.DataIesire is not null
INTERSECT
select p.Nume+' '+p.Prenume
from Proprietar p


-- 79. Sa se afiseze orasul service-urile care nu au programari.

select s.Oras
from Service s
EXCEPT
select s.Oras
from Service s
inner join Programari p on s.idService=p.idService




-------------------------------- GRUPAREA DATELOR(5) ----------------------


-- 80. Afisati numele celei mai scumpe piese si categoria din care face parte.

select  c.idCategorie as ID,MAX(p.Denumire) as Piesa, MAX(c.Tip) as Categorie, MAX(c.Pret) as Pret
from Categorie c
inner join Piese p on c.idCategorie=p.idCategorie
group by c.idCategorie

-- 81. Scrieți o interogare care sa afiseze pentru fiecare categorie ID-ul și valoarea totala a acesteia. 

select c.idCategorie as ID,SUM(c.Pret*c.Cantitate) as SumaTotala
from Categorie c
group by c.idCategorie


-- 82. Sa se afiseze cate comenzi a livrat fiecare furnizor.

select p.idFurnizor,f.Nume as Furnizor, count(*) as NrComenzi
from Piese p
inner join Furnizori f on p.idFurnizor=f.idFurnizor
group by p.idFurnizor,f.Nume

-- 83. Sa se scrie o interogare care calculeaza pretul total pentru fiecare categorie de piese.

select c.idCategorie,c.Tip as Categorie,sum(c.Cantitate*c.Pret) as PretTotal
from Piese p
inner join Categorie c on p.idCategorie=c.idCategorie
group by c.idCategorie,c.Tip


-- 84. Sa se afiseze cate programari are fiecare service.

select s.idService,s.Oras as OrasService, count(*) as NrProgramari
from Service s
inner join Programari p on s.idService=p.idService
group by s.idService,s.Oras




-------------------------------- FILTRAREA DE GRUP(7) ------------------------

-- 85.  Sa se afiseze tara furnizorilor de piese dintr-un oras ce incepe cu litera
--'B' si au un nr. de bucati pe care le-au livrat mai mic decat 500 bucati.

select f.Tara
from Piese p
inner join Furnizori f on p.idFurnizor=f.idFurnizor
inner join Categorie c on p.idCategorie=c.idCategorie
where f.Oras like 'B%'
group by f.Tara
having max(c.Cantitate)<500

-- 86. Sa se afiseze piesele care au fost livrate in cantitati de mai mult de 100 bucati de cel putin 3 tipuri, 
--     grupate dupa denumirea categoriei.

select  c.Tip, count(*) as NrPiese
from Piese p
inner join Categorie c on p.idCategorie=c.idCategorie
where c.Cantitate>100
group by c.Tip
having count(*)>3


-- 87. Selectati orasul service-urilor cu mai putin de 2 programari de dupa 23 februarie 2022,
--     grupate dupa numele orasului.

select s.Oras,count(*) as NrProgramari
from Service s
inner join Programari p on s.idService=p.idService
where p.DataVenire > '2022-02-23'
group by s.Oras
having count(*)<2

-- 88. -- Sa se afiseze tara furnizorilor de piese dintr-un oras ce incepe cu litera
--'B' si au un nr. de bucati pe care le-au livrat mai mic decat 500 bucati.

select f.Tara
from Piese p
inner join Furnizori f on p.idFurnizor=f.idFurnizor
inner join Categorie c on p.idCategorie=c.idCategorie
where f.Oras like 'B%'
group by f.Tara
having max(c.Cantitate)<500

-- 89. Sa se afiseze functiile angajatilor care au cel putin 3 functii cu salariul 
     --mai mare de 2500 lei, grupate dupa denumirea functiei.

select count(*) as NrFunctii, f.Denumire as Functie
from FunctiiAngajati fa
inner join Salariu s on fa.idFunctieAngajat=s.idFunctieAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
inner join Angajati a on fa.idAngajat=a.idAngajat
where s.SalariuBrut>2500
group by f.Denumire
having count(*)<3


-- 90. Afisati proprietarii care au mai mult de o masina al caror nr. de telefon se termina in cifra 6.

select p.Nume,p.Prenume,count(*) as NrMasini
from Proprietar p
inner join AutovehiculeProprietar ap on p.idProprietar=ap.idProprietar
where p.NrTelefon like '%6'
group by p.Nume,p.Prenume
having count(*)>1

-- 91. Sa se afiseze autovehiculele de culoare negru care au maxim 2 proprietari, grupate dupa numele proprietarilor. 

select a.Model, a.Culoare, p.Nume,p.Prenume, count(*) as NrMasini
from AutovehiculeProprietar ap
inner join Proprietar p on ap.idProprietar=p.idProprietar
inner join Autovehicul a on ap.idAutovehicul=a.idAutovehicul
where a.Culoare='Negru'
group by p.Nume,p.Prenume, a.model,a.culoare
having count(*)=2





-------------------------------- GRUPAREA DATELOR FILTRATE(6) ----------------------------


-- 92. Scrieți o interogare care sa afiseze pentru fiecare categorie ID-ul și valoarea totala a acesteia. Afisati si denumirea 
--     categoriei si toate piesele din categoria 'Vopsea'.           

select c.idCategorie as ID,SUM(c.Pret*c.Cantitate) as SumaTotala, p.Denumire as Piesa,c.Tip as Categorie
from Categorie c
inner join Piese p on c.idCategorie=p.idCategorie
where c.Tip='Vopsea'
group by c.idCategorie,p.Denumire,c.Tip

-- 93. Sa se afiseze orasul pt fiecare service si cate programari au.

select s.Oras,count(s.idService) as NrProgramari
from Service s,Programari p
where s.idService=p.idService
group by s.Oras

-- 94. Afisati cate produse are fiecare categorie, grupate in functie de id-ul categoriei.

select c.idCategorie,count(*) as NrPiese, c.Tip as Categorie
from Piese p
inner join Categorie c on c.idCategorie=p.idCategorie
group by c.idCategorie,c.Tip

-- 95. Sa se afiseze service-urile care au programari in intervalul '2022-01-01' si '2022-05-09', grupate dupa numele orasului.

select s.Oras
from Service s
inner join Programari p on s.idService=p.idService
where p.DataVenire>'2022-01-01' and p.DataIesire<'2022-05-09'
group by s.Oras

-- 96. Afisati pentru fiecare angajat de la Ploiesti numarul de masini pe care le-au reparat, grupate dupa numele angajatului.

select a.Nume,a.Prenume,count(*) as NrReparatii
from ReparatiiAutovehicule ra
inner join Angajati a  on a.idAngajat=ra.idAngajat
inner join Service s on a.idService=s.idService
where s.Oras='Ploiesti'
group by a.Nume, a.Prenume


-- 97. Sa se afiseze orasul pt fiecare service si cate programari au.

select s.Oras,count(s.idService) as NrProgramari
from Service s,Programari p
where s.idService=p.idService
group by s.Oras


---------------------------------- VIEWS(5) ---------------------------


-- 98. Creati o vedere in care sa stocati numele, prenumele si varsta angajatilor de peste 35 ani, orasul service-ului la care sunt angajati,
--    numarul lor de telefon, functia si salariul lor. Sa se afiseze angajatii cu varsta de peste 35 de ani.

if OBJECT_ID('DetaliiAngajati','V') is not null
drop view DetaliiAngajati
go
create view DetaliiAngajati
as
select a.Nume,a.Prenume, f.Denumire as Functie, s.Oras,DATEDIFF(year,a.DataNastere,CURRENT_TIMESTAMP) as Varsta, a.NrTelefon,sl.SalariuBrut
from Angajati a
inner join Service s on a.idService=s.idService
inner join FunctiiAngajati fa on a.idAngajat=fa.idAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
inner join Salariu sl on sl.idFunctieAngajat=fa.idFunctieAngajat
where DATEDIFF(year,a.DataNastere,CURRENT_TIMESTAMP)>35 

select * from DetaliiAngajati

-- 99. Creati o vedere in care sa inserati categoria, tipul pieselor din acea categorie, suma totala si furnizorii ce le-au livrat

if OBJECT_ID('DetaliiPiese','V') is not null
drop view DetaliiPiese
go
create view DetaliiPiese
as
select c.Tip as Categorie, p.Denumire as Piesa, SUM(c.Pret*c.Cantitate) as SumaTotala, f.Nume as Furnizor
from Categorie c
inner join Piese p on c.idCategorie=p.idCategorie
inner join Furnizori f on f.idFurnizor=p.idFurnizor
group by c.Tip, p.Denumire,f.Nume

select * from DetaliiPiese

-- 100. Sa se creeze un view in care sa se stocheze proprietarii ce au adus masini la reparat, nr. de inmatriculare, modelul,
--    orasul service-ului, nr de zile cat au durat reparatiile si costurile reparatiilor.

if OBJECT_ID('CosturiReparatii','V') is not null --de completat
drop view CosturiReparatii
go
create view CosturiReparatii as
select p.Nume,p.Prenume,ap.NrInmatriculare,a.Model,s.Oras as Service,DATEDIFF(DAY,prog.DataVenire,prog.DataIesire) as NrZileReparatie,
SUM((c.Pret+r.Manopera)+r.Taxa*(c.Pret+r.Manopera)) as PretReparatie
from Proprietar p
inner join AutovehiculeProprietar ap on ap.idProprietar=p.idProprietar
inner join Autovehicul a on a.idAutovehicul=ap.idAutovehicul
inner join Programari prog on prog.idProprietate=ap.idProprietate
inner join Service s on s.idService=prog.idService
inner join Angajati ang on ang.idService=s.idService
inner join ReparatiiAutovehicule ra on ra.idAngajat=ang.idAngajat
inner join Reparatii r on r.idReparatie=ra.idReparatie
inner join Piese pie on pie.idPiesa=r.idPiesa
inner join Categorie c on c.idCategorie=pie.idCategorie
where prog.DataIesire is not null
group by p.Nume,p.Prenume,ap.NrInmatriculare,a.Model,s.Oras,prog.DataIesire,prog.DataVenire

select * from CosturiReparatii


-- 101. Creati o vedere in care sa stocati toate autoturismele ce au carburantul 'Benzina' si au peste 110 CP, proprietarii acestora, 
--    nr. de inmaticulare, modelul si culoarea.
if OBJECT_ID('MasiniBenzina','V') is not null
drop view MasiniBenzina
go
create view MasiniBenzina as
	select p.Nume+' '+p.Prenume as Proprietar, a.Model,a.Carburant,a.Culoare,a.PutereMotor,ap.NrInmatriculare
	from Autovehicul a
	inner join AutovehiculeProprietar ap on ap.idAutovehicul=a.idAutovehicul
	inner join Proprietar p on p.idProprietar=ap.idProprietar
	where a.Carburant='Benzina' and a.PutereMotor>110
select * from MasiniBenzina


-- 102. Creati o vedere in care sa afisati anagajatii care au reparat mai mult de 1 masina, numele acestora, numarul de telefon, functia si service-ul.

if OBJECT_ID('MasiniReparate','V') is not null
drop view MasiniReparate
go
create view MasiniReparate as
	select a.Nume+' '+a.Prenume as Angajat,a.NrTelefon,f.Denumire as Functie,s.Oras,count(*) as NrReparatii
	from Angajati a
	inner join FunctiiAngajati fa on fa.idAngajat=a.idAngajat
	inner join Functii f on f.idFunctie=fa.idFunctie
	inner join ReparatiiAutovehicule ra on ra.idAngajat=a.idAngajat
	inner join Service s on s.idService=a.idService
	group by a.Nume,a.Prenume,a.NrTelefon,f.Denumire,s.Oras
	having count(*)>1
select * from MasiniReparate



------------------------------------------- CTE(7) ------------------------------


-- 103. Sa se creeze o expresie care afiseaza cea mai ieftina categorie de piese.

;with PretMin as
(
   select min(c.Pret) as PretMin,c.Tip as Categorie
   from categorie c
   group by c.Tip
)
select top(1) p.PretMin,p.Categorie
from PretMin p
order by p.PretMin asc

-- 104. Creati un CTE care sa afiseze numarul de programari si orasul pentru service-ul cu cele
--    mai multe programari.

with NrProgramari as --calculez pt fiecare service nr de programari
(
  select count(*) as NrProgramari, s.Oras
  from Programari p
  inner join Service s on s.idService=p.idService
  group by s.Oras
),
MaxProg as --aflu maximul din toate
(
  select max(NrProgramari) as NrMaxProg
  from NrProgramari
)
select  NrMaxProg, nr.Oras 
from MaxProg
inner join NrProgramari nr on nr.NrProgramari=NrProgramari

-- 105. Creati un CTE care sa afiseze pentru fiecare functie salariul net.
with ProcentImpozite as
(
   select i.Nume as Impozit,i.Procent, s.SalariuBrut,f.Denumire as Functie
   from ImpoziteSalariu imps
   inner join Impozite i on i.idImpozit=imps.idImpozit
   inner join Salariu s on s.idSalariu=imps.idSalariu
   inner join FunctiiAngajati fa on fa.idFunctieAngajat=s.idFunctieAngajat
   inner join Functii f on f.idFunctie=fa.idFunctie
),
SalariuNet as
(
   select imp.Functie, sum(imp.SalariuBrut-(imp.Procent*imp.SalariuBrut)/100) as SalariuTotal
   from ProcentImpozite imp
   group by imp.Functie
)
select sn.Functie,sn.SalariuTotal
from SalariuNet sn


-- 106. Sa se creeze un CTE care sa afiseze numarul de progaramari(mai mult decat una) pentru fiecare luna din anul 2022.

;with ProgramariLunare(LunaProgramare,NrProgramari) as
(
   select count(*) as NrProgramari, convert(nvarchar(32),month(p.DataVenire),6)
   from Programari p
   group by month(p.DataVenire)
   having count(*)>1
)
select * from ProgramariLunare

-- 107. Sa se afiseze doar nr. de inmatriculare al masinilor a caror reparatie a durat mai putin de 10 zile.

;with MasiniReparate as
(
  select ap.NrInmatriculare, DATEDIFF(day,p.DataVenire,p.DataIesire) as NrZile
  from AutovehiculeProprietar ap
  inner join Programari p on p.idProprietate=ap.idProprietate
  where DATEDIFF(day,p.DataVenire,p.DataIesire) < 10 and p.idProprietate=ap.idProprietate and p.DataIesire is not null
)
select *
from MasiniReparate

-- 108. Creati un CTE in care sa afisati modelul masinilor de culoare negru si carburant benzina, proprietarul acestora si nr de inmatriculare.

;with MasiniBenzina as
(
  select p.Nume+' '+p.Prenume as Proprietar,a.Model,a.Culoare,a.Carburant,ap.NrInmatriculare
  from Autovehicul a
  inner join AutovehiculeProprietar ap on a.idAutovehicul=ap.idAutovehicul
  inner join Proprietar p on p.idProprietar=ap.idProprietar
  where a.Carburant='Benzina' and a.Culoare='Negru'
)
select *
from MasiniBenzina

-- 109. Sa se creeze un CTE care sa afiseze angajatii, denumirea service-ului de care apartin si seful acestora.

;with Sefi as
(
   select s.Oras,a2.Nume+' '+a2.Prenume as Angajati,a.Nume+' '+a.Prenume as Sefi
   from FunctiiAngajati fa
   inner join Angajati a on a.idAngajat=fa.idAngajat
   inner join Service s on s.idService=a.idService
   inner join FunctiiAngajati fa2 on fa.idAngajat=fa2.Sefi
   inner join Angajati a2 on a2.idAngajat=fa2.idAngajat
   
)
select * from Sefi


----------------------------------------------- TRIGGERE(10) -------------------------------------


-- 110. Sa se creeze un trigger pentru identificarea duplicatelor oraselor in tabelul Service.

if OBJECT_ID('DuplicateService','TR') is not null
drop trigger DuplicateService
go
create trigger DuplicateService
on Service 
after insert, update
as
begin
	if @@ROWCOUNT=0 return;
	set nocount on;
	if exists(
				select count(*)
				from inserted as i
				inner join Service s
				on i.Oras=s.Oras
				group by i.Oras
				having count(*) >1
			  )
	begin
	  print('Service-ul exista deja  in baza de date');
		rollback
	end
end

INSERT INTO Service(idService,Adresa,NrTelefon,Oras,Program) VALUES
(7,'str. Gh. Doja, nr. 189','0789987667','Sibiu','Inchis')

-- 111. Sa se creeze un trigger pentru tabelul Proprietari. Sa se afiseze un mesaj corespunzator dupa
--   orice modificare a datelor.

if OBJECT_ID('UpdateProprietari','TR') is not null
drop trigger UpdateProprietari
go
create trigger UpdateProprietari 
on Proprietar
after update
as
 print 'Modificarile au fost efectuate cu succes!'

 update Proprietar
 set Prenume='Georgiana'
 where Nume='Barbu'

 select * from Proprietar

 -- 112. Creati un declansator care sa afiseze un mesaj dupa un delete din tabelul Autovehicule.

 if OBJECT_ID('AfterDeleteAutovehicule','TR') is not null
 drop trigger AfterDeleteAutovehicule
 go
 create trigger AfterDeleteAutovehicule
 on Autovehicul
 after delete
 as 
  print 'A fost efectuata stergerea din tabelul Autovehicule'


INSERT INTO Autovehicul(idAutovehicul,Categorie,Model,Culoare,Carburant,NrKm,PutereMotor,SerieSasiu) VALUES
(12,'Autoturism','Dacia Duster','Negru','Motorina','152.123',150,'SKES030ER5CPI0189')

delete from Autovehicul
where idAutovehicul=12

-- 113. Creati un trigger care sa selecteze service-ul in care o programare a fost actualizata.

if OBJECT_ID('UpdateProgramare','TR') is not null
drop trigger UpdateProgramare
go
create trigger UpdateProgramare
on Programari
for update
as
begin
	declare @upd as int
	if @@ROWCOUNT=0  return;
	set nocount on;
	begin
		select @upd=inserted.idProgramare from inserted
		select s.Oras
		from Service s
		inner join Programari p on s.idService=p.idService
		where p.idProgramare=@upd
	end
end

-- 114. Creati un trigger care sa afiseze pretul maxim al unei piese inserate sau modificate.

if OBJECT_ID('PretMaxPiesa','TR') is not null
drop trigger PretMaxPiesa
go
create trigger PretMaxPiesa
on Categorie
after insert, update
as 
begin
	if @@rowcount=0 return;
	set nocount on;
	begin
		select max(Pret) from Categorie
	end
end

update Categorie 
set Pret+=100
where Tip='Parbriz'

-- 115. Creati un trigger care sa completeze automat tara Furnizorilor ca fiind Romania.

if OBJECT_ID('SetTaraFurnizor','TR') is not null
drop trigger SetTaraFurnizor
go
create trigger SetTaraFurnizor
on Furnizori
after insert, update
as
begin
	if @@ROWCOUNT=0 return;
	set nocount on;
	update Furnizori
	set Tara='Romania'
end

INSERT INTO Furnizori(idFurnizor,Nume,Adresa,Oras,CodPostal,Tara,NrTelefon) VALUES
(8,'Ajax','50 Gilbert St.','Munchen','EC1 4SE','Germania','1715552992')

select * from Furnizori
where Nume='Ajax'

-- 116. Creati un trigger care sa permita doar inserarea salariului brut mai mare de 2500 lei.

if OBJECT_ID('TriggerSalariu','TR') is not null
drop trigger TriggerSalariu
go
create trigger TriggerSalariu
on Salariu
after insert, update
as
begin
  if @@ROWCOUNT=0 return;
  set nocount on;

  declare @salariu int,
		  @nume nvarchar(32)

  select @salariu=i.SalariuBrut,@nume=a.Nume+' '+a.Prenume
  from Inserted i, Salariu s
  inner join FunctiiAngajati fa on fa.idFunctieAngajat=s.idFunctieAngajat
  inner join Angajati a on a.idAngajat=fa.idAngajat
  where s.SalariuBrut=i.SalariuBrut

  if(@salariu<2500)
   begin
     raiserror('Angajatul %s are salariul %d < 2500 lei',16,1,@nume,@salariu)
	 rollback
	 end
  else
   begin
     raiserror('Angajatul %s are salariul de %d lei',16,1,@nume,@salariu)
	end
end

INSERT INTO Salariu(idSalariu,idFunctieAngajat,SalariuBrut,DataIntrareVigoare,DataIesireVigoare) VALUES
(15,7,1900,'2019-09-01',NULL)

select * from Salariu

-- 117. Sa se verifice daca la introducerea numarului de telefon acesta contine 10 cifre.

if OBJECT_ID('VerificareNrTelef','TR') is not null
drop trigger VerificareNrTelef
go
create trigger VerificareNrTelef
on Angajati
for insert,update
as
begin
  if @@rowcount=0 return;
  set nocount on;

  declare @nrTelef nvarchar(11)

  select @nrTelef=i.NrTelefon
  from Angajati a,inserted i
  where i.NrTelefon=a.NrTelefon

  if(len(@nrTelef)>10)
   begin
    raiserror('Nr de telefon %s este invalid',16,1,@nrTelef)
	rollback
   end
  else
   begin
    raiserror('Nr de telefon %s este valid',16,1,@nrTelef)
   end
end

INSERT INTO Angajati(idAngajat,idService,Nume,Prenume,Adresa,Oras,DataNastere,NrTelefon) VALUES
(51,5,'Popescu','Vlad','str. Dunarea, nr. 6','Slatina','1995-11-11','0735333344555')

select * from Angajati

-- 118. Sa se creeze un trigger care la inserarea unei piese acesteia sa i se creasca pretul cu 10 lei.

if OBJECT_ID('ScaderePretPiesa','TR') is not null
drop trigger ScaderePretPiesa
go
create trigger ScaderePretPiesa
on Categorie
after insert
as
begin
  if @@ROWCOUNT=0 return;
  set nocount on;

  update Categorie
  set Pret+=10
  from inserted
  where Categorie.Pret=inserted.Pret
end

INSERT INTO Categorie(idCategorie,Tip,Pret,Cantitate) VALUES
(12,'Anvelope',250,100)

select * from Categorie
where Tip='Anvelope'

-- 119. Sa se creeze un declansator care dupa stergerea unei valori din tabelul Reparatii sa afiseze un mesaj corespunzator.

if OBJECT_ID('StergereReparatii','TR') is not null
drop trigger StergereReparatii
go
create trigger StergereReparatii
on Reparatii
after delete
as
  print 'A fost efectuata stergerea din tabelul Reparatii'


 INSERT INTO Reparatii(idReparatie,idProgramare,idPiesa,Defectiune,Taxa,Manopera) VALUES
(17,6,20,'Schimbare filtre',0.1,10)

delete from Reparatii
where idReparatie=17


-------------------------------------------------- PROCEDURI STOCATE(11) --------------------------------------


-- 120. Creati o procedura care presupune aflarea unei programari intr-un anumit interval de zile.

if OBJECT_ID('IntervalProgramari','P') is not null
drop procedure IntervalProgramari;
go
create procedure IntervalProgramari 
	@inceput as datetime='19000101',
	@sfarsit as datetime ='99991231',
	@idProg as int,
	@numRows as int = 0 output
as
begin
	select idProgramare, DataVenire, DataIesire
	from Programari 
	where @idProg=idProgramare and DataVenire>=@inceput and DataIesire<=@sfarsit;
	set @numRows=@@ROWCOUNT
	return;
end


declare @numRowsReturned as int;

exec IntervalProgramari
	@idProg='3',
	@inceput='2021-01-01',
	@sfarsit='2022-05-01',
	@numRows=@numRowsReturned output;
select @numRowsReturned as 'Nr de randuri returnate'

-- 121. Creati o procedura stocata care sa efectueze o reducere de x % pentru toate produsele din categoria y.

select * into Categorie2
from Categorie
select * from Categorie2
if OBJECT_ID('ReducerePret','P') is not null
drop procedure ReducerePret
go
create procedure ReducerePret
	@procent float=0.3,
	@categorie nvarchar(32)='Vopsea',
	@rows int=0 output
as
begin
	update c
	set c.Pret=c.Pret-@procent*c.Pret
	from Categorie2 c 
	inner join Categorie cat on c.idCategorie=cat.idCategorie
	where @categorie=cat.Tip
set @rows=@@ROWCOUNT;
end


exec ReducerePret

select * from Categorie2
where Categorie2.Tip='Vopsea'

-- 122. Creati o procedura stocata care sa afiseze toate campurile din tabela Angajati al caror nume incepe
-- cu 'M' si au varsta peste 27 de ani.

if OBJECT_ID('VarstaAngajati','P') is not null
drop procedure VarstaAngajati
go
create procedure VarstaAngajati
as
select *
from Angajati
where Nume like'M%' and DATEDIFF(year,DataNastere,current_timestamp)>27

exec VarstaAngajati

-- 123. Sa se creeze o procedura cu parametru care permite vizualizarea angajatilor
--  cu functia de 'Manager' de la un anumit service prin transmiterea parametrului
--  denumire oras service.

if OBJECT_ID('AngajatiManager','P') is not null
drop procedure AngajatiManager
go
create procedure AngajatiManager @service nvarchar(32)
as
	select a.Nume+' '+a.Prenume as Angajati, f.Denumire as Functie
	from Angajati a
	inner join Service s on a.idService=s.idService
	inner join FunctiiAngajati fa on fa.idAngajat=a.idAngajat
	inner join Functii f on f.idFunctie=fa.idFunctie
	where f.Denumire='manager' and s.Oras=@service

exec AngajatiManager @service='Timisoara'

-- 124. Sa se creeze o procedura prin care se vor afisa toti angajatii care au acelasi salariu. Salariul
--  va fi transmis ca parametru.

if OBJECT_ID('SalariuAng','P') is not null
drop procedure SalariuAng
go
create procedure SalariuAng @salariu decimal(18,2)
as
	select a.Nume+' '+a.Prenume as Angajati, s.SalariuBrut
	from Angajati a
	inner join FunctiiAngajati fa on fa.idAngajat=a.idAngajat
	inner join Salariu s on s.idFunctieAngajat=fa.idFunctieAngajat
	where s.SalariuBrut=@salariu

exec SalariuAng @salariu=2300


-- 125.Sa se creeze o procedura care va permite vizualizarea varstei medii pentru un an trimis ca parametru
--   pentru angajati.

if OBJECT_ID('MedieVarsta','P') is not null
drop procedure MedieVarsta
go
create procedure MedieVarsta @an int,@varstaMedie int output
as
	select @varstaMedie=avg(datediff(year,DataNastere,current_timestamp)) 
	from Angajati
	where @an=year(DataNastere)

declare @varsta int
exec MedieVarsta @an=1996, @varstaMedie=@varsta output
select @varsta as [Varsta Medie]

-- 126. Creati o procedura care sa afiseze toate piesele livrate de un furnizor trimis ca parametru.

if OBJECT_ID('FurnizorPiese','P') is not null
drop procedure FurnizorPiese 
go
create procedure FurnizorPiese @furnizor nvarchar(32)
as
	select p.Denumire as Piese, f.Nume as Furnizor
	from Piese p
	inner join Furnizori f on f.idFurnizor=p.idFurnizor
	where @furnizor=f.Nume

exec FurnizorPiese @furnizor='Van Wezel'

-- 127. Sa se afiseze nr. de inmatriculare al masinilor inregistrate intr-un service trimis ca parametru al procedurii, 
-- numele proprietarului, numele orasului service-ului in care se afla inregistrat si defectiunile vehicului.

if OBJECT_ID('DetaliiReparatii','P') is not null
drop procedure DetaliiReparatii
go
create procedure DetaliiReparatii @service nvarchar(32)
as
	select p.Nume+' '+p.Prenume as Proprietar,ap.NrInmatriculare, s.Oras, r.Defectiune
	from Proprietar p
	inner join AutovehiculeProprietar ap on p.idProprietar=ap.idProprietar
	inner join Programari prog on prog.idProprietate=ap.idProprietate
	inner join Service s on s.idService=prog.idService
	inner join Reparatii r on r.idProgramare=prog.idProgramare 
	where @service=s.Oras

exec DetaliiReparatii  @service='Ploiesti'

-- 128. Sa se creeze o procedura stocata care creste manopera cu x lei daca aceasta este mai mica decat y lei.

if OBJECT_ID('CrestereManopera','P') is not null
drop procedure CrestereManopera
go
create procedure CrestereManopera @x int,@y int
as
	update r
	set r.Manopera+=@x
	from Reparatii r
	where r.Manopera<@y 

exec CrestereManopera @x=10,@y=30
select * from Reparatii

-- 129. Creati o procedura stocata care afiseaza toti angajatii din orasul Bucuresti si al caror nr. de telefon se termina cu cifra 2.

if OBJECT_ID('AngajatiBucuresti','P') is not null
drop procedure AngajatiBucuresti
go
create procedure AngajatiBucuresti
as
	select a.Nume+' '+a.Prenume as Angajati,a.Oras
	from Angajati a
	where a.Oras='Bucuresti' and a.NrTelefon like '%2'

exec AngajatiBucuresti

-- 130.  Creati o procedura stocata care sa afiseze angajatii nascuti in luna februarie, august, octombrie sau decembrie, 
--      ordonati crescator dupa anul nasterii.

if OBJECT_ID('LunaNastere','P') is not null
drop procedure LunaNastere
go
create procedure LunaNastere
as
	select *
	from Angajati a
	where DATEPART(m,a.DataNastere) IN (2,8,10,12)
	order by DATEPART(year,a.DataNastere) asc

exec  LunaNastere

 

------------------------------------------------------ TRANZACTII(10) -----------------------------------------


-- 131. Creati o tranzactie care presupune inserarea unui nou service si afisarea acestuia.

begin try
	begin tran
		insert into Service(idService,Adresa,NrTelefon,Oras,Program) values
		  (7,'str. Castanelor, nr. 6','0745678788','Cluj-Napoca','Non-stop');
		  select*
		  from Service
	commit tran
end try
begin catch
	if ERROR_NUMBER()=2627 --eroare pt dubluri chei
	  begin
		print 'Primary key violation';
	  end
	else if ERROR_NUMBER()=547 --eroare pt constrangere
		begin
			print 'Constraint violation';
    end
	else
		begin
			print 'Unhandled error';
	end

if @@TRANCOUNT>0
   rollback tran;
end catch


-- 132. Creati o tranzactie care presupune inserarea unei inregistrari in tabelul service
--    pe care apoi o va elimina.

begin try
	begin tran
		insert into Service(idService,Adresa,NrTelefon,Oras,Program) values
		   (8,'str. Castanelor, nr. 6','0745678788','Mures','Non-stop');

		  select *
		  from service

		  delete from Service
		  where idService=8

		  select *
		  from service

	commit tran
end try
begin catch
	
	if ERROR_NUMBER()=2627 --eroare pt dubluri chei
	  begin
		print 'Primary key violation';
	  end
	else if ERROR_NUMBER()=547 --eroare pt constrangere
		begin
			print 'Constraint violation';
    end
	else
		begin
			print 'Unhandled error';
	end

if @@TRANCOUNT>0
   rollback tran;

end catch

-- 133. Creati o tranzactie care presupune inserarea unui noi autovehicul si modificarea culorii acestuia.

begin try
	begin tran
		insert into Autovehicul(idAutovehicul,Categorie,Model,Culoare,Carburant,NrKm,PutereMotor,SerieSasiu) VALUES
		(12,'Autoturism','Opel Astra','Auriu','Motorina','180.000',100,'SKES111ER5CPO0111')
		INSERT INTO AutovehiculeProprietar(idProprietate,idProprietar,idAutovehicul,NrInmatriculare) VALUES
		(12,6,12,'CT13CSR')

		select *
		from Autovehicul

		select *
		from AutovehiculeProprietar

		update Autovehicul
		set Culoare='Gri'
		where idAutovehicul=12
commit
end try
begin catch
	
	if ERROR_NUMBER()=2627 --eroare pt dubluri chei
	  begin
		print 'Primary key violation';
	  end
	else if ERROR_NUMBER()=547 --eroare pt constrangere
		begin
			print 'Constraint violation';
    end
	else
		begin
			print 'Unhandled error';
	end

if @@TRANCOUNT>0
   rollback tran;

end catch

select *
from Autovehicul

-- 134. Creati o tranzactie prin intermediul careia sa modificati pretul pieselor care depasesc 100 lei cu 10 lei. 
--   Pentru fiecare piesa afisati categoria si furnizorul acesteia.

begin try
	begin tran
	--inainte de modif
	    select p.Denumire as Piesa, c.Tip as Categorie, f.Nume as Furnizor,c.Pret
		from Categorie c
		inner join Piese p on c.idCategorie=p.idCategorie
		inner join Furnizori f on f.idFurnizor=p.idFurnizor

		update  c
		set c.Pret+=10
		from Categorie c
		where c.Pret>100

		select p.Denumire as Piesa, c.Tip as Categorie, f.Nume as Furnizor,c.Pret
		from Categorie c
		inner join Piese p on c.idCategorie=p.idCategorie
		inner join Furnizori f on f.idFurnizor=p.idFurnizor
    commit tran
end try
begin catch

	if @@TRANCOUNT > 0
		rollback tran;
end catch

-- 135. Sa se creeze o tranzactie care introduce o noua inregistrare in tabelul Furnizori,
-- modifica tara ca fiind Franta si apoi sterge inregistrarea.

begin try
	begin tran
	
		INSERT INTO Furnizori(idFurnizor,Nume,Adresa,Oras,CodPostal,Tara,NrTelefon) VALUES
		(9,'AXI','str. Principala, nr. 759A','Ploiesti','107160','Romania','0737834152')

		select *
		from Furnizori

		update f
		set f.Tara='Franta'
		from Furnizori  f
		where idFurnizor=9

		select *
		from Furnizori

		delete from Furnizori
		where Tara='Franta'

		select * 
		from Furnizori

	commit tran
end try
begin catch

	if ERROR_NUMBER()=2627 --eroare pt dubluri chei
	  begin
		print 'Primary key violation';
	  end
	else if ERROR_NUMBER()=547 --eroare pt constrangere
		begin
			print 'Constraint violation';
    end
	else
		begin
			print 'Unhandled error';
	end

if @@TRANCOUNT>0
   rollback tran;
end catch



-- 136. Creati o tranzactie care sa mareasca salariul patronului cu 1000 lei.

begin try
	begin tran

	    select * 
		from Salariu s
		inner join FunctiiAngajati fa on fa.idFunctieAngajat=s.idFunctieAngajat
		inner join Angajati a on a.idAngajat=fa.idAngajat
		inner join Functii f on fa.idFunctie=f.idFunctie
		where f.Denumire='Patron'

		update  s
		set s.SalariuBrut+=1000
		from Salariu s
		inner join FunctiiAngajati fa on fa.idFunctieAngajat=s.idFunctieAngajat
		inner join Angajati a on a.idAngajat=fa.idAngajat
		inner join Functii f on fa.idFunctie=f.idFunctie
		where f.Denumire='Patron'

		select *
		from Salariu s
		inner join FunctiiAngajati fa on fa.idFunctieAngajat=s.idFunctieAngajat
		inner join Angajati a on a.idAngajat=fa.idAngajat
		inner join Functii f on fa.idFunctie=f.idFunctie
		where f.Denumire='Patron'

	commit tran
end try
begin catch

if @@TRANCOUNT>0
   rollback tran;

end catch

-- 137. Scrieti o tranzactie care sa adauge un nou angajat in baza de date. Daca id-ul este deja existent,
--  gestionati eroarea.

begin try
	begin tran
		INSERT INTO Angajati(idAngajat,idService,Nume,Prenume,Adresa,Oras,DataNastere,NrTelefon) VALUES
(46,5,'Lascuzeanu','Daniel','str. Dunavat, nr. 66','Jupiter','1995-11-11','0735333344')
    commit tran
end try
begin catch

	if ERROR_NUMBER()=2627 --eroare pt dubluri chei
	  begin
		print 'Primary key violation';
	  end
	else if ERROR_NUMBER()=547 --eroare pt constrangere
		begin
			print 'Constraint violation';
    end
	else
		begin
			print 'Unhandled error';
	end

if @@TRANCOUNT>0
   rollback tran;
end catch

-- 138. Scrieți o tranzacție în care să inserați două rânduri și să modificați alte trei rânduri la alegere în 
--   oricare din tabelele din baza de date Shop. Tratați cazurile de eroare.

begin try
	begin tran
		insert into Autovehicul(idAutovehicul,Categorie,Model,Culoare,Carburant,NrKm,PutereMotor,SerieSasiu) VALUES
		(13,'Autoturism','Skoda Octavia II','Gri','Motorina','180.000',100,'SKEI111ER5CPO3311'),
		(14,'Autoturism','BMW Seria 1','Auriu','Benzina','180.000',100,'SKES111ER5CPO6969')

		select * from Autovehicul

		update a
		set a.NrKm='185.000'
		from Autovehicul a
		where a.NrKm='180.000'

		select * from Autovehicul

	commit tran
end try
begin catch
	if ERROR_NUMBER()=2627 --eroare pt dubluri chei
	  begin
		print 'Primary key violation';
	  end
	else if ERROR_NUMBER()=547 --eroare pt constrangere
		begin
			print 'Constraint violation';
    end
	else
		begin
			print 'Unhandled error';
	end

if @@TRANCOUNT>0
   rollback tran;
end catch

-- 139. Scieti o tranzactie care sa introduca o noua functie pentru angajati.

begin try
	begin tran
		INSERT INTO Functii(idFunctie,Denumire) VALUES (10,'Femeie serviciu')
    commit tran
end try
begin catch

	if ERROR_NUMBER()=2627 --eroare pt dubluri chei
	  begin
		print 'Primary key violation';
	  end
	else if ERROR_NUMBER()=547 --eroare pt constrangere
		begin
			print 'Constraint violation';
    end
	else
		begin
			print 'Unhandled error';
	end

if @@TRANCOUNT>0
   rollback tran;
end catch


-- 140. Scrieti o tranzactie care sa scrie cu majuscule orasul tuturor angajatilor care apartin de service-ul din Bucuresti.

begin try
	begin tran
	--inainte de modif
	    select *
		from Angajati a
		inner join Service s on s.idService=a.idService
		where a.idService=3

		update a
		set a.Oras=UPPER(a.Oras)
		from Angajati a
		inner join Service s on s.idService=a.idService
		 where a.idService=3

		select * 
		from Angajati a
		inner join Service s on s.idService=a.idService
		where a.idService=3

    commit tran
end try
begin catch

	if @@TRANCOUNT > 0
		rollback tran;
end catch



------------------------------------------------------------- UPDATE(15) -----------------------------------------


-- 141. Sa se actualizeze programul de lucru al service-ului cu program 'Inchis' ca fiind 'Non-stop'.
select *
from Service s
where s.Program='Inchis'

update Service
set Service.Program='Non-stop'
where Service.Program='Inchis'


-- 142. Sa se mareasca toate salariilor angajatilor cu functia de 'Manager' cu 1000lei.

select s.SalariuBrut
from FunctiiAngajati fa
inner join Functii f on fa.idFunctie=f.idFunctie
inner join Salariu s on s.idFunctieAngajat=fa.idFunctieAngajat
where f.Denumire='Manager'

update s
set s.SalariuBrut+=1000
from FunctiiAngajati fa
inner join Functii f on fa.idFunctie=f.idFunctie
inner join Salariu s on s.idFunctieAngajat=fa.idFunctieAngajat
where f.Denumire='Manager'


-- 143. Actualizati tabelul 'Proprietar' astfel incat celor care le-a fost reparata masina sa aiba numele scris cu majuscule.

select prop.Nume,prop.Prenume
from AutovehiculeProprietar as ap
inner join Programari p on ap.idProprietate=p.idProprietate
inner join Proprietar prop on ap.idProprietar=prop.idProprietar
where p.DataIesire is not null

update prop
set prop.Nume=UPPER(prop.Nume),prop.Prenume=UPPER(prop.Prenume)
from AutovehiculeProprietar as ap
inner join Programari p on ap.idProprietate=p.idProprietate
inner join Proprietar prop on ap.idProprietar=prop.idProprietar
where p.DataIesire is not null


-- 144. Sa se actualizeze tabelul "Proprietar" astfel incat numarul de telefon al 
--   proprietarilor din orasul "Mamaia" sa fie un numar random hexazecimal de 8 bytes. 


update Proprietar
set Proprietar.NrTelefon=CRYPT_GEN_RANDOM(8,0x25F18060EFD3A9B8)
from Proprietar 
where Proprietar.Oras='Mamaia'

select * from Proprietar
where Oras='Mamaia'


--  145. Modificati pretul pieselor care depasesc 100 lei cu 10 lei. Pentru fiecare piesa afisati categoria si furnizorul acesteia.

select p.Denumire as Piesa, c.Tip as Categorie, f.Nume as Furnizor,c.Pret
from Categorie c
inner join Piese p on c.idCategorie=p.idCategorie
inner join Furnizori f on f.idFurnizor=p.idFurnizor

update  c
set c.Pret+=10
from Categorie c
where c.Pret>100

select p.Denumire as Piesa, c.Tip as Categorie, f.Nume as Furnizor,c.Pret
from Categorie c
inner join Piese p on c.idCategorie=p.idCategorie
inner join Furnizori f on f.idFurnizor=p.idFurnizor

-- 146. Pentru anagajatul cu functia de patron, sa i se codifice ultimele 4 cifre din numar cu caracterul '*'.

select a.Nume,a.Prenume,a.NrTelefon
from Angajati a
inner join FunctiiAngajati fa on fa.idAngajat=a.idAngajat
inner join Functii f on f.idFunctie=fa.idAngajat
where f.Denumire='Patron'

update a
set a.NrTelefon=concat(SUBSTRING(a.NrTelefon,1,6),'****')
from Angajati a
inner join FunctiiAngajati fa on fa.idAngajat=a.idAngajat
inner join Functii f on f.idFunctie=fa.idAngajat
where f.Denumire='Patron'

select a.Nume,a.Prenume,a.NrTelefon
from Angajati a
inner join FunctiiAngajati fa on fa.idAngajat=a.idAngajat
inner join Functii f on f.idFunctie=fa.idAngajat
where f.Denumire='Patron'


-- 147. Modificati tabela autovehicul astfel incat in fata acelora cu carburantul benzina sa apara caracaterul '#'.

update a
set a.Carburant=concat('#',a.Carburant)
from Autovehicul a
where a.Carburant='Benzina'

select *
from Autovehicul a
where a.Carburant='#Benzina'

-- 148. Sa se modifice toate autovehiculele care au culoarea rosu in culoarea mov.

select *
from Autovehicul
where Culoare='Rosu'

update a
set a.Culoare='Mov'
from Autovehicul a
where a.Culoare='Rosu'

select *
from Autovehicul
where Culoare='Mov'

-- 149. A fost introdusa o noua politica a lantului de service-uri astfel incat manopera reparatiilor ce foloseste
-- piese din categoria Filtre va creste cu 10 lei. Faceti actualizarile necesare.

select  c.Tip,c.Pret
from Piese p
inner join Categorie c on c.idCategorie=p.idPiesa
inner join Reparatii r on r.idPiesa=p.idPiesa
where c.Tip='Filtre'

update r
set r.Manopera+=10
from Reparatii r
inner join Piese p on r.idPiesa=p.idPiesa
inner join Categorie c on c.idCategorie=p.idPiesa
where c.Tip='Filtre'


-- 150. Sa se modifice numele proprietarului: sa fie scris cu majuscule si judetul nr de inmatriculare sa inceapa cu PH 
--pentru cele reparate in service-ul din Ploiesti.

select a.Model,p.Nume+' '+p.Prenume
from Proprietar p
inner join AutovehiculeProprietar ap on ap.idProprietar=p.idProprietar
inner join Autovehicul a on a.idAutovehicul=ap.idAutovehicul
inner join programari prog on prog.idProprietate=ap.idProprietate
inner join Service s on s.idService=prog.idService
where  s.Oras='Ploiesti'  and substring(ap.NrInmatriculare,1,2)='PH'


update p
set p.Nume=upper(p.Nume)
from Proprietar p
inner join AutovehiculeProprietar ap on ap.idProprietar=p.idProprietar
inner join Autovehicul a on a.idAutovehicul=ap.idAutovehicul
inner join programari prog on prog.idProprietate=ap.idProprietate
inner join Service s on s.idService=prog.idService
where  s.Oras='Ploiesti' and substring(ap.NrInmatriculare,1,2)='PH'



-- 151. Se doreste micsorarea salariului patronului cu 10%. Realizati modificarile asupra tabelei Salariu.

declare @procent real;
set @procent=0.1;

update s
set s.SalariuBrut-=@procent*s.SalariuBrut
from Salariu s
inner join FunctiiAngajati fa on fa.idFunctieAngajat=s.idFunctieAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
where f.Denumire='Patron'


-- 152. Din motive pandemice, ora de inchidere a service-ului din Bucuresti va fi 8:00-22:00. Actualizati tabelul.

update s
set s.Program='08:00-22:00'
from Service s
where s.Oras='Bucuresti'

select *
from Service
where Oras='Bucuresti'

-- 153. Sa se modifice toate prenumele 'George' in 'Andrei' din tabelul Angajati.

update a
set a.Prenume='Andrei'
from Angajati a
where a.Prenume='George'

select * from  Furnizori

-- 154. Sa se modifice tara ca fiind Germania pentru furnizorii cu sediul in orasul Munchen.

update f
set f.Tara='Germania'
from Furnizori f
where f.Oras='Munchen'

-- 155. Sa se scrie cu litere mici numele proprietarilor care au avut masina intr-un service.

update p
set p.Nume=lower(p.Nume),p.Prenume=lower(p.Prenume)
from Proprietar p
inner join AutovehiculeProprietar ap on ap.idProprietar=p.idProprietar
inner join Programari prog on prog.idProprietate=ap.idProprietate
where prog.idProprietate=ap.idProprietate

select * 
from Proprietar p 
inner join AutovehiculeProprietar ap on ap.idProprietar=p.idProprietar
inner join Programari prog on prog.idProprietate=ap.idProprietate
where prog.idProprietate=ap.idProprietate



---------------------------------------------------------- DELETE(15) ---------------------------------------------------------


-- 156. Stergeti toti angajatii care sunt angajati la service-ul din Timisoara.

begin tran

 alter table FunctiiAngajati
 drop constraint FK__FunctiiAn__idAng__2B3F6F97
 alter table FunctiiAngajati
 add constraint FK_FctAng
 foreign key (idAngajat) references Angajati(idAngajat) on delete cascade;


 alter table ReparatiiAutovehicule
 drop constraint FK__Reparatii__idAng__71D1E811
 alter table ReparatiiAutovehicule
 add constraint FK_RepAng
 foreign key (idAngajat) references Angajati(idAngajat) on delete cascade;


	delete a
	from Angajati a
	inner join Service s on s.idService=a.idService
	where s.Oras='Timisoara'

	select * from Angajati
rollback

-- 157. Sa se stearga cea mai scumpa categorie de produse.
begin tran

alter table Piese
drop constraint FK__Piese__idCategor__3E52440B
alter table Piese
add constraint FK_Categ
foreign key (idCategorie) references Categorie(idCategorie) on delete cascade;

alter table Reparatii
drop constraint FK__Reparatii__idPie__440B1D61
alter table Reparatii
add constraint FK_RepPie
foreign key (idPiesa) references Piese(idPiesa) on delete cascade;

delete
from Categorie 
where Pret = (select min(Pret) from Categorie)

select c.Pret from Categorie c
rollback

-- 158. Sa se stearga service-ul cu localizarea in Oradea.

begin tran

delete from Service
where Oras='Oradea'

	select * from Service
rollback

-- 159. Sa se stearga autovehiculul de tip motocicleta care este de model 'Harley Davidson'.

delete from Autovehicul
where Model='Harley Davidson' and Categorie='Motocicleta'

select * from Autovehicul


-- 160. Sa se stearga impozitul 'Impozit pe Venit'.

begin tran

	alter table ImpoziteSalariu
	drop constraint FK__ImpoziteS__idImp__4F7CD00D
	alter table ImpoziteSalariu
	add constraint FK_ImpSal
	foreign key (idImpozit) references Impozite(idImpozit) on delete  cascade;

	delete from Impozite
	where Nume='Impozit pe Venit'

	select * from Impozite
rollback

-- 161. Stergeti furnizorul 'Ajax'.

begin tran

	delete from Furnizori
	where Nume='Ajax'

	select * from Furnizori
rollback


-- 162. Stergeti toti angajatii care sunt angajati la service-ul din Bucuresti care au peste 30 de ani.

begin tran

 alter table FunctiiAngajati
 drop constraint FK__FunctiiAn__idAng__2B3F6F97
 alter table FunctiiAngajati
 add constraint FK_FctAng
 foreign key (idAngajat) references Angajati(idAngajat) on delete cascade;


 alter table ReparatiiAutovehicule
 drop constraint FK__Reparatii__idAng__71D1E811
 alter table ReparatiiAutovehicule
 add constraint FK_RepAng
 foreign key (idAngajat) references Angajati(idAngajat) on delete cascade;


	delete a
	from Angajati a
	inner join Service s on s.idService=a.idService
	where s.Oras='Bucuresti' and datediff(year,a.DataNastere,current_timestamp)>30

	select * from Angajati
rollback

-- 163. Sa se stearga categoria anvelope.

begin tran
	delete from Categorie
	where Categorie.Tip='Anvelope'

	select * from Categorie
rollback


-- 164. Stergeti toti angajatii cu prenumele de 'Andrei' din service-ul din Ploiesti.

begin tran

 alter table FunctiiAngajati
 drop constraint FK__FunctiiAn__idAng__2B3F6F97
 alter table FunctiiAngajati
 add constraint FK_FctAng
 foreign key (idAngajat) references Angajati(idAngajat) on delete cascade;


 alter table ReparatiiAutovehicule
 drop constraint FK__Reparatii__idAng__71D1E811
 alter table ReparatiiAutovehicule
 add constraint FK_RepAng
 foreign key (idAngajat) references Angajati(idAngajat) on delete cascade;


	delete a
	from Angajati a
	inner join Service s on s.idService=a.idService
	where a.Prenume='Andrei' and s.Oras='Ploiesti'

	select * from Angajati
rollback


-- 165. Sa se stearga categoriile de produse care au pretul mai mare de 100 lei.

begin tran

alter table Piese
drop constraint FK__Piese__idCategor__3E52440B
alter table Piese
add constraint FK_Categ
foreign key (idCategorie) references Categorie(idCategorie) on delete cascade;

alter table Reparatii
drop constraint FK__Reparatii__idPie__440B1D61
alter table Reparatii
add constraint FK_RepPie
foreign key (idPiesa) references Piese(idPiesa) on delete cascade;

alter table ReparatiiAutovehicule
drop constraint FK__Reparatii__idRep__70DDC3D8
alter table ReparatiiAutovehicule
add constraint FK_Reparatie
foreign key (idReparatie) references Reparatii(idReparatie) on delete  cascade;


delete c
from Categorie c
where c.Pret >100

select * from Categorie
rollback

-- 166. Sa se stearga autovehiculele din categoria motocicleta.

begin tran

alter table AutovehiculeProprietar
drop constraint FK__Autovehic__idPro__32E0915F
alter table AutovehiculeProprietar
add constraint FK_AutoProp
foreign key (idProprietar) references Proprietar(idProprietar) on delete cascade;

alter table AutovehiculeProprietar
drop constraint FK__Autovehic__idPro__32E0915F
alter table AutovehiculeProprietar
add constraint FK_AutoProp
foreign key (idProprietar) references Proprietar(idProprietar) on delete cascade;


delete p
from Proprietar p
inner join AutovehiculeProprietar as ap on ap.idProprietar=p.idProprietar
inner join Autovehicul a on ap.idAutovehicul=a.idAutovehicul
where a.Categorie='Motocicleta'

rollback

select * from Autovehicul
where Categorie='Motocicleta'


-- 167. Sa se stearga categoriile de produse de tipul 'Vopsea'.

begin tran

alter table Piese
drop constraint FK__Piese__idCategor__3E52440B
alter table Piese
add constraint FK_Categ
foreign key (idCategorie) references Categorie(idCategorie) on delete cascade;

alter table Reparatii
drop constraint FK__Reparatii__idPie__440B1D61
alter table Reparatii
add constraint FK_RepPie
foreign key (idPiesa) references Piese(idPiesa) on delete cascade;

alter table ReparatiiAutovehicule
drop constraint FK__Reparatii__idRep__70DDC3D8
alter table ReparatiiAutovehicule
add constraint FK_Reparatie
foreign key (idReparatie) references Reparatii(idReparatie) on delete  cascade;


delete c
from Categorie c
where c.Tip = 'Vopsea'

select * from Categorie
rollback


-- 168. Stergeti toate masinile inregistrate in service-ul cu id=1.

delete ap
from AutovehiculeProprietar ap
inner join Programari p on ap.idProprietate=p.idProprietate
inner join Proprietar prop on ap.idProprietar=prop.idProprietar
inner join Autovehicul auto on ap.idAutovehicul=auto.idAutovehicul
where p.idService=1


-- 169. Sa se stearga service-urile ce contin in numarul de telefon '56' si orasul in care se afla.

begin tran
delete from s
from Service s
where s.NrTelefon like '%56%'
rollback