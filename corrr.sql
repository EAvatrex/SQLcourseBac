-- =====================================================
-- 1. INSERT INTERVENTION
-- =====================================================

-- Version 1 : avec toutes les colonnes
INSERT INTO intervention
VALUES (
    "INT0000017",
    "2025-06-01 14:00",
    NULL,
    8.000,
    "TI4",
    "INC0000010"
);

-- Version 2 : avec les colonnes précisées
INSERT INTO intervention
    (codeInt, dateHeureDebInt, superficieInt, codeTypeInt, codeInc)
VALUES (
    "INT0000017",
    "2025-06-01 14:00",
    8.000,
    "TI4",
    "INC0000010"
);


-- =====================================================
-- 2. FORETS DU GOUVERNORAT DE JENDOUBA
-- =====================================================

SELECT f.nomForet, f.superficieForet
FROM Gouvernorat AS g, Ville AS v, Foret AS f
WHERE g.codeGouv = v.codeGouv
  AND v.codeVille = f.codeVille
  AND g.nomGouv = "Jendouba";


-- =====================================================
-- 3. NOMBRE D'INCENDIES PAR FORET EN 2024
-- =====================================================

SELECT f.nomForet, COUNT(i.codeInc) AS nbIncendies
FROM Foret AS f, Incendie AS i
WHERE f.codeForet = i.codeForet
  AND YEAR(i.dateHeureInc) = 2024
GROUP BY f.codeForet, f.nomForet;


-- =====================================================
-- 4. ETE 2023
-- =====================================================

-- Version A : BETWEEN
SELECT v.nomVille, SUM(i.superficieBrulee) AS superficieTotale
FROM Ville AS v, Foret AS f, Incendie AS i
WHERE v.codeVille = f.codeVille
  AND i.codeForet = f.codeForet
  AND YEAR(i.dateHeureExt) = 2023
  AND MONTH(i.dateHeureExt) BETWEEN 6 AND 8
GROUP BY v.codeVille, v.nomVille;


-- Version B : IN
SELECT v.nomVille, SUM(i.superficieBrulee) AS superficieTotale
FROM Ville AS v, Foret AS f, Incendie AS i
WHERE v.codeVille = f.codeVille
  AND i.codeForet = f.codeForet
  AND YEAR(i.dateHeureExt) = 2023
  AND MONTH(i.dateHeureExt) IN (6, 7, 8)
GROUP BY v.codeVille, v.nomVille;


-- Version C : >= et <=
SELECT v.nomVille, SUM(i.superficieBrulee) AS superficieTotale
FROM Ville AS v, Foret AS f, Incendie AS i
WHERE v.codeVille = f.codeVille
  AND i.codeForet = f.codeForet
  AND YEAR(i.dateHeureExt) = 2023
  AND MONTH(i.dateHeureExt) >= 6
  AND MONTH(i.dateHeureExt) <= 8
GROUP BY v.codeVille, v.nomVille;


-- Version D : > et <
-- Même résultat, mais ici on utilise des inégalités strictes
-- avec 5 et 9 comme limites.
SELECT v.nomVille, SUM(i.superficieBrulee) AS superficieTotale
FROM Ville AS v, Foret AS f, Incendie AS i
WHERE v.codeVille = f.codeVille
  AND i.codeForet = f.codeForet
  AND YEAR(i.dateHeureExt) = 2023
  AND MONTH(i.dateHeureExt) > 5
  AND MONTH(i.dateHeureExt) < 9
GROUP BY v.codeVille, v.nomVille;


-- =====================================================
-- 5. INCENDIES AVEC INTERVENTION "AERIENNE"
-- =====================================================

SELECT DISTINCT i.codeInc, i.dateHeureInc
FROM Incendie AS i, TypeIntervention AS t, Intervention AS it
WHERE i.codeInc = it.codeInc
  AND t.codeTypeInt = it.codeTypeInt
  AND t.description = "Aérienne";


-- Version avec IN
SELECT DISTINCT i.codeInc, i.dateHeureInc
FROM Incendie AS i, TypeIntervention AS t, Intervention AS it
WHERE i.codeInc = it.codeInc
  AND t.codeTypeInt = it.codeTypeInt
  AND t.description IN ("Aérienne");


-- =====================================================
-- 6. INCENDIES AYANT AU MOINS 3 INTERVENTIONS
-- =====================================================

SELECT i.codeInc, f.nomForet, i.dateHeureInc
FROM Incendie AS i, Foret AS f, Intervention AS ie
WHERE i.codeInc = ie.codeInc
  AND f.codeForet = i.codeForet
GROUP BY i.codeInc, f.nomForet, i.dateHeureInc
HAVING COUNT(ie.codeInt) >= 3;




