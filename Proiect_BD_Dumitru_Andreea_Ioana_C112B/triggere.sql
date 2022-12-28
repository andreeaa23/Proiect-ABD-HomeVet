-------------------- TRIGGERE -----------------

-- 1. Sa se creeze un trigger pentru identificarea duplicatelor oraselor in tabelul Service.

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

-- 2. Sa se creeze un trigger pentru tabelul Proprietari. Sa se afiseze un mesaj corespunzator dupa
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

 -- 3. Creati un declansator care sa afiseze un mesaj dupa un delete din tabelul Autovehicule.

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

-- 4. Creati un trigger care sa selecteze service-ul in care o programare a fost actualizata.

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

-- 5. Creati un trigger care sa afiseze pretul maxim al unei piese inserate sau modificate.

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

-- 6. Creati un trigger care sa completeze automat tara Furnizorilor ca fiind Romania.

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

-- 7. Creati un trigger care sa permita doar inserarea salariului brut mai mare de 2500 lei.

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

-- 8. Sa se verifice daca la introducerea numarului de telefon acesta contine 10 cifre.

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

-- 9. Sa se creeze un trigger care la inserarea unei piese acesteia sa i se creasca pretul cu 10 lei.

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

-- 10. Sa se creeze un declansator care dupa stergerea unei valori din tabelul Reparatii sa afiseze un mesaj corespunzator.

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