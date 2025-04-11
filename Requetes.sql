
--creation vue dedié a l'utilisateur permettant de restreindre les informations de l'inventaire aux meubles
drop view if exists v1;
CREATE VIEW v1 as select nom_meuble,largeur,hauteur,prix_meuble,libelle_materiau,libelle_type,marque 
FROM meuble INNER JOIN materiau on materiau_id=id_materiau INNER JOIN type_meuble on type_meuble_id=id_type; 

select * from v1;
Réponse (50 tuples) :
"Chaise en bois"	50.00	90.00	120.00	"Bois"	"Chaise"	"Marque A"
"Table en verre"	150.00	75.00	300.00	"Verre"	"Table"	"Marque B"
"Armoire en métal"	200.00	180.00	450.00	"Métal"	"Armoire"	"Marque C"
"Canapé en cuir"	200.00	90.00	800.00	"Cuir"	"Canapé"	"Marque CA"
"Étagère en plastique"	100.00	150.00	150.00	"Plastique"	"Étagère"	"Marque CA"
"Chaise en métal"	50.00	90.00	130.00	"Métal"	"Chaise"	"Marque AC"
"Table en bois"	150.00	75.00	320.00	"Bois"	"Table"	"Marque AC"
"Armoire en bois"	200.00	180.00	470.00	"Bois"	"Armoire"	"Marque CA"
"Canapé en tissu"	200.00	90.00	750.00	"Plastique"	"Canapé"	"Marque CA"
"Étagère en métal"	100.00	150.00	160.00	"Métal"	"Étagère"	"Marque CA"
"Chaise en plastique"	50.00	90.00	110.00	"Plastique"	"Chaise"	"Marque AB"
"Table en métal"	150.00	75.00	310.00	"Métal"	"Table"	"Marque AB"
"Armoire en verre"	200.00	180.00	500.00	"Verre"	"Armoire"	"Marque BA"
"Canapé en cuir synthétique"	200.00	90.00	780.00	"Cuir"	"Canapé"	"Marque BA"
"Étagère en bois"	100.00	150.00	170.00	"Bois"	"Étagère"	"Marque BB"
"Chaise en cuir"	50.00	90.00	140.00	"Cuir"	"Chaise"	"Marque BB"
"Table en plastique"	150.00	75.00	290.00	"Plastique"	"Table"	"Marque A"
"Armoire en plastique"	200.00	180.00	460.00	"Plastique"	"Armoire"	"Marque B"
"Canapé en cuir véritable"	200.00	90.00	850.00	"Cuir"	"Canapé"	"Marque C"
"Étagère en verre"	100.00	150.00	180.00	"Verre"	"Étagère"	"Marque AC"
"Chaise en verre"	50.00	90.00	150.00	"Verre"	"Chaise"	"Marque AD"
"Table en cuir"	150.00	75.00	330.00	"Cuir"	"Table"	"Marque DA"
"Armoire en cuir"	200.00	180.00	480.00	"Cuir"	"Armoire"	"Marque AD"
"Canapé en bois"	200.00	90.00	770.00	"Bois"	"Canapé"	"Marque BA"
"Étagère en cuir"	100.00	150.00	190.00	"Cuir"	"Étagère"	"Marque AB"
"Chaise en métal et bois"	50.00	90.00	160.00	"Métal"	"Chaise"	"Marque BD"
"Table en verre et métal"	150.00	75.00	340.00	"Verre"	"Table"	"Marque DB"
"Armoire en bois et verre"	200.00	180.00	490.00	"Bois"	"Armoire"	"Marque CC"
"Canapé en cuir et métal"	200.00	90.00	860.00	"Cuir"	"Canapé"	"Marque DD"
"Étagère en plastique et métal"	100.00	150.00	200.00	"Plastique"	"Étagère"	"Marque AD"
"Chaise en bois et cuir"	50.00	90.00	170.00	"Bois"	"Chaise"	"Marque AA"
"Table en bois et verre"	150.00	75.00	350.00	"Bois"	"Table"	"Marque A"
"Armoire en métal et verre"	200.00	180.00	510.00	"Métal"	"Armoire"	"Marque B"
"Canapé en tissu et bois"	200.00	90.00	790.00	"Plastique"	"Canapé"	"Marque CA"
"Étagère en bois et verre"	100.00	150.00	210.00	"Bois"	"Étagère"	"Marque AC"
"Chaise en plastique et métal"	50.00	90.00	120.00	"Plastique"	"Chaise"	"Marque A"
"Table en métal et cuir"	150.00	75.00	360.00	"Métal"	"Table"	"Marque B"
"Armoire en plastique et verre"	200.00	180.00	520.00	"Plastique"	"Armoire"	"Marque BA"
"Canapé en cuir et verre"	200.00	90.00	870.00	"Cuir"	"Canapé"	"Marque A"
"Étagère en métal et cuir"	100.00	150.00	220.00	"Métal"	"Étagère"	"Marque C"
"Chaise en verre et cuir"	50.00	90.00	180.00	"Verre"	"Chaise"	"Marque A"
"Table en plastique et verre"	150.00	75.00	370.00	"Plastique"	"Table"	"Marque B"
"Armoire en bois et cuir"	200.00	180.00	530.00	"Bois"	"Armoire"	"Marque AB"
"Canapé en tissu et métal"	200.00	90.00	800.00	"Plastique"	"Canapé"	"Marque C"
"Étagère en verre et cuir"	100.00	150.00	230.00	"Verre"	"Étagère"	"Marque A"
"Chaise en métal et cuir"	50.00	90.00	190.00	"Métal"	"Chaise"	"Marque CA"
"Table en bois et cuir"	150.00	75.00	380.00	"Bois"	"Table"	"Marque AC"
"Armoire en verre et cuir"	200.00	180.00	540.00	"Verre"	"Armoire"	"Marque DA"
"Canapé en cuir et bois"	200.00	90.00	880.00	"Cuir"	"Canapé"	"Marque AD"
"Étagère en plastique et cuir"	100.00	150.00	240.00	"Plastique"	"Étagère"	"Marque DA"
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

