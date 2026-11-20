-- Création de notre vue 
CREATE MATERIALIZED VIEW mv_synthese_segments AS
SELECT cl.segment,
       COUNT(co.id)                    AS nb_commandes,
       ROUND(SUM(co.montant_total), 2) AS ca_total
FROM commandes co
JOIN clients cl ON cl.id = co.client_id
GROUP BY cl.segment;

-- On vérifie ca fonctionne bien
SELECT * FROM mv_synthese_segments;

-- On update
INSERT INTO commandes (client_id, date_commande, statut, canal, montant_total)
VALUES (2, '2026-11-19', 'LIVREE', 'WEB', 1000.00);

-- ON essaie de récupérer et on voit qu'on a une vision obsolète
SELECT * FROM mv_synthese_segments;

-- On refresh du coup
REFRESH MATERIALIZED VIEW mv_synthese_segments;

SELECT * FROM mv_synthese_segments;