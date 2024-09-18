
-- SELECT classe.IDClasse, (SELECT COUNT(*)
-- 						FROM storicoiscrizioni
-- 						GROUP BY storicoiscrizioni.AnnoScolastico, storicoiscrizioni.IDClasse) as niscritti
-- FROM classe, storicoiscrizioni
-- WHERE CLASSE.IDClasse = storicoiscrizioni.IDClasse
-- HAVING niscritti > (SELECT (SELECT COUNT(*)
-- 							FROM storicoiscrizioni
-- 							GROUP BY storicoiscrizioni.AnnoScolastico, storicoiscrizioni.IDClasse) as conta)

SELECT classe.IDClasse, AnnoScolastico
FROM classe, storicoiscrizioni
WHERE (	SELECT COUNT(*)
		FROM storicoiscrizioni
        where storicoiscrizioni.IDClasse = classe.IDClasse) > (	SELECT Round(AVG(quanti)) AS Media
																FROM (	SELECT COUNT(CFAlunno) AS quanti, AnnoScolastico
																		FROM storicoiscrizioni 
																		group by storicoiscrizioni.AnnoScolastico, IDClasse) AS D)
GROUP BY AnnoScolastico, IDClasse