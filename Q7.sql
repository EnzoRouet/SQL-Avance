-- Le piège c'est qu il y a une valeur null qui se promène dans les attributs 
-- La comparaison avec le not in sur la logique peut devenir UNKNOWN
-- Comme WHERE n'accepte que true alors ca plante renvoit rien

SELECT e.id, e.nom FROM employes e
WHERE NOT EXISTS (SELECT 1 FROM employes m WHERE m.manager_id = e.id)