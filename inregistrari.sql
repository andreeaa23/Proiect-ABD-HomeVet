---------------- inserari inregistrari tabele ----------------

INSERT INTO Utilizatori(Nume, Prenume, Email, Parola, DataInregistrare) VALUES
('Soare','Octavian', 'octavian.soare@mta.ro', 'soare1234', '2022-01-15'),
('Ionita','Daniel', 'daniel.ionita@mta.ro', 'ionita1234', '2022-06-19')

INSERT INTO Cabinete(Adresa, Oras, NrTelefon, Program) VALUES
('str. Bobilna, nr. 12','Ploiesti','0712345678','Non-stop'),
('str. Sforii, nr. 10','Brasov','0798765432','Non-stop'),
('str. Viilor, nr. 30','Bucuresti','0722334455','Non-stop'),
('str. Latina, nr.48','Timisoara','0799887766','Non-stop'),
('str. Constructorilor nr. 3','Constanta','0744567788','Non-stop'),
('str. Gh. Doja, nr. 189','Sibiu','0789987667','Inchis') 


INSERT INTO Sectii(Denumire) VALUES
('Cardiologie'),
('Ortopedie'),
('Toxicologie'),
('Chirurgie'),
('Neurochirurgie'),
('Oncologie'),
('Urologie'),
('Oftalmologie')

INSERT INTO CabineteSectii(idCabinet, idSectie) VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(2,1),
(2,2),
(2,3),
(2,4),
(2,7),
(3,1),
(3,2),
(3,3),
(3,7),
(3,8),
(4,1),
(4,2),
(4,3),
(4,4),
(4,5),
(4,6),
(4,7),
(4,8),
(5,1),
(5,2),
(5,3),
(5,4),
(5,5),
(5,8),
(6,1),
(6,3),
(6,4),
(6,5),
(6,7),
(6,8)

----PT PRIMUL CABINET id=1
INSERT INTO Medici(idCabineteSectii,Nume, Prenume,Email,Parola) VALUES
(1, 'Dumitru', 'Victoria','victoria.dumitru@mta.ro','dumitru1234'),
(2, 'Aciu','Lia','lia.aciu@mta.ro','aciu1234')

--(3, 'Badic','Mihai'),
--(4,'Badea','Ion'),
--(5, 'Coca','Eugen'),
--(6, 'Lascu','Dan'),
--(7, 'Enache','Sorin'),
--(8, 'Munteanu','Adrian')

-------Cabinet id=2
--INSERT INTO Medici(idCabineteSectii,Nume, Prenume) VALUES
--(9, 'Ofrim','Dragos'),
--(10, 'Neamtu','Liviu'),
--(11, 'Munteanu','George'),
--(12, 'Radu','Serghei'),
--(13, 'Samoilescu','Gheorghe'),
--(14, 'Stoian','Dan')

------Cabinet id=3
--INSERT INTO Medici(idCabineteSectii,Nume, Prenume) VALUES
--(15, 'Topa','Vasile'),
--(16, 'Voncila','Ionel'),
--(17, 'Voicu','Violeta'),
--(18, 'Ursachi','Robert'),
--(19,'Raicu','Andrei'),
--(20, 'Teodor','Emanuel'),
--(21, 'Timoftei','Radu')

-----Cabinet id=4
--INSERT INTO Medici(idCabineteSectii,Nume, Prenume,Email,Parola) VALUES
--(22, 'Dima','Stefan'),
--(23, 'Darie','George'),
--(24, 'Herdea','Adrian'),
--(25, 'Radu','Codrut'),
--(26, 'Tudose','Mihai'),
--(27, 'David','Alexandru'),
--(28, 'Miclaus','Marian'),
--(29, 'Petrea','Victor'),
--(30, 'Popescu','Cornel')


-----Cabinet id=5
--INSERT INTO Medici(idCabineteSectii,Nume, Prenume) VALUES
--(31,'Purcaru','Emil'),
--(32,'Popovici','Andrei'),
--(33, 'Badea','Tudor'),
--(34,'Dima','Cosmin'),
--(35,'Ursu','George'),
--(36,'Soare','Octavian'),
--(37, 'Radu','Toader'),
--(38, 'David','Ionut'),
--(1,'Barbu','Madalina'),
--(2,'Moise','Sarah')


--- Cabinet id=6
--INSERT INTO Medici(idSectie, Nume, Prenume, idCabinet) VALUES
--(1,'Miclaus','Marin',6),
--(3,'Petre','Victoras',6),
--(3,'Ionescu','Corneliu',6),
--(4, 'Vasilache','Serbastian',6),
--(5,'Popescu','Vlad' ,6),
--(7, 'Dumitrascu','Vasile',6),
--(8, 'Achim','Liliana',6)


-- nu toti medicii vor avea asistenti
INSERT INTO Asistenti(idMedic,Nume, Prenume,Email,Parola) VALUES
(1,'Lascuzeanu','Daniel','daniel.lascuzeaznu@mta.ro','lascuzeanu1234'),
(2,'Avram','Sorinel','sorinel.avram@mta.ro','avram1234')


