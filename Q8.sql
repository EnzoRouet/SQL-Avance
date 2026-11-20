-- Sous READ COMMITTED chaque lecture voit la dernière version validée des données, c'est auto actualisé
-- Si la transaction A lit le solde d’un compte comme 68K puis que la transaction B retire 1000 et valide
-- quand A relit le même compte dans la même transaction elle trouve 67K 

-- Sous REPEATABLE READ la transaction A travaille sur des données de bases pris au tout début
-- Même si B modifie et valide entre-temps, A relit 68K à chaque fois
-- Elle verra le changement après avoir terminé, dans une nouvelle transaction

-- Le WAL est un journal où le moteur note chaque modification avant de toucher aux données et il confirme le commit qu’une fois cette note écrite sur disque
-- Si le serveur coupe en plein virement avant le commit tout est annulé au redémarrage donc aucun argent n’est perdu 
-- Cela permet d'eviter une action incomplète comme un débit d'un compte sans créditation de l'autre
-- Si la coupure arrive après le commit le moteur relit le journal et retrouve les modifications validé