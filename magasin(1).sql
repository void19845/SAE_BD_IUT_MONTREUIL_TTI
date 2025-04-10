
DROP schema if exists magasin cascade;
CREATE SCHEMA magasin;
set search_path to magasin;

-- Table utilisateur
CREATE TABLE utilisateur (
    id_utilisateur SERIAL PRIMARY KEY,
    login VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    nom VARCHAR NOT NULL,
    pwd VARCHAR NOT NULL,
    user_role VARCHAR NOT NULL
);

-- Table etat
CREATE TABLE etat (
    id_etat SERIAL PRIMARY KEY ,
    libelle VARCHAR NOT NULL
);


-- Table materiau
CREATE TABLE materiau (
    id_materiau SERIAL PRIMARY KEY ,
    libelle_materiau VARCHAR(255) NOT NULL
);

-- Table type_meuble
CREATE TABLE type_meuble (
    id_type SERIAL PRIMARY KEY ,
    libelle_type VARCHAR(255) NOT NULL
);

-- Table meuble
CREATE TABLE meuble (
    id_meuble SERIAL PRIMARY KEY ,
    nom_meuble VARCHAR NOT NULL,
    largeur DECIMAL NOT NULL,
    hauteur DECIMAL NOT NULL,
    prix_meuble DECIMAL NOT NULL,
    materiau_id INT,
    type_meuble_id INT,
    fournisseur INT,
    marque VARCHAR,
    FOREIGN KEY (materiau_id) REFERENCES materiau(id_materiau),
    FOREIGN KEY (type_meuble_id) REFERENCES type_meuble(id_type)
	
);
-- Table commande
CREATE TABLE commande (
    id_commande SERIAL PRIMARY KEY ,
    date_achat DATE NOT NULL,
    utilisateur_id INT,
    etat_id INT,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id_utilisateur),
    FOREIGN KEY (etat_id) REFERENCES etat(id_etat)
);
-- Table ligne_panier
CREATE TABLE ligne_panier (
    utilisateur_id INT,
    meuble_id INT,
    quantite INT NOT NULL,
    date_ajout DATE NOT NULL,
    PRIMARY KEY (utilisateur_id, meuble_id),
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id_utilisateur),
    FOREIGN KEY (meuble_id) REFERENCES meuble(id_meuble)
);
-- Table ligne_commande
CREATE TABLE ligne_commande (
    commande_id INT,
    meuble_id INT,
    prix INT NOT NULL,
    quantite INT NOT NULL,
    PRIMARY KEY (commande_id, meuble_id),
    FOREIGN KEY (commande_id) REFERENCES commande(id_commande),
    FOREIGN KEY (meuble_id) REFERENCES meuble(id_meuble)
);
-- Insertion des données

