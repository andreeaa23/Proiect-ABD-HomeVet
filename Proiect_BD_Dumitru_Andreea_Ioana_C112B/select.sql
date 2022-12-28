
-----------------------------------------------SELECT ---------------------------------------------
select * from Autovehicul
select * from AutovehiculeProprietar
select * from Proprietar
select * from Angajati
select * from Functii
select * from FunctiiAngajati
select * from Service
select * from Piese
select * from Furnizori
select * from Categorie
select * from Salariu
select * from Impozite
select * from ImpoziteSalariu


-- 1. Afisati toate numele si prenumele angajatilor ce au functia de manager.

select a.Nume as NumeAngajati, a.Prenume as PrenumeAngajati
from FunctiiAngajati as fa
inner join Angajati as a on fa.idAngajat=a.idAngajat
inner join Functii as f on fa.idFunctie=f.idFunctie
where f.Denumire='Manager'



-- 2. Afisati numele si prenumele angajatilor care s-au angajat dupa anul 2008.

select a.Nume as NumeAngajati,a.Prenume as PrenumeAngajati,fa.DataAngajare as DataAngajare
from FunctiiAngajati as fa
inner join Angajati as a on fa.idAngajat=a.idAngajat
where year(fa.DataAngajare) > 2008

--select *
--from Autovehicul
--where idAutovehicul=4
--update Autovehicul
--set Categorie='Motocicleta'
--where idAutovehicul=4

-- 3. Afisati toate vehiculele din categoria motocicleta.
select *
from Autovehicul
where Categorie='Motocicleta'

-- 4. Afisati proprietarii ce detin autovehicule din categoria motocicleta.

select p.Nume as Nume,p.Prenume as Prenume,a.Categorie as Categorie
from AutovehiculeProprietar as ap
inner join Proprietar p on ap.idProprietar=p.idProprietar
inner join Autovehicul a on ap.idAutovehicul=a.idAutovehicul
where a.Categorie='Motocicleta'


-- 5. Afisati angajatii ce lucreaza la service-ul din Bucuresti.

select a.Nume as NumeAngajati, a.Prenume as PrenumeAngajati,s.Oras as Oras
from Angajati a
inner join Service s on a.idService=s.idService
where s.Oras='Bucuresti'


-- 6. Afisati numele si prenumele patronului ce detine lantul de service-uri auto.

select a.Nume as NumePatron, a.Prenume as PrenumePatron
from FunctiiAngajati as fa
inner join Angajati as a on fa.idAngajat=a.idAngajat
inner join Functii as f on fa.idFunctie=f.idFunctie
where f.Denumire='Patron'

--sau

select distinct a.Nume+' '+a.Prenume as Sef
from FunctiiAngajati fa 
inner join Angajati as a on fa.idAngajat=a.idAngajat
inner join Functii as f on fa.idFunctie=f.idFunctie
where fa.Sefi is null

-- 7. Selectati toate autovehiculele ce au carburantul benzina.

select a.Model as Model, a.Carburant as Carburant
from Autovehicul a
where a.Carburant='Benzina'

-- 8. Afisati toti proprietarii ce detin autovehicule ce au carburantul motorina.

select p.Nume as Nume,p.Prenume as Prenume,a.Model as Model,a.Carburant as Carburant
from AutovehiculeProprietar as ap
inner join Proprietar p on ap.idProprietar=p.idProprietar
inner join Autovehicul a on ap.idAutovehicul=a.idAutovehicul
where a.Carburant='Motorina'

-- 9. Selectati autoturismele ce au peste 120 CP si numele proprietarilor lor.

select p.Nume as Nume,p.Prenume as Prenume,a.Model as Model, a.PutereMotor as PutereMotor
from AutovehiculeProprietar as ap
inner join Proprietar p on ap.idProprietar=p.idProprietar
inner join Autovehicul a on ap.idAutovehicul=a.idAutovehicul
where a.PutereMotor > 120

