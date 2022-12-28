--------------- CTE --------------------

-- 1. Sa se creeze o expresie care afiseaza cea mai ieftina categorie de piese.

with PretMin as
(
   select min(c.Pret) as PretMin,c.Tip as Categorie
   from categorie c
   group by c.Tip
)
select top(1) p.PretMin,p.Categorie
from PretMin p
order by p.PretMin asc

-- 2. Creati un CTE care sa afiseze numarul de programari si orasul pentru service-ul cu cele
--    mai multe programari.

with NrProgramari as --calculez pt fiecare service nr de programari
(
  select count(*) as NrProgramari, s.Oras
  from Programari p
  inner join Service s on s.idService=p.idService
  group by s.Oras
),
MaxProg as --aflu maximul din toate
(
  select max(NrProgramari) as NrMaxProg
  from NrProgramari
)
select  NrMaxProg, nr.Oras 
from MaxProg
inner join NrProgramari nr on nr.NrProgramari=NrProgramari

-- 3. Creati un CTE care sa afiseze pentru fiecare functie salariul net.
with ProcentImpozite as
(
   select i.Nume as Impozit,i.Procent, s.SalariuBrut,f.Denumire as Functie
   from ImpoziteSalariu imps
   inner join Impozite i on i.idImpozit=imps.idImpozit
   inner join Salariu s on s.idSalariu=imps.idSalariu
   inner join FunctiiAngajati fa on fa.idFunctieAngajat=s.idFunctieAngajat
   inner join Functii f on f.idFunctie=fa.idFunctie
),
SalariuNet as
(
   select imp.Functie, sum(imp.SalariuBrut-(imp.Procent*imp.SalariuBrut)/100) as SalariuTotal
   from ProcentImpozite imp
   group by imp.Functie
)
select sn.Functie,sn.SalariuTotal
from SalariuNet sn


-- 4. Sa se creeze un CTE care sa afiseze numarul de progaramari(mai mult decat una) pentru fiecare luna din anul 2022.

;with ProgramariLunare(LunaProgramare,NrProgramari) as
(
   select count(*) as NrProgramari, convert(nvarchar(32),month(p.DataVenire),6)
   from Programari p
   group by month(p.DataVenire)
   having count(*)>1
)
select * from ProgramariLunare

-- 5. Sa se afiseze doar nr. de inmatriculare al masinilor a caror reparatie a durat mai putin de 10 zile.

;with MasiniReparate as
(
  select ap.NrInmatriculare, DATEDIFF(day,p.DataVenire,p.DataIesire) as NrZile
  from AutovehiculeProprietar ap
  inner join Programari p on p.idProprietate=ap.idProprietate
  where DATEDIFF(day,p.DataVenire,p.DataIesire) < 10 and p.idProprietate=ap.idProprietate and p.DataIesire is not null
)
select *
from MasiniReparate

-- 6. Creati un CTE in care sa afisati modelul masinilor de culoare negru si carburant benzina, proprietarul acestora si nr de inmatriculare.

;with MasiniBenzina as
(
  select p.Nume+' '+p.Prenume as Proprietar,a.Model,a.Culoare,a.Carburant,ap.NrInmatriculare
  from Autovehicul a
  inner join AutovehiculeProprietar ap on a.idAutovehicul=ap.idAutovehicul
  inner join Proprietar p on p.idProprietar=ap.idProprietar
  where a.Carburant='Benzina' and a.Culoare='Negru'
)
select *
from MasiniBenzina

-- 7. Sa se creeze un CTE care sa afiseze angajatii, denumirea service-ului de care apartin si seful acestora.

;with Sefi as
(
   select s.Oras,a2.Nume+' '+a2.Prenume as Angajati,a.Nume+' '+a.Prenume as Sefi
   from FunctiiAngajati fa
   inner join Angajati a on a.idAngajat=fa.idAngajat
   inner join Service s on s.idService=a.idService
   inner join FunctiiAngajati fa2 on fa.idAngajat=fa2.Sefi
   inner join Angajati a2 on a2.idAngajat=fa2.idAngajat
   
)
select * from Sefi