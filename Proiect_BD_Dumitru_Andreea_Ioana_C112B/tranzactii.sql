--------------------------- TRANZACTII ------------------------------

-- 1. Creati o tranzactie care presupune inserarea unui nou service si afisarea acestuia.

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


-- 2. Creati o tranzactie care presupune inserarea unei inregistrari in tabelul service
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

-- 3. Creati o tranzactie care presupune inserarea unui noi autovehicul si modificarea culorii acestuia.

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

-- 4. Creati o tranzactie prin intermediul careia sa modificati pretul pieselor care depasesc 100 lei cu 10 lei. 
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

-- 5. Sa se creeze o tranzactie care introduce o noua inregistrare in tabelul Furnizori,
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



-- 6. Creati o tranzactie care sa mareasca salariul patronului cu 1000 lei.

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

-- 7. Scrieti o tranzactie care sa adauge un nou angajat in baza de date. Daca id-ul este deja existent,
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

-- 8. Scrieți o tranzacție în care să inserați două rânduri și să modificați alte trei rânduri la alegere în 
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

-- 9. Scieti o tranzactie care sa introduca o noua functie pentru angajati.

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


-- 10. Scrieti o tranzactie care sa scrie cu majuscule orasul tuturor angajatilor care apartin de service-ul din Bucuresti.

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