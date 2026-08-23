SELECT [DISTINCT] 
    column1, column2, ... <liste de colonnes>
FROM table_name <liste de tables>
[WHERE condition] <jointure et le filtre de recherche>
[GROUP BY column1, column2, ...] <grouper les elements selons les colonnes choisie>
[HAVING condition] <filtre de groupe>
[ORDER BY column1 [ASC|DESC], column2 [ASC|DESC], ...] <trie de resultat>




-- [optionelle]
-- *:tous
-- [DISTINCT]:afficher d'une maniere unique(sans repetition)
-- as : alias






SELECT idBij,count(idBij) as "nombre de fois" FROM `evaluation` GROUP BY idBij;

SELECT idBij,count(idBij) as "nombre de fois" FROM `evaluation` GROUP BY idBij HAVING count(idBij)>1;


SELECT idBij,count(idBij) as "nombre de fois"
FROM `evaluation`
GROUP BY idBij
ORDER BY idBij DESC;


============================



1)SELECT idMis , dateMis , dateRet
FROM mission
WHERE idNav = "001"


-- datediff retourne la difference entre deux dates
--(e.g., day, month, year) | default = day
2)SELECT idMis , dateMis , dateRet , DATEDIFF(day,datePre,dateRet)
FROM mission DATEDIFF(datePre,dateRet)>0




3)SELECT nomSat , poids
FROM satellites as s , operateur as o 
WHERE s.idOp = o.idOp AND libOp = "Nilesat"
ORDER BY poids asc;

3)SELECT nomSat , poids
FROM satellites as s , operateur as o 
WHERE s.idOp = o.idOp AND libOp = "Nilesat"
ORDER BY poids ; -- l'ordre est croissante par defaut

3)SELECT nomSat , poids
FROM satellites as s , operateur as o 
WHERE s.idOp = o.idOp AND libOp = "Nilesat"
ORDER BY 2 ; -- on peut specifier la colonnes (critere de trie) selon l'ordre dans la select
-- 2 == poids

--s.idOp = o.idOp : (jointure) utiliser pour liée les tables entre eux


4)
SELECT idInt,description,dateInt
FROM intervention
WHERE idInt LIKE "M%"



-- idInt LIKE "%M" : se termine par M
-- idInt LIKE "M%" : commence par M
-- idInt LIKE "%M%" : contient M
-- idInt LIKE "_M%" : deuxieme caractere est M

-- [ _ : remplace une caractere]



5)
SELECT DISTINCT p.idAst , nomAst
FROM intervention as i , participation as p , Astronaute as a 
WHERE i.idInt = p.idInt AND a.idAst = p.idAst AND idSat = 103

-- Dans cette exemple on a 2 idAst , pour la select il faut choisir un seul
-- pour eviter l'ambiguité 


6)
SELECT *
FROM Astronaute 
WHERE specialite = "medcine" AND idAst NOT IN (SELECT idAst from Participation);



7)
SELECT m.idNav , nomNav, count(m.idNav) as "nombre des missions"
FROM navette n , Mission m
WHERE n.idNav = m.idNav
GROUP BY m.idNav
HAVING count(m.idNav) >= 2;

8)

SELECT idSat,nomSat,poids,libOp
FROM satellite as s , operateur as o
WHERE s.idOp = o.idOp AND poids = (
    SELECT max(poids) from operateur
)


-- eviter d'utiliser les fonctions d'agregation au niveau de WHERE




=====================

