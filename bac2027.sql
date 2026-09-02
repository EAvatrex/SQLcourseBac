-- 1)Creation d'une base de données
create database bd12345;

-- 2)CREATION DES TABLES

create table prop(
    idprop int(8) PRIMARY KEY auto_increment,
    nomprop varchar(15) default "vide",
    telprop int(8) not null unique,
    CONSTRAINT dom1 CHECK(telprop > 0)  
);
-- contrainte de domaine : check


CREATE TABLE cheval (
idCheval int(8) PRIMARY KEY AUTO_INCREMENT,
nomCheval varchar(30) not null ,
idProp int(8) not null,
CONSTRAINT ce FOREIGN KEY(idprop) REFERENCES prop (idprop)


);

--FOREIGN KEY (idProp) REFERENCES  prop(idProp)


CREATE TABLE Resultat (
idCourse int(8) not null ,
idCheval int(8) not null ,
rang int(2) CHECK(rang>0),
temps TIME ,

CONSTRAINT cle_composee PRIMARY KEY(idCourse,idCheval),
CONSTRAINT cle_etrangere2 FOREIGN KEY (idCourse) REFERENCES  course(idCourse),
CONSTRAINT cle_etrangere3 FOREIGN KEY (idCheval) REFERENCES  cheval(idCheval)


);


-- 3)ajout d'une colone

-- la majorité des requetes concernant la manipulation d'une colone 
-- on utilise ALTER TABLE
-- IN ==> appartient a la liste
ALTER TABLE prop ADD COLUMN gender char(1) CHECK (gender IN ('F','M'));
ALTER table prop ADD column email varchar(30) unique ;

-- 4) renommer une colone

ALTER TABLE prop RENAME gender to genderProp;
ALTER table prop RENAME email to emailProp;


-- 5)modifier la table (type,auto_increment,unique,not null ..)
--MODIFY

ALTER table prop MODIFY email varchar(20) not null unique;

--nb: email deja existe

-- 6)ajout d'un contrainte
-- (exemple cle primaire composé)
ALTER table prop ADD CONSTRAINT pk1 PRIMARY KEY (col1,col2);

-- 7)suppression d'une contrainte

ALTER table prop DROP CONSTRAINT pk1;
ALTER table prop DROP CONSTRAINT ce1;

-- 8)suppression d'une colone

ALTER table prop DROP column email;
ALTER table prop DROP column gander;

-- 9)suppression d'une table

DROP TABLE prop;

-- 10) suppression d'une base de données
DROP DATABASE bd12345;

-- 11)insertion de données
insert into prop (nomProp,telprop)
VALUES("saied",11223344);

insert into prop (idProp,nomProp,telprop)
VALUES(null,"ahmed",22559900);

insert into prop
VALUES(null,"haykel",99223366,'M');

