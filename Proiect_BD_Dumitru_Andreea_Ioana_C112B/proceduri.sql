----------------- PROCEDURI STOCATE -------------

-- 1. Creati o procedura care presupune aflarea unei programari intr-un anumit interval de zile.

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

-- 2. Creati o procedura stocata care sa efectueze o reducere de x % pentru toate produsele din categoria y.

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

-- 3. Creati o procedura stocata care sa afiseze toate campurile din tabela Angajati al caror nume incepe
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

-- 4. Sa se creeze o procedura cu parametru care permite vizualizarea angajatilor
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

-- 5. Sa se creeze o procedura prin care se vor afisa toti angajatii care au acelasi salariu. Salariul
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


-- 6.Sa se creeze o procedura care va permite vizualizarea varstei medii pentru un an trimis ca parametru
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

-- 7. Creati o procedura care sa afiseze toate piesele livrate de un furnizor trimis ca parametru.

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

-- 8. Sa se afiseze nr. de inmatriculare al masinilor inregistrate intr-un service trimis ca parametru al procedurii, 
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

-- 9. Sa se creeze o procedura stocata care creste manopera cu x lei daca aceasta este mai mica decat y lei.

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

-- 10. Creati o procedura stocata care afiseaza toti angajatii din orasul Bucuresti si al caror nr. de telefon se termina cu cifra 2.

if OBJECT_ID('AngajatiBucuresti','P') is not null
drop procedure AngajatiBucuresti
go
create procedure AngajatiBucuresti
as
	select a.Nume+' '+a.Prenume as Angajati,a.Oras
	from Angajati a
	where a.Oras='Bucuresti' and a.NrTelefon like '%2'

exec AngajatiBucuresti

-- 11.  Creati o procedura stocata care sa afiseze angajatii nascuti in luna februarie, august, octombrie sau decembrie, 
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



	