-- 10. Afisati toti angajatii cu varsta peste 30 de ani.

select a.Nume as Nume, a.Prenume as Prenume,year(a.DataNastere) as AnNastere, DATEDIFF(year,a.DataNastere,current_timestamp) as Varsta
from Angajati a
where  DATEDIFF(year,a.DataNastere,current_timestamp) > 30

-- 11. Afisati toate piesele din categoria 'Filtre'.

select p.Denumire as Filtre
from Piese p
inner join Categorie c on p.idCategorie=c.idCategorie
where c.Tip='Filtre'


-- 12. Afisati numele furnizorului care livreaza piese din categoria 'Parbriz'.

select distinct f.Nume as Nume
from Piese p
inner join Categorie c on p.idCategorie=c.idCategorie
inner join Furnizori f on p.idFurnizor=f.idFurnizor
where c.Tip='Parbriz'

-- 13. Afisati numele celei mai scumpe piese si categoria din care face parte. ---------------> GRUPARE DATE

select  c.idCategorie as ID,MAX(p.Denumire) as Piesa, MAX(c.Tip) as Categorie, MAX(c.Pret) as Pret
from Categorie c
inner join Piese p on c.idCategorie=p.idCategorie
group by c.idCategorie

-- 14. Scrieți o interogare care sa afiseze pentru fiecare categorie ID-ul și valoarea totala a acesteia. ---------------> GRUPARE DATE

select c.idCategorie as ID,SUM(c.Pret*c.Cantitate) as SumaTotala
from Categorie c
group by c.idCategorie


-- 15. Scrieți o interogare care sa afiseze pentru fiecare categorie ID-ul și valoarea totala a acesteia. Afisati si denumirea 
--     categoriei si toate piesele din categoria 'Vopsea'.            --------------->GRUPAREA DATELOR FILTRATE

select c.idCategorie as ID,SUM(c.Pret*c.Cantitate) as SumaTotala, p.Denumire as Piesa,c.Tip as Categorie
from Categorie c
inner join Piese p on c.idCategorie=p.idCategorie
where c.Tip='Vopsea'
group by c.idCategorie,p.Denumire,c.Tip






-- 16. Scrieti o interogare care sa afiseze numarul de produse din fiecare categorie si numele categoriei.

select c.Tip as Categorie, c.Cantitate as Cantitate
from Categorie c

-- 17. Afisati toate orasele din 'Germania' in care furnizorii de piese au sediul.

select f.Oras as Oras
from Furnizori f
where f.Tara='Germania'

-- 18. Afisati toate orasele din 'Germania' in care furnizorii de piese au sediul. Afisati si categoriile de piese
--     pe care le fabrica si denumirea furnizorului.


select distinct f.Oras as Oras, c.Tip as Categorie, f.Nume as Furnizor
from Piese p
inner join Categorie c on p.idCategorie=c.idCategorie
inner join Furnizori f on p.idFurnizor=f.idFurnizor
where f.Tara='Germania'

-- 18. Afisati toate salariile ce au suferit modificari.

select s.SalariuBrut as Salariu
from Salariu s
inner join FunctiiAngajati fa on s.idFunctieAngajat=fa.idFunctieAngajat
where s.DataIesireVigoare is not null

-- 19. Afisati toate impozitele pentru functiile angajatilor cu id=3.

select i.Nume as Impozite
from ImpoziteSalariu imp
inner join Salariu s on imp.idSalariu=s.idSalariu
inner join Impozite i on imp.idImpozit=i.idImpozit
where s.idFunctieAngajat=3


-- 20. Afisati salariile brute ordonate descrescator.

select SalariuBrut
from Salariu
order by SalariuBrut desc

-- 21. Selectati toti angajatii nascuti in data de '1996-04-21'

select a.Nume+' '+a.Prenume as NumeAngajati
from Angajati a
where a.DataNastere='1996-04-21'

-- 21. Afisati toti angajati ai caror nume incepe cu 'A'.

