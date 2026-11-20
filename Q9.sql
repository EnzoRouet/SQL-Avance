-- Pour la A on doit avoir une base de donnée ou on peut bcp écrire donc je partirai sur Cassandra
-- On doit avoir besoin de disponibilité et de vitesse plutot qu'un timing parfait ca répond a PA/EL

-- Pour la B on ne doit pas avoir d'erreur donc on doit appliquer le principe ACID pour ca on prends PostgreSQL ac répond a PC/EC

-- Pour la C on veut représenter des liens pour représenter des liens on utilise généralement des graphes donc on prend une base de graphe comme Neo4j