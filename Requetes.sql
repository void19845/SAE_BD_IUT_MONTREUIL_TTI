
--creation vue dedié a l'utilisateur permettant de restreindre les informations de l'inventaire aux meubles
drop view if exists v1;
CREATE VIEW v1 as select xnom_meuble,largeur,hauteur,prix_meuble,libelle_materiau,libelle_type,marque 
FROM meuble INNER JOIN materiau on materiau_id=id_materiau INNER JOIN type_meuble on type_meuble_id=id_type; 

select * from v1;
--_____________________________________________________________________________

--creation d'une vue permettant un affichage simplifier de l'inventaire et affichant les nom des fournisseurs pour faciliter une meilleurs gestion pour vendeurs
drop view if exists v2;
CREATE VIEW v2 AS SELECT nom_meuble,prix_meuble, fournisseur, nom ,marque 
FROM meuble INNER JOIN utilisateur on fournisseur = id_utilisateur ;

SELECT * FROM v2
ORDER BY fournisseur asc;
--______________________________________________________________________________

drop view v3
CREATE VIEW V3 AS SELECT  
FROM 

--______________________________________________________________________________

-- Selection de tous les utilissateurs ayant une commande de prête

select nom from utilisateur where user_role ilike 'Client' and id_utilisateur in ( select id_commande
from commande where etat_id in (select id_etat from etat where libelle ilike 'validé'));

--______________________________________________________________________________



veut les utilisateur et leurs commande 
--select nom, id_utilisateur, id_commande, libelle from utilisateur left join commande on id_utilisateur = utilisateur_id  inner join etat on etat_id = id_etat where user_role ilike 'Client' order by id_utilisateur asc;
--A TERMINER

--______________________________________________________________________________
--permet davoir le prix total de chaque comande
select sum(prix),commande_id from magasin.ligne_commande group by commande_id order by commande_id asc


--Liste des clients avec leur nombre de commandes--

SELECT u.nom, COUNT(c.id_commande) AS nombre_commandes
FROM utilisateur u
LEFT JOIN commande c ON u.id_utilisateur = c.utilisateur_id
WHERE u.user_role = 'client'
GROUP BY u.nom
ORDER BY nombre_commandes DESC;


--Prix moyen des meubles par type--

SELECT t.libelle_type AS type_meuble, AVG(m.prix_meuble)
FROM meuble m
JOIN type_meuble t ON m.type_meuble_id = t.id_type
GROUP BY t.libelle_type
ORDER BY prix_moyen DESC;


--Permet de tenir les meubles les plus commandées--

select nom_meuble, id_meuble, count(meuble_id) 
from meuble inner join ligne_commande on id_meuble = meuble_id
group by nom_meuble, id_meuble
order by id_meuble asc;

--Somme total d'une commande--

select commande_id , SUM(prix) as Somme_total from meuble inner join ligne_commande on id_meuble = meuble_id
group by commande_id order by commande_id;