select *
from Angajati
where Nume like 'A%'

-- 22. Afisati toate masinile inregistrate in service-ul cu id=1 si numele proprietarilor acestora.

select prop.Nume+' '+prop.Prenume as Proprietar, auto.Model as Model, ap.NrInmatriculare as NrInmatriculare
from AutovehiculeProprietar ap
inner join Programari p on ap.idProprietate=p.idProprietate
inner join Proprietar prop on ap.idProprietar=prop.idProprietar
inner join Autovehicul auto on ap.idAutovehicul=auto.idAutovehicul
where p.idService=1

-------------------------------------------------------------------- SUBINTEROGARI ----------------------------------------

-- 23. Sa se afiseze toate numele companiilor care furnizeaza produse cu un pret pe unitate 
--     mai mic decat 20.

select f.Nume
from Furnizori f
where EXISTS
( select p.Denumire 
  from Piese p
  inner join Categorie c on p.idCategorie=c.idCategorie
  where p.idFurnizor=f.idFurnizor and c.Pret<20
)

-- 24. Sa se afiseze doar service-urile(numele orasului) care au programari.
select s.Oras
from Service s
where EXISTS
(select p.idProgramare
from Programari p
where p.idService=s.idService
)

-- 25. Sa se afiseze doar nr. de inmatriculare al masinilor a caror reparatie a durat mai putin de 5 zile.

select ap.NrInmatriculare,ap.idProprietate
from AutovehiculeProprietar ap
where EXISTS
( select p.idProgramare
  from Programari as p
   where DATEDIFF(day,p.DataVenire,p.DataIesire) < 5 and p.idProprietate=ap.idProprietate and p.DataIesire is not null
)

-- 26. Sa se afiseze nr. de inmatriculare al masinilor care au fost reparate.

select ap.NrInmatriculare,ap.idProprietate
from AutovehiculeProprietar ap
where EXISTS
( select p.idProgramare
  from Programari as p
   where p.idProprietate=ap.idProprietate and p.DataIesire is not null
)



-- 27. Sa se afiseze angajatii cu functia de 'manager' din fiecare service.

select a.Nume+' '+a.Prenume as Manageri
from Angajati a
where EXISTS
(
select fa.idFunctie
from FunctiiAngajati fa
inner join Functii f on fa.idFunctie=f.idFunctie
where fa.idAngajat=a.idAngajat and f.Denumire='Manager'
) 

-- 28. Sa se afiseze piesele care sunt in cantitati mai mari de 800 bucati.

select p.Denumire
from Piese p
where p.idCategorie=any
(select c.idCategorie
from Categorie c
where c.Cantitate > 800
)

-- 29. Afisati toate piesele daca au toate cantitatea egala cu 800 bucati.

select p.Denumire
from Piese p
where p.idCategorie=all
(select c.idCategorie
from Categorie c
where c.Cantitate = 800
)

-- 30. Sa se afiseze numele  proprietarilor care au lungimea mai mare de 6 litere in ordine alfabetica.

select p.Nume+' '+p.Prenume as Nume
from Proprietar p
where p.idProprietar=any
(
select p.idProprietar
from Proprietar p
where len(p.Nume)>6 
)
order by p.Nume asc


-- 31. Sa se afiseze numele angajatilor al caror nume de telefon se termina cu 7.

select a.Nume+' '+a.Prenume,a.NrTelefon
from Angajati a
where a.idAngajat=any
(select a.idAngajat
from Angajati a
where a.NrTelefon like '%7'
)

-- 32. Sa se afiseze angajatii nascuti in an impar.

select a.Nume+' '+a.Prenume,a.NrTelefon,year(a.DataNastere) as An
from Angajati a
where a.idAngajat=any
(
select a.idAngajat
from Angajati a
where year(a.DataNastere)%2=1
)

----------------------------------------- SELECT  ----------------------------

-- 33. Sa se afiseze toti angajatii al caror nume incepe cu "Dum".

