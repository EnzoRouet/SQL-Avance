-- On crée l'index
CREATE INDEX idx_cmd_statut_date
ON commandes (statut, date_commande)
INCLUDE (client_id, montant_total)

-- Requête optimisé mieux que l'ancienne 
EXPLAIN ANALYZE
SELECT id, client_id, date_commande, montant_total
FROM commandes_part
WHERE date_commande >= '2026-01-01'
  AND date_commande <  '2027-01-01'
  AND statut = 'LIVREE'
ORDER BY montant_total DESC
LIMIT 10;

-- Avant on avait un cout de 74.16 avec la requête qui n'était pas au bon format 
-- La on a une requête qui a un cout de 14.73

-- L'effet du partition prunning fait qu'on peut filtrer la lecture des données avec la date
-- donc on ne lit plus que 1/3 des données car partionner en 3 par date