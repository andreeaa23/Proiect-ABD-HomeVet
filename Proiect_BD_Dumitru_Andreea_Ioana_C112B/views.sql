--------------------------- VIEWS -------------------------

-- 1. Creati o vedere in care sa stocati numele, prenumele si varsta angajatilor de peste 35 ani, orasul service-ului la care sunt angajati,
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

-- 2. Creati o vedere in care sa inserati categoria, tipul pieselor din acea categorie, suma totala si furnizorii ce le-au livrat

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

-- 3. Sa se creeze un view in care sa se stocheze proprietarii ce au adus masini la reparat, nr. de inmatriculare, modelul,
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


-- 4. Creati o vedere in care sa stocati toate autoturismele ce au carburantul 'Benzina' si au peste 110 CP, proprietarii acestora, 
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


-- 5. Creati o vedere in care sa afisati anagajatii care au reparat mai mult de 1 masina, numele acestora, numarul de telefon, functia si service-ul.

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
