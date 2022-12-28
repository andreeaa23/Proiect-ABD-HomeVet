-------------------------------- UPDATE --------------------------------

-- 1. Sa se actualizeze programul de lucru al service-ului cu program 'Inchis' ca fiind 'Non-stop'.
select *
from Service s
where s.Program='Inchis'

update Service
set Service.Program='Non-stop'
where Service.Program='Inchis'


-- 2. Sa se mareasca toate salariilor angajatilor cu functia de 'Manager' cu 1000lei.

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


-- 3. Actualizati tabelul 'Proprietar' astfel incat celor care le-a fost reparata masina sa aiba numele scris cu majuscule.

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


-- 4. Sa se actualizeze tabelul "Proprietar" astfel incat numarul de telefon al 
--   proprietarilor din orasul "Mamaia" sa fie un numar random hexazecimal de 8 bytes. 


update Proprietar
set Proprietar.NrTelefon=CRYPT_GEN_RANDOM(8,0x25F18060EFD3A9B8)
from Proprietar 
where Proprietar.Oras='Mamaia'

select * from Proprietar
where Oras='Mamaia'


--  5. Modificati pretul pieselor care depasesc 100 lei cu 10 lei. Pentru fiecare piesa afisati categoria si furnizorul acesteia.

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

-- 6. Pentru anagajatul cu functia de patron, sa i se codifice ultimele 4 cifre din numar cu caracterul '*'.

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


-- 7. Modificati tabela autovehicul astfel incat in fata acelora cu carburantul benzina sa apara caracaterul '#'.

update a
set a.Carburant=concat('#',a.Carburant)
from Autovehicul a
where a.Carburant='Benzina'

select *
from Autovehicul a
where a.Carburant='#Benzina'

-- 8. Sa se modifice toate autovehiculele care au culoarea rosu in culoarea mov.

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

-- 9. A fost introdusa o noua politica a lantului de service-uri astfel incat manopera reparatiilor ce foloseste
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


-- 10. Sa se stearga ce urmeaza dupa 'Peugeot', numele prop sa fie scris cu majuscule si judetul nr de inmatriculare sa inceapa cu PH pt cele
--  reparate in service-ul din Ploiesti.

select a.Model,p.Nume+' '+p.Prenume
from Proprietar p
inner join AutovehiculeProprietar ap on ap.idProprietar=p.idProprietar
inner join Autovehicul a on a.idAutovehicul=ap.idAutovehicul
inner join programari prog on prog.idProprietate=ap.idProprietate
inner join Service s on s.idService=prog.idService
where a.Model like 'Peugeot%' and s.Oras='Ploiesti'  and substring(ap.NrInmatriculare,1,2)='PH'


update p
set p.Nume=upper(p.Nume)
from Proprietar p
inner join AutovehiculeProprietar ap on ap.idProprietar=p.idProprietar
inner join Autovehicul a on a.idAutovehicul=ap.idAutovehicul
inner join programari prog on prog.idProprietate=ap.idProprietate
inner join Service s on s.idService=prog.idService
where a.Model like 'Peugeot%' and s.Oras='Ploiesti' and substring(ap.NrInmatriculare,1,2)='PH'

-- 11. Se doreste micsorarea salariului patronului cu 10%. Realizati modificarile asupra tabelei Salariu.

declare @procent real;
set @procent=0.1;

update s
set s.SalariuBrut-=@procent*s.SalariuBrut
from Salariu s
inner join FunctiiAngajati fa on fa.idFunctieAngajat=s.idFunctieAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
where f.Denumire='Patron'


-- 12. Din motive pandemice, ora de inchidere a service-ului din Bucuresti va fi 8:00-22:00. Actualizati tabelul.

update s
set s.Program='08:00-22:00'
from Service s
where s.Oras='Bucuresti'

select *
from Service
where Oras='Bucuresti'

-- 13. Sa se modifice toate prenumele 'George' in 'Andrei' din tabelul Angajati.

update a
set a.Prenume='Andrei'
from Angajati a
where a.Prenume='George'

select * from  Furnizori
-- 14. Sa se modifice tara ca fiind Germania pentru furnizorii cu sediul in orasul Munchen.

update f
set f.Tara='Germania'
from Furnizori f
where f.Oras='Munchen'

-- 15. Sa se scrie cu litere mici numele proprietarilor care au avut masina intr-un service.

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

