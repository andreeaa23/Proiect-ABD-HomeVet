------------------------------------ DELETE ------------------------------------------

-- 1. Stergeti toti angajatii care sunt angajati la service-ul din Timisoara.

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

-- 2. Sa se stearga cea mai scumpa categorie de produse.
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

-- 3. Sa se stearga service-ul cu localizarea in Oradea.

begin tran

delete from Service
where Oras='Oradea'

	select * from Service
rollback

-- 4. Sa se stearga autovehiculul de tip motocicleta care este de model 'Harley Davidson'.

delete from Autovehicul
where Model='Harley Davidson' and Categorie='Motocicleta'

select * from Autovehicul


-- 5. Sa se stearga impozitul 'Impozit pe Venit'.

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

-- 6. Stergeti furnizorul 'Ajax'.

begin tran

	delete from Furnizori
	where Nume='Ajax'

	select * from Furnizori
rollback


-- 7. Stergeti toti angajatii care sunt angajati la service-ul din Bucuresti care au peste 30 de ani.

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

-- 8. Sa se stearga categoria anvelope.

begin tran
	delete from Categorie
	where Categorie.Tip='Anvelope'

	select * from Categorie
rollback


-- 9. Stergeti toti angajatii cu prenumele de 'Andrei' din service-ul din Ploiesti.

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

-- 10. Sa se stearga toti angajatii cu functia de 'Manager' din Ploiesti.

--begin tran

-- alter table FunctiiAngajati
-- drop constraint FK__FunctiiAn__idFun__2C3393D0
-- alter table FunctiiAngajati
-- add constraint FK_FctAng1
-- foreign key (idAngajat) references Angajati(idAngajat) on delete no action;


-- alter table ReparatiiAutovehicule
-- drop constraint FK_RepAng
-- alter table ReparatiiAutovehicule
-- add constraint FK_RepAng
-- foreign key (idAngajat) references Angajati(idAngajat) on delete cascade;

-- alter table Salariu
-- drop constraint FK_FctAngSal
-- alter table Salariu
-- add constraint FK_SalAng
-- foreign key (idFunctieAngajat) references FunctiiAngajati(idFunctieAngajat) on delete cascade;


-- alter table ImpoziteSalariu
-- drop constraint FK__ImpoziteS__idSal__4E88ABD4
-- alter table ImpoziteSalariu
-- add constraint FK_ImpSal
-- foreign key(idSalariu) references Salariu(idSalariu) on delete cascade;

-- update fa
-- set fa.Sefi=NULL
-- from FunctiiAngajati fa
-- inner join functii f on f.idFunctie=fa.idFunctie
-- where f.Denumire='Manager'

-- alter table FunctiiAngajati
-- drop constraint FK_Sefi
-- alter table FunctiiAngajati
-- add constraint FK_Sefi1
-- foreign key (Sefi) references FunctiiAngajati(idFunctieAngajat) on delete no action;


	delete a
	from Angajati a
	inner join Service s on s.idService=a.idService
	inner join FunctiiAngajati fa on fa.idAngajat=a.idAngajat
	inner join Functii f on f.idFunctie=fa.idFunctie
	inner join FunctiiAngajati fa1 on fa1.Sefi=fa1.Sefi
	where f.Denumire='Manager' and s.Oras='Ploiesti'

--	select * from Angajati
--rollback

--alter table Salariu
--add constraint FK_FctAngSal
--foreign key (idFunctieAngajat) references FunctiiAngajati(idFunctieAngajat)


-- 11. Sa se stearga categoriile de produse care au pretul mai mare de 100 lei.

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

-- 12. Sa se stearga autovehiculele din categoria motocicleta.

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


-- 13. Sa se stearga categoriile de produse de tipul 'Vopsea'.

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


-- 14. Stergeti toate masinile inregistrate in service-ul cu id=1.

delete ap
from AutovehiculeProprietar ap
inner join Programari p on ap.idProprietate=p.idProprietate
inner join Proprietar prop on ap.idProprietar=prop.idProprietar
inner join Autovehicul auto on ap.idAutovehicul=auto.idAutovehicul
where p.idService=1


-- 15. Sa se stearga service-urile ce contin in numarul de telefon '56' si orasul in care se afla.

begin tran
delete from s
from Service s
where s.NrTelefon like '%56%'
rollback