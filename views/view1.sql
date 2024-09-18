CREATE View PlessoAule(plesso_id, aule, max_stud) As
Select P.id, count(*), sum(Capienza)
From Plesso P, Aula A
Where A.IDPlesso = P.id 
Group By P.id