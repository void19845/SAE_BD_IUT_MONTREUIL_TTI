
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
