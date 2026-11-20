-- Tables restantes après qu'on soit passer en 3FN avec attributs

departements (departement_id PK, nom UNIQUE)
employes     (employe_id PK, employe_nom, departement_id FK → departements)
chefs_projet (chef_id PK, nom, tel)
projets      (projet_id PK, projet_nom, chef_id FK → chefs_projet)
affectations (employe_id FK → employes, projet_id FK → projets, PRIMARY KEY (employe_id, projet_id))

-- Dépendances fonctionnelles entre les tables :

departement_id → nom
employe_id → employe_nom, departement_id
chef_id → nom, tel
projet_id → projet_nom, chef_id
affectations : clé composite (employe_id, projet_id)

-- On a retiré : la colonne projets_liste (plusieurs valeurs dans une cellule) a été déouper en une ligne par une liaison employé-projet pour la 1FN
-- Les dépendances (employe_id → employe_nom, dept_nom) ont été retiré de leurs tables pour la 2FN
-- On a supprimer la dépendance projet → chef_projet → chef_projet_tel en isolant chefs_projet (et departements) pour la 3FN