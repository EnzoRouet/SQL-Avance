WITH RECURSIVE organigramme AS ( 
    SELECT id, nom, poste, departement, 1 AS niveau, nom AS chemin 
    FROM employes 
    WHERE manager_id IS NULL 
    UNION ALL 
    SELECT e.id, e.nom, e.poste, e.departement, o.niveau + 1 AS niveau, o.chemin || 
' > ' || e.nom AS chemin 
    FROM employes e 
    JOIN organigramme o ON e.manager_id = o.id 
) 

SELECT id, nom, poste, niveau, chemin 
FROM organigramme 
ORDER BY niveau ASC, id ASC;