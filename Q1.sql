EXPLAIN ANALYZE
SELECT id, client_id, date_commande, montant_total
FROM commandes
WHERE YEAR(date_commande) = 2026
  AND statut = 'LIVREE'
ORDER BY montant_total DESC
LIMIT 10

-- Problème 1 : on a un seq scan sur commandes c'est pas SARGable, la cause c'est la condition stricte du YEAR qui est pas une bonne pratique il faudrai un intervalle 

-- Problème 2 : le tri se fait sur un attribut qui n'a pas d'index, ça veut dire qu'il lit tout pour pouvoir trier et donc sur bcp de lignes ça prends du temps,
-- la on trie 30 lignes alors qu'on en veut 10 car il doit scrap sur les 39 lignes les montant les plus élevés alors qu'avec un index en DESC sur les montants on aurai juste parcouru les 10