select a.Nume+' '+a.Prenume as NumeAngajat
from Angajati a
where a.Nume like 'Dum%'

-- 34. Sa se afiseze toti angajatii nascuti dupa data de '1980-01-01'.

select a.Nume+' '+a.Prenume as NumeAngajat, a.DataNastere
from Angajati a
where a.DataNastere > '1980-01-01'

-- 34. Sa se afiseze toate salariile pentru fiecare functie, ordonate crescator.

select distinct f.Denumire as Functie, s.SalariuBrut
from FunctiiAngajati fa
inner join Salariu s on fa.idFunctieAngajat=s.idFunctieAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
order by s.SalariuBrut asc

-- 35. Sa se afiseze urmatoarele 5 programari in ordine crescatoare.

select top(5) *
from Programari p
order by p.DataVenire asc

-- 36. Sa se afiseze angajatii nascuti in luna februarie, august, octombrie sau decembrie, 
--ordonati crescator dupa anul nasterii.

select *
from Angajati a
where DATEPART(m,a.DataNastere) IN (2,8,10,12)
order by DATEPART(year,a.DataNastere) asc

-- 37. Sa se afiseze cati proprietari sunt al caror nume incepe cu 'I'

select count(distinct p.Nume)
from Proprietar p
where p.Nume like 'I%'

-- 38. Sa se afiseze orasul service-ului si numarul de prorpietari care au programari(cate programari
--     are fiecare service)  

select Service.Oras
(select count(idService)
from Programari p
where p.idService=Service.idService
)as NrProgramari
from Service 
order by Service.Oras asc


-- 39. Sa se afiseze service-urile ce contin in numarul de telefon '56' si orasul in care se afla.
    
select s.Oras,s.NrTelefon
from Service s
where s.NrTelefon like '%56%'

-- 40. Sa se afiseze numele proprietarilor ce detin masini aduse in service intr-o luna para
--    si sa fie intr-o zi cuprinsa intre 10-21.

select p.Nume+' '+p.Prenume as Proprietar,ap.NrInmatriculare
from AutovehiculeProprietar ap
inner join Autovehicul a on ap.idAutovehicul=a.idAutovehicul
inner join Proprietar p on ap.idProprietar=p.idProprietar
inner join Programari prog on ap.idProprietate=prog.idProprietate
where month(prog.DataVenire)%2=0 and day(prog.DataVenire) between 10 and 20

-- 41. -- Sa se afiseze tara furnizorilor de piese dintr-un oras ce incepe cu litera
--'B' si au un nr. de bucati pe care le-au livrat mai mic decat 500 bucati.

select f.Tara
from Piese p
inner join Furnizori f on p.idFurnizor=f.idFurnizor
inner join Categorie c on p.idCategorie=c.idCategorie
where f.Oras like 'B%'
group by f.Tara
having max(c.Cantitate)<500


-- 42. Sa se afiseze orasul pt fiecare service si cate programari au.

select s.Oras,count(s.idService) as NrProgramari
from Service s,Programari p
where s.idService=p.idService
group by s.Oras

-- 43. Sa se afiseze media salariilor, numai primele 4 cifre.

select left(avg(s.SalariuBrut),4) as Salariu
from Salariu s


------------ OPERATORI PE SETURI DE DATE-------------

-- 44. Sa se afiseze orasele din care provin clientii si angajatii.

select p.Oras --10 rows
from Proprietar p
UNION
select a.Oras --50 rows
from Angajati a
--total: 29 rows, elimina duplicatele

-- 45. Sa se afiseze orasele comune pentru clienti si angajati.

select p.Oras --10 rows
from Proprietar p
INTERSECT
select a.Oras --50 rows
from Angajati a
--total: 3 rows

-- 46. Sa se afiseze angajatii care au functia de 'Mecanic auto' si 'Mecanic mentenanta'.