-- Table utilisateur
INSERT INTO utilisateur (login, email, nom, pwd, user_role) VALUES
('arthur.dupont', 'arthur.dupont@gmail.com', 'Dupont', '123456', 'client'),
('emma.martin', 'emma.martin@google.com', 'Martin', 'azerty', 'client'),
('gabriel.leclerc', 'gabriel.leclerc@yahoo.com', 'Leclerc', 'doudou', 'fournisseur'),
('chloe.bernard', 'chloe.bernard@outlook.com', 'Bernard', 'azerty', 'client'),
('leo.bernard', 'leo.thomas@yahoo.com', 'Bernard', 'doudou', 'fournisseur'),
('lina.robert', 'lina.robert@gmail.com', 'Robert', '000000', 'client'),
('noah.richard', 'noah.richard@gmail.com', 'Richard', '000000', 'client'),
('jade.petit', 'jade.petit@yahoo.com', 'Petit', '000000', 'client'),
('lucas.durand', 'lucas.durand@outlook.com', 'Durand', 'doudou', 'client'),
('alice.moreau', 'alice.moreau@google.com', 'Moreau', 'doudou', 'fournisseur'),
('adam.simon', 'adam.simon@yahoo.com', 'Simon', '123456', 'client'),
('louise.leroy', 'louise.leroy@gmail.com', 'Leroy', 'doudou', 'fournisseur'),
('raphael.roussel', 'raphael.roussel@yahoo.com', 'Roussel', '000000', 'client'),
('manon.david', 'manon.david@google.com', 'David', '123456', 'client'),
('hugo.guillaume', 'hugo.guillaume@gmail.com', 'Guillaume', '000000', 'client'),
('ines.lambert', 'ines.lambert@gmail.com', 'Lambert', 'azerty', 'client'),
('paul.vincent', 'paul.vincent@gmail.com', 'Vincent', '123456', 'fournisseur'),
('lea.michel', 'lea.michel@outlook.com', 'Michel', '000000', 'client'),
('mathis.perrin', 'mathis.perrin@hotmail.com', 'Perrin', '000000', 'client'),
('zoe.fontaine', 'zoe.fontaine@outlook.com', 'Fontaine', '123456', 'client'),
('nathan.renault', 'nathan.arnould@gmail.com', 'Renault', 'doudou', 'client'),
('camille.renault', 'camille.renault@google.com', 'Renault', '123456', 'client'),
('tom.chevallier', 'tom.chevallier@hotmail.com', 'Chevallier', 'doudou', 'fournisseur'),
('sarah.dumas', 'sarah.dumas@google.com', 'Dumas', 'doudou', 'client'),
('enzo.dumas', 'enzo.morel@yahoo.com', 'Dumas', '000000', 'client'),
('charlotte.girard', 'charlotte.girard@google.com', 'Girard', '000000', 'admin'),
('timothee.lacroix', 'timothee.lacroix@gmail.com', 'Lacroix', '000000', 'client'),
('lena.gauthier', 'lena.gauthier@yahoo.com', 'Gauthier', 'azerty', 'client'),
('alexandre.faure', 'alexandre.faure@gmail.com', 'Faure', '000000', 'client'),
('clarisse.garcia', 'clarisse.garcia@google.com', 'Garcia', 'marseille', 'client'),
('maxime.marty', 'maxime.marty@hotmail.com', 'Marty', '123456', 'client'),
('juliette.griezmann', 'juliette.blanc@gmail.com', 'Griezmann', 'marseille', 'client'),
('antoine.griezmann', 'antoine.guerin@gmail.com', 'Griezmann', 'azerty', 'fournisseur'),
('romane.muller', 'romane.muller@outlook.com', 'Muller', 'marseille', 'client'),
('victor.brunet', 'victor.brunet@hotmail.com', 'Brunet', '123456', 'admin'),
('eleonore.olivier', 'eleonore.lopez@gmail.com', 'Olivier', 'azerty', 'client'),
('quentin.olivier', 'quentin.olivier@gmail.com', 'Olivier', 'marseille', 'client'),
('lilou.noel', 'lilou.noel@outlook.com', 'Noel', '000000', 'client'),
('baptiste.meyer', 'baptiste.meyer@gmail.com', 'Meyer', 'azerty', 'client'),
('agathe.dupuy', 'agathe.dupuy@hotmail.com', 'Dupuy', 'marseille', 'client'),
('corentin.moreau', 'corentin.moreau@outlook.com', 'Moreau', 'marseille', 'client'),
('ambre.fournier', 'ambre.fournier@gmail.com', 'Fournier', 'azerty', 'fournisseur'),
('valentin.andre', 'valentin.andre@hotmail.com', 'Andre', 'marseille', 'client'),
('celia.lecomte', 'celia.lecomte@outlook.com', 'Lecomte', '123456', 'admin'),
('simon.barbier', 'simon.mercier@outlook.com', 'Barbier', 'azerty', 'client'),
('clara.barbier', 'clara.barbier@yahoo.com', 'Barbier', '123456', 'fournisseur'),
('julien.renard', 'julien.renard@yahoo.com', 'Renard', 'marseille', 'admin'),
('julia.rousseau', 'julia.clement@yahoo.com', 'Rousseau', '123456', 'client'),
('alexis.rousseau', 'alexis.rousseau@gmail.com', 'Rousseau', 'azerty', 'client'),
('margo.schneider', 'margo.schneider@hotmail.com', 'Schneider', 'azerty', 'fournisseur');

-- Table etat
INSERT INTO etat (libelle) VALUES
('en attente'),
('expédié'),
('validé'),
('confirmé');

-- Table materiau
INSERT INTO materiau (libelle_materiau) VALUES
('Bois'),
('Métal'),
('Verre'),
('Plastique'),
('Cuir');

