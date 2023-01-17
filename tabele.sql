-----------------------CREARE BAZA DE DATE-------------
CREATE DATABASE HomeVet

ON PRIMARY

(

Name = HomeVetData1,
FileName = 'C:\Users\Deea\Desktop\anul 3\proiect abd\Proiect-ABD-HomeVet\HomeVet\HomeVetData1.mdf',
size = 10MB, 
maxsize = unlimited,
filegrowth = 10MB

),
(

Name = HomeVetData2,
FileName = 'C:\Users\Deea\Desktop\anul 3\proiect abd\Proiect-ABD-HomeVet\HomeVet\HomeVetData2.ndf',
size = 10MB,
maxsize = unlimited,
filegrowth = 10MB

)

LOG ON
(

Name = HomeVetLog,
FileName = 'C:\Users\Deea\Desktop\anul 3\proiect abd\Proiect-ABD-HomeVet\HomeVet\HomeVetLog.ldf',
size = 10MB,
maxsize = unlimited,
filegrowth = 10MB

)

USE [HomeVet]


IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Utilizatori' AND xtype='U')
DROP TABLE Utilizatori
CREATE TABLE Utilizatori
(

idUtilizator int not null identity(1,1) primary key,
Nume nvarchar(32) not null,
Prenume nvarchar(32) not null,
Email nvarchar(64) not null,
Parola nvarchar(32) not null,
DataInregistrare date not null
)

IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Specii' AND xtype='U')
DROP TABLE Specii
CREATE TABLE Specii
(

idSpecie int not null identity(1,1) primary key,
Denumire nvarchar(32)

)

IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Pacienti' AND xtype='U')
DROP TABLE Pacienti
CREATE TABLE Pacienti
(

idPacient int not null identity(1,1) primary key,
idUtilizator int foreign key references Utilizatori(idUtilizator),
idSpecie int foreign key references Specii(idSpecie),
Nume nvarchar(32),
Varsta int not null,
Greutate decimal(4,1) not null

)


IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Cabinete' AND xtype='U')
DROP TABLE Cabinete
CREATE TABLE Cabinete
(
idCabinet int not null identity(1,1) primary key,
Adresa nvarchar(64) not null,
)
alter table Cabinete
add Oras  nvarchar(32) not null
alter table Cabinete
add NrTelefon nvarchar(11) not null
alter table Cabinete
add Program nvarchar(32) not null


IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Sectii' AND xtype='U')
DROP TABLE Sectii
CREATE TABLE Sectii
(
idSectie int not null identity(1,1) primary key,
Denumire nvarchar(32),
)


IF EXISTS(SELECT * FROM sysobjects WHERE name = 'CabineteSectii' AND xtype='U')
DROP TABLE CabineteSectii
CREATE TABLE CabineteSectii
(
idCabineteSectii int not null identity (1,1) primary key,
idCabinet int foreign key references Cabinete(idCabinet),
idSectie int foreign key references Sectii(idSectie)
)



IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Medici' AND xtype='U')
DROP TABLE Medici
CREATE TABLE Medici
(

idMedic int not null identity(1,1) primary key,
idCabineteSectii int foreign key references CabineteSectii(idCabineteSectii), 
Nume nvarchar(32),
Prenume nvarchar(32),
Email nvarchar(64) not null,
Parola nvarchar(32) not null
)


IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Asistenti' AND xtype='U')
DROP TABLE Asistenti
CREATE TABLE Asistenti
(
idAsistent int not null identity(1,1) primary key,
idMedic int foreign key references Medici(idMedic),
Nume nvarchar(32),
Prenume nvarchar(32),
Email nvarchar(64) not null,
Parola nvarchar(32) not null
)


IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Programari' AND xtype='U')
DROP TABLE Programari
CREATE TABLE Programari
(
idProgramare int not null identity(1,1) primary key,
idPacient int foreign key references Pacienti(idPacient),
idMedic int foreign key references Medici(idMedic),
DataProgramare Date,
Tip char not null,
StatusProgramare nvarchar(32)
)


IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Intrebari' AND xtype='U')
DROP TABLE Intrebari
CREATE TABLE Intrebari
(
idIntrebare int not null identity(1,1) primary key,
idUtilizator int foreign key references Utilizatori(idUtilizator),
idMedic int foreign key references Medici(idMedic),
MesajIntrebare text,
StatusIntrebare nvarchar(32) not null,
MesajRaspuns nvarchar(64) 
)

IF EXISTS(SELECT * FROM sysobjects WHERE name = 'ProbeColectate' AND xtype='U')
DROP TABLE ProbeColectate
CREATE TABLE ProbeColectate
(
idProba int not null identity(1,1) primary key,
idAsistent int foreign key references Asistenti(idAsistent),
idProgramare int foreign key references Programari(idProgramare),
Locatie nvarchar(32)
)