select a.Nume+' '+a.Prenume as NumeAngajat
from FunctiiAngajati fa
inner join Angajati a on a.idAngajat=fa.idAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
where f.Denumire='Mecanic auto'
INTERSECT
select a.Nume+' '+a.Prenume as NumeAngajat
from FunctiiAngajati fa
inner join Angajati a on a.idAngajat=fa.idAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
where f.Denumire='Mecanic mentenanta'


-- 47. Sa se afiseze angajatii care au functia de 'Mecanic auto', dar nu si de 'Mecanic mentenanta'.

select a.Nume+' '+a.Prenume as NumeAngajat
from FunctiiAngajati fa
inner join Angajati a on a.idAngajat=fa.idAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
where f.Denumire='Mecanic auto'
EXCEPT
select a.Nume+' '+a.Prenume as NumeAngajat
from FunctiiAngajati fa
inner join Angajati a on a.idAngajat=fa.idAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
where f.Denumire='Mecanic mentenanta'

-- 48. Sa se afiseze proprietarii care au programare si au masinile reparate.

select p.Nume+' '+p.Prenume as NumeProprietar
from AutovehiculeProprietar ap
inner join Proprietar p on ap.idProprietar=p.idProprietar
inner join Programari prog on ap.idProprietate=prog.idProgramare
where prog.DataIesire is not null
INTERSECT
select p.Nume+' '+p.Prenume
from Proprietar p


-- 49. Sa se afiseze orasul service-urile care nu au programari.

select s.Oras
from Service s
EXCEPT
select s.Oras
from Service s
inner join Programari p on s.idService=p.idService


-------------------------------- GRUPAREA DATELOR --------------(+cerintele 13, 14)
---- 13. Afisati numele celei mai scumpe piese si categoria din care face parte. ---------------> GRUPARE DATE

--select  c.idCategorie as ID,MAX(p.Denumire) as Piesa, MAX(c.Tip) as Categorie, MAX(c.Pret) as Pret
--from Categorie c
--inner join Piese p on c.idCategorie=p.idCategorie
--group by c.idCategorie

---- 14. Scrieți o interogare care sa afiseze pentru fiecare categorie ID-ul și valoarea totala a acesteia. ---------------> GRUPARE DATE

--select c.idCategorie as ID,SUM(c.Pret*c.Cantitate) as SumaTotala
--from Categorie c
--group by c.idCategorie


-- 50. Sa se afiseze cate comenzi a livrat fiecare furnizor.

select p.idFurnizor,f.Nume as Furnizor, count(*) as NrComenzi
from Piese p
inner join Furnizori f on p.idFurnizor=f.idFurnizor
group by p.idFurnizor,f.Nume

-- 51. Sa se scrie o interogare care calculeaza pretul total pentru fiecare categorie de piese.

select c.idCategorie,c.Tip as Categorie,sum(c.Cantitate*c.Pret) as PretTotal
from Piese p
inner join Categorie c on p.idCategorie=c.idCategorie
group by c.idCategorie,c.Tip


-- 52. Sa se afiseze cate programari are fiecare service.

select s.idService,s.Oras as OrasService, count(*) as NrProgramari
from Service s
inner join Programari p on s.idService=p.idService
group by s.idService,s.Oras


-------------------------------- FILTRAREA DE GRUP --------------(+interogarea nr. 41)
-- 41.  Sa se afiseze tara furnizorilor de piese dintr-un oras ce incepe cu litera
--'B' si au un nr. de bucati pe care le-au livrat mai mic decat 500 bucati.

select f.Tara
from Piese p
inner join Furnizori f on p.idFurnizor=f.idFurnizor
inner join Categorie c on p.idCategorie=c.idCategorie
where f.Oras like 'B%'
group by f.Tara
having max(c.Cantitate)<500

-- 53. Sa se afiseze piesele care au fost livrate in cantitati de mai mult de 100 bucati de cel putin 3 tipuri, 
--     grupate dupa denumirea categoriei.