-- Table type_meuble
INSERT INTO type_meuble (libelle_type) VALUES
('Chaise'),
('Table'),
('Armoire'),
('Canapé'),
('Étagère');

-- Table meuble
INSERT INTO meuble (nom_meuble, largeur, hauteur, prix_meuble, materiau_id, type_meuble_id, fournisseur, marque) VALUES
('Chaise en bois', 50.00, 90.00, 120.00, 1, 1, 3, 'Marque A'),
('Table en verre', 150.00, 75.00, 300.00, 3, 2, 5, 'Marque B'),
('Armoire en métal', 200.00, 180.00, 450.00, 2, 3, 10, 'Marque C'),
('Canapé en cuir', 200.00, 90.00, 800.00, 5, 4, 12, 'Marque CA'),
('Étagère en plastique', 100.00, 150.00, 150.00, 4, 5, 17, 'Marque CA'),
('Chaise en métal', 50.00, 90.00, 130.00, 2, 1, 23, 'Marque AC'),
('Table en bois', 150.00, 75.00, 320.00, 1, 2, 33, 'Marque AC'),
('Armoire en bois', 200.00, 180.00, 470.00, 1, 3, 42, 'Marque CA'),
('Canapé en tissu', 200.00, 90.00, 750.00, 4, 4, 46, 'Marque CA'),
('Étagère en métal', 100.00, 150.00, 160.00, 2, 5, 50, 'Marque CA'),
('Chaise en plastique', 50.00, 90.00, 110.00, 4, 1,50, 'Marque AB'),
('Table en métal', 150.00, 75.00, 310.00, 2, 2, 5, 'Marque AB'),
('Armoire en verre', 200.00, 180.00, 500.00, 3, 3, 5, 'Marque BA'),
('Canapé en cuir synthétique', 200.00, 90.00, 780.00, 5, 4, 3, 'Marque BA'),
('Étagère en bois', 100.00, 150.00, 170.00, 1, 5, 3, 'Marque BB'),
('Chaise en cuir', 50.00, 90.00, 140.00, 5, 1, 5, 'Marque BB'),
('Table en plastique', 150.00, 75.00, 290.00, 4, 2, 23, 'Marque A'),
('Armoire en plastique', 200.00, 180.00, 460.00, 4, 3, 23, 'Marque B'),
('Canapé en cuir véritable', 200.00, 90.00, 850.00, 5, 4, 23, 'Marque C'),
('Étagère en verre', 100.00, 150.00, 180.00, 3, 5, 50, 'Marque AC'),
('Chaise en verre', 50.00, 90.00, 150.00, 3, 1, 50, 'Marque AD'),
('Table en cuir', 150.00, 75.00, 330.00, 5, 2, 5, 'Marque DA'),
('Armoire en cuir', 200.00, 180.00, 480.00, 5, 3, 5, 'Marque AD'),
('Canapé en bois', 200.00, 90.00, 770.00, 1, 4, 3, 'Marque BA'),
('Étagère en cuir', 100.00, 150.00, 190.00, 5, 5, 5, 'Marque AB'),
('Chaise en métal et bois', 50.00, 90.00, 160.00, 2, 1, 50, 'Marque BD'),
('Table en verre et métal', 150.00, 75.00, 340.00, 3, 2, 3, 'Marque DB'),
('Armoire en bois et verre', 200.00, 180.00, 490.00, 1, 3, 3, 'Marque CC'),
('Canapé en cuir et métal', 200.00, 90.00, 860.00, 5, 4, 3, 'Marque DD'),
('Étagère en plastique et métal', 100.00, 150.00, 200.00, 4, 5, 23, 'Marque AD'),
('Chaise en bois et cuir', 50.00, 90.00, 170.00, 1, 1, 10, 'Marque AA'),
('Table en bois et verre', 150.00, 75.00, 350.00, 1, 2, 50, 'Marque A'),
('Armoire en métal et verre', 200.00, 180.00, 510.00, 2, 3, 10, 'Marque B'),
('Canapé en tissu et bois', 200.00, 90.00, 790.00, 4, 4, 10, 'Marque CA'),
('Étagère en bois et verre', 100.00, 150.00, 210.00, 1, 5, 17, 'Marque AC'),
('Chaise en plastique et métal', 50.00, 90.00, 120.00, 4, 1, 23, 'Marque A'),
('Table en métal et cuir', 150.00, 75.00, 360.00, 2, 2, 10, 'Marque B'),
('Armoire en plastique et verre', 200.00, 180.00, 520.00, 4, 3, 33, 'Marque BA'),
('Canapé en cuir et verre', 200.00, 90.00, 870.00, 5, 4, 17, 'Marque A'),
('Étagère en métal et cuir', 100.00, 150.00, 220.00, 2, 5, 5, 'Marque C'),
('Chaise en verre et cuir', 50.00, 90.00, 180.00, 3, 1, 10, 'Marque A'),
('Table en plastique et verre', 150.00, 75.00, 370.00, 4, 2, 17, 'Marque B'),
('Armoire en bois et cuir', 200.00, 180.00, 530.00, 1, 3, 10, 'Marque AB'),
('Canapé en tissu et métal', 200.00, 90.00, 800.00, 4, 4, 5, 'Marque C'),
('Étagère en verre et cuir', 100.00, 150.00, 230.00, 3, 5, 33, 'Marque A'),
('Chaise en métal et cuir', 50.00, 90.00, 190.00, 2, 1, 42, 'Marque CA'),
('Table en bois et cuir', 150.00, 75.00, 380.00, 1, 2, 17, 'Marque AC'),
('Armoire en verre et cuir', 200.00, 180.00, 540.00, 3, 3, 42, 'Marque DA'),
('Canapé en cuir et bois', 200.00, 90.00, 880.00, 5, 4, 17, 'Marque AD'),
('Étagère en plastique et cuir', 100.00, 150.00, 240.00, 4, 5, 17, 'Marque DA');

