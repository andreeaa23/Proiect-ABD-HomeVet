---------       INSERT QUERIES -----------------

-- 1. Inserati inregistrari in tabelul SERVICE:

INSERT INTO Service(idService,Adresa,NrTelefon,Oras,Program) VALUES
(1,'str. Bobilna, nr. 12','0712345678','Ploiesti','Non-stop'),
(2,'str. Sforii, nr. 10','0798765432','Brasov','Non-stop'),
(3,'str. Viilor, nr. 30','0722334455','Bucuresti','Non-stop'),
(4,'str. Latina, nr.48','0799887766','Timisoara','Non-stop'),
(5,'str. Constructorilor, nr. 3','0744567788','Constanta','Non-stop')
INSERT INTO Service(idService,Adresa,NrTelefon,Oras,Program) VALUES
(6,'str. Gh. Doja, nr. 189','0789987667','Sibiu','Inchis') --service fara programare


-- 2. Inserati inregistrari in tabelul PROPRIETAR:

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

-- 3. Inserati inregistrari in tabelul AUTOVEHICUL: 

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


INSERT INTO Autovehicul(idAutovehicul,Categorie,Model,Culoare,Carburant,NrKm,PutereMotor,SerieSasiu) VALUES
(15,'Motocicleta','Harley Davidson','Negru','Motorina','15.369',150,'1HACH41JXMN107886')

-- 4. Inserati inregistrari in tabelul AUTOVEHICULE PROPRIETAR 

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

-- 5. Inserati inregistrari in tabelul ANGAJATI

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



-- 6. Inserati inregistrari in tabelul FUNCTII

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
INSERT INTO Functii(idFunctie,Denumire) VALUES
(13, 'Curatator')

-- 7. Inserati inregistrari in tabelul FUNCTII ANGAJATI 

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


-- 8. Inserati inregistrari in tabelul CATEGORIE:

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

-- 9. Inserati inregistrari in tabelul FURNIZORI:


INSERT INTO Furnizori(idFurnizor,Nume,Adresa,Oras,CodPostal,Tara,NrTelefon) VALUES
(1,'Total','str. Stejarilor, nr. 2','Brasov','507055',' Romania','0268401711'),
(2,'Bosch','49 Gilbert St.','Munchen','EC1 4SD','Germania','1715552222'),
(3,'A.B.S.','Josef-Orlopp-Strabe 55','Berlin','10365','Germania','0316302230'),
(4,'Ridex','92 Setsuko Chuo-ku','Osaka','545','Japonia','064317877'),
(5,'Stark','Kaloadagatan 13','Göteborg','S-345 67','Suedia','0319876543'),
(6,'Van Wezel','Tiergartenstraße 5','Berlin','10785','Germania','0109984510'),
(7,'Mann Filter','Sales Representative','Ravenna','48100','Italia','054460323')

-- 10. Inserati inregistrari in tabelul PIESE:

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


-- 11. Inserati inregistrari in tabelul IMPOZITE:

INSERT INTO Impozite(idImpozit,Nume,Procent) VALUES
(1,'Asigurare Sanatate',25),
(2,'Asigurare Sociala',10),
(3,'Impozit pe Venit',10),
(4,'CAM',2.25)


-- 12. Inserati inregistrari in tabelul SALARIU:

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


-- 13. Inserati inregistrari in tabelul IMPOZITE SALARIU:

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


-- 14. Inserati inregistrari in tabelul PROGRAMARI:

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


-- 15. Inserati inregistrari in tabelul REPARATII:

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



-- 16. Inserati inregistrari in tabelul REPARATII AUTOVEHICULE:

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


