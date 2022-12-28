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
)

LOG ON
(
Name = TomServiceLog1,
Filename = 'D:\Proiect_BD_Dumitru_Andreea_Ioana_C112B\TomService.ldf',
size = 10MB,
maxsize = 50MB,
filegrowth = 10MB
)

--CREARE TABEL SERVICE

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


--CREARE TABLE ANGAJATI

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


--CREARE TABEL FUNCTII

if OBJECT_ID('Functii','U') is not null
drop table Functii
go
CREATE TABLE Functii
(
  idFunctie int not null PRIMARY KEY,
  Denumire nvarchar(64) not null,

)


--CREARE TABLE FUNTII ANGAJATI

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

--CREARE TABEL PROPRIETAR

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


--CREARE TABEL AUTOVEHICUL

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


--CREARE TABEL AUTOVEHICULE PROPRIETAR

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


--CREARE TABEL PROGRAMARI

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


--CREARE TABEL CATEGORIE

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


--CREARE TABEL FURNIZORI

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


--CREARE TABEL PIESE

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


--CREARE TABEL REPARATII

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


--CREARE TABEL REPARATII AUTOVEHICULE

if OBJECT_ID('ReparatiiAutovehicule','U') is not null
drop table ReparatiiAutovehicule
go
CREATE TABLE ReparatiiAutovehicule
(
   idReparatieAuto int not null PRIMARY KEY,
   idReparatie int not null FOREIGN KEY REFERENCES Reparatii(idReparatie),
   idAngajat int not null FOREIGN KEY REFERENCES Angajati(idAngajat)
)


--CREARE TABLE SALARIU

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


--CREARE TABEL IMPOZITE

if OBJECT_ID('Impozite','U') is not null
drop table Impozite
go
CREATE TABLE Impozite
(
   idImpozit int not null PRIMARY KEY,
   Nume nvarchar(32) not null,
   Procent decimal(18,2) not null
)


-- CREARE TABEL IMPOZITE SALARIU

if OBJECT_ID('ImpoziteSalariu','U') is not null
drop table ImpoziteSalariu
go
CREATE TABLE ImpoziteSalariu
(
   idImpoziteSalariu int not null PRIMARY KEY,
   idSalariu int not null FOREIGN KEY REFERENCES Salariu(idSalariu),
   idImpozit int not null FOREIGN KEY REFERENCES Impozite(idImpozit)
)