INSERT INTO commande (date_achat, utilisateur_id, etat_id) VALUES
('2005-07-12', 12, 1),
('2013-03-25', 22, 2),
('2011-06-18', 8, 3),
('2007-11-30', 35, 4),
('2016-01-05', 14, 1),
('2009-09-22', 27, 2),
('2003-05-14', 6, 3),
('2015-08-10', 19, 3),
('2008-02-17', 33, 1),
('2017-12-29', 2, 2),
('2014-10-03', 40, 3),
('2006-04-09', 11, 4),
('2012-07-21', 7, 1),
('2001-05-26', 25, 2),
('2010-09-15', 39, 3),
('2004-03-11', 5, 3),
('2017-06-23', 18, 1),
('2000-01-01', 31, 2),
('2013-11-05', 10, 3),
('2002-08-30', 29, 4),
('2016-12-13', 3, 1),
('2005-02-28', 37, 2),
('2011-04-19', 9, 3),
('2009-07-07', 20, 3),
('2008-10-16', 23, 1),
('2010-05-04', 15, 2),
('2007-09-27', 26, 3),
('2006-01-08', 30, 4),
('2015-03-14', 4, 1),
('2014-11-29', 1, 2),
('2013-06-06', 36, 3),
('2012-09-18', 16, 3),
('2001-07-25', 28, 1),
('2003-02-12', 21, 2),
('2004-05-09', 38, 3),
('2002-12-31', 13, 4),
('2006-08-21', 34, 1),
('2009-11-02', 24, 2),
('2007-04-14', 32, 3),
('2011-01-19', 17, 3),
('2010-10-07', 12, 1),
('2015-07-20', 40, 2),
('2005-06-08', 8, 3),
('2014-04-30', 11, 4),
('2016-09-05', 22, 1),
('2017-02-18', 19, 2),
('2003-12-22', 5, 3),
('2008-06-17', 27, 3),
('2012-01-14', 33, 1),
('2013-08-09', 6, 2),
('2000-09-28', 31, 3),
('2017-05-11', 14, 4),
('2001-10-02', 35, 1),
('2010-03-23', 10, 2),
('2004-07-15', 28, 3),
('2015-11-08', 9, 3),
('2016-02-07', 26, 1),
('2009-05-19', 20, 2),
('2007-12-05', 3, 3),
('2012-06-10', 39, 4);