select  c.Tip, count(*) as NrPiese
from Piese p
inner join Categorie c on p.idCategorie=c.idCategorie
where c.Cantitate>100
group by c.Tip
having count(*)>3


-- 54. Selectati orasul service-urilor cu mai putin de 2 programari de dupa 23 februarie 2022,
--     grupate dupa numele orasului.

select s.Oras,count(*) as NrProgramari
from Service s
inner join Programari p on s.idService=p.idService
where p.DataVenire > '2022-02-23'
group by s.Oras
having count(*)<2


-- 55. Sa se afiseze functiile angajatilor care au cel putin 3 functii cu salariul 
     --mai mare de 2500 lei, grupate dupa denumirea functiei.

select count(*) as NrFunctii, f.Denumire as Functie
from FunctiiAngajati fa
inner join Salariu s on fa.idFunctieAngajat=s.idFunctieAngajat
inner join Functii f on fa.idFunctie=f.idFunctie
inner join Angajati a on fa.idAngajat=a.idAngajat
where s.SalariuBrut>2500
group by f.Denumire
having count(*)<3


-- 56. Afisati proprietarii care au mai mult de o masina al caror nr. de telefon se termina in cifra 6.

select p.Nume,p.Prenume,count(*) as NrMasini
from Proprietar p
inner join AutovehiculeProprietar ap on p.idProprietar=ap.idProprietar
where p.NrTelefon like '%6'
group by p.Nume,p.Prenume
having count(*)>1

-- 57. Sa se afiseze autovehiculele de culoare negru care au maxim 2 proprietari, grupate dupa numele proprietarilor. 

select a.Model, a.Culoare, p.Nume,p.Prenume, count(*) as NrMasini
from AutovehiculeProprietar ap
inner join Proprietar p on ap.idProprietar=p.idProprietar
inner join Autovehicul a on ap.idAutovehicul=a.idAutovehicul
where a.Culoare='Negru'
group by p.Nume,p.Prenume, a.model,a.culoare
having count(*)=2


-------------------------------- GRUPAREA DATELOR FILTRATE ----------------------------(+ interogarea nr. 15, 42)
-- 15. Scrieți o interogare care sa afiseze pentru fiecare categorie ID-ul și valoarea totala a acesteia. Afisati si denumirea 
--     categoriei si toate piesele din categoria 'Vopsea'.            ---------------> GRUPAREA DATELOR FILTRATE

select c.idCategorie as ID,SUM(c.Pret*c.Cantitate) as SumaTotala, p.Denumire as Piesa,c.Tip as Categorie
from Categorie c
inner join Piese p on c.idCategorie=p.idCategorie
where c.Tip='Vopsea'
group by c.idCategorie,p.Denumire,c.Tip

-- 42. Sa se afiseze orasul pt fiecare service si cate programari au.

select s.Oras,count(s.idService) as NrProgramari
from Service s,Programari p
where s.idService=p.idService
group by s.Oras

-- 58. Afisati cate produse are fiecare categorie, grupate in functie de id-ul categoriei.

select c.idCategorie,count(*) as NrPiese, c.Tip as Categorie
from Piese p
inner join Categorie c on c.idCategorie=p.idCategorie
group by c.idCategorie,c.Tip

-- 59. Sa se afiseze service-urile care au programari in intervalul '2022-01-01' si '2022-05-09', grupate dupa numele orasului.

select s.Oras
from Service s
inner join Programari p on s.idService=p.idService
where p.DataVenire>'2022-01-01' and p.DataIesire<'2022-05-09'
group by s.Oras

-- 60. Afisati pentru fiecare angajat de la Ploiesti numarul de masini pe care le-au reparat, grupate dupa numele angajatului.

select a.Nume,a.Prenume,count(*) as NrReparatii
from ReparatiiAutovehicule ra
inner join Angajati a  on a.idAngajat=ra.idAngajat
inner join Service s on a.idService=s.idService
where s.Oras='Ploiesti'
group by a.Nume, a.Prenume