INSERT INTO ligne_commande (commande_id, meuble_id, prix, quantite) VALUES
    (1, 3, 450, 2),
    (1, 19, 200, 1),
    (1, 14, 780, 3),
    (2, 5, 150, 1),
    (2, 1, 120, 2),
    (3, 12, 310, 1),
    (3, 7, 320, 4),
    (4, 8, 300, 2),
    (4, 2, 300, 5),
    (5, 11, 110, 1),
    (5, 6, 130, 2),
    (6, 25, 170, 3),
    (6, 4, 800, 1),
    (7, 15, 170, 2),
    (7, 16, 140, 4),
    (8, 9, 270, 1),
    (8, 14, 780, 3),
    (9, 2, 300, 2),
    (9, 5, 150, 1),
    (10, 26, 210, 3),
    (10, 7, 320, 2),
    (11, 1, 120, 1),
    (11, 10, 160, 2),
    (12, 3, 400, 4),
    (12, 6, 130, 1),
    (13, 8, 470, 3),
    (13, 49, 240, 2),
    (14, 12, 310, 1),
    (14, 4, 800, 2),
    (15, 15, 125, 3),
    (15, 9, 195, 1),
    (16, 16, 140, 5),
    (16, 2, 300, 2),
    (17, 10, 160, 1),
    (17, 1, 120, 3),
    (18, 6, 130, 2),
    (18, 3, 205, 1),
    (19, 14, 780, 4),
    (19, 5, 150, 2),
    (20, 1, 120, 1),
    (20, 13, 225, 3),
    (21, 7, 320, 2),
    (21, 12, 310, 1),
    (22, 16, 140, 6),
    (22, 9, 320, 1),
    (23, 11, 110, 2),
    (23, 4, 800, 3),
    (24, 15, 170, 1),
    (24, 6, 130, 4),
    (25, 1, 120, 2);

    
INSERT INTO ligne_panier (utilisateur_id, meuble_id, quantite, date_ajout) VALUES
(1, 5, 2, '2023-01-15'),
(1, 12, 1, '2023-01-16'),
(2, 3, 1, '2023-02-10'),
(2, 7, 3, '2023-02-11'),
(2, 15, 1, '2023-02-12'),
(3, 8, 2, '2023-03-05'),
(3, 20, 1, '2023-03-06'),
(4, 1, 1, '2023-04-18'),
(4, 6, 2, '2023-04-19'),
(4, 14, 1, '2023-04-20'),
(5, 9, 1, '2023-05-22'),
(5, 11, 1, '2023-05-23'),
(6, 4, 3, '2023-06-07'),
(6, 16, 1, '2023-06-08'),
(7, 2, 1, '2023-07-14'),
(7, 10, 2, '2023-07-15'),
(7, 18, 1, '2023-07-16'),
(8, 13, 1, '2023-08-25'),
(8, 19, 1, '2023-08-26'),
(9, 5, 1, '2023-09-09'),
(9, 17, 2, '2023-09-10'),
(10, 7, 1, '2023-10-12'),
(10, 12, 1, '2023-10-13'),
(11, 3, 2, '2023-11-17'),
(11, 8, 1, '2023-11-18'),
(12, 1, 1, '2023-12-01'),
(12, 6, 1, '2023-12-02'),
(12, 15, 1, '2023-12-03'),
(13, 4, 1, '2024-01-14'),
(13, 9, 2, '2024-01-15'),
(14, 2, 1, '2024-02-20'),
(14, 10, 1, '2024-02-21'),
(14, 20, 1, '2024-02-22'),
(15, 5, 3, '2024-03-05'),
(15, 14, 1, '2024-03-06'),
(16, 7, 1, '2024-04-10'),
(16, 11, 1, '2024-04-11'),
(17, 8, 2, '2024-05-15'),
(17, 13, 1, '2024-05-16'),
(18, 3, 1, '2024-06-18'),
(18, 16, 1, '2024-06-19'),
(19, 1, 1, '2024-07-22'),
(19, 12, 2, '2024-07-23'),
(20, 4, 1, '2024-08-30'),
(20, 9, 1, '2024-08-31'),
(21, 6, 1, '2024-09-12'),
(21, 17, 1, '2024-09-13'),
(22, 5, 2, '2024-10-15'),
(22, 18, 1, '2024-10-16'),
(23, 7, 1, '2024-11-20'),
(23, 14, 1, '2024-11-21');

