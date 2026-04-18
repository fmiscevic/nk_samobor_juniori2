CREATE DATABASE IF NOT EXISTS nk_samobor_juniori2
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE nk_samobor_juniori2;

CREATE TABLE igraci (
    id_igraca INT AUTO_INCREMENT PRIMARY KEY,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    godiste YEAR NOT NULL,
    broj_dresa INT,
    primarna_pozicija VARCHAR(50) NOT NULL,
    alternativna_pozicija VARCHAR(50) NULL,
    status_u_klubu VARCHAR(30) NOT NULL DEFAULT 'aktivan',
    golovi INT NOT NULL DEFAULT 0,
    zuti_kartoni INT NOT NULL DEFAULT 0,
    crveni_kartoni INT NOT NULL DEFAULT 0,
    broj_nastupa INT NOT NULL DEFAULT 0,
    broj_minuta INT NOT NULL DEFAULT 0,
    zapoceo_utakmicu INT NOT NULL DEFAULT 0,
    usao_s_klupe INT NOT NULL DEFAULT 0
);

CREATE TABLE osoblje (
    id_osoblja INT AUTO_INCREMENT PRIMARY KEY,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    uloga VARCHAR(100) NOT NULL,
    status_u_klubu VARCHAR(50) NOT NULL
);

CREATE TABLE utakmice (
    id_utakmice INT AUTO_INCREMENT PRIMARY KEY,
    datum_vrijeme DATETIME NOT NULL,
    protivnik VARCHAR(100) NOT NULL,
    lokacija VARCHAR(150) NOT NULL,
    domacin_gost ENUM('Domaćin', 'Gost') NOT NULL,
    kolo INT NOT NULL,
    natjecanje VARCHAR(100) NOT NULL DEFAULT 'PRVA NL CENTAR JUNIORI 25/26',
    golovi_samobor INT NULL,
    golovi_protivnik INT NULL
);

CREATE TABLE treninzi (
    id_treninga INT AUTO_INCREMENT PRIMARY KEY,
    datum DATE NOT NULL,
    vrsta_treninga VARCHAR(50) NOT NULL,
    trajanje_min INT NOT NULL,
    lokacija VARCHAR(100) NOT NULL
);

CREATE TABLE prisustvo (
    id_prisustva INT AUTO_INCREMENT PRIMARY KEY,
    id_treninga INT NOT NULL,
    id_igraca INT NOT NULL,
    status ENUM('prisutan', 'izostao', 'opravdano', 'ozlijeden') NOT NULL,
    CONSTRAINT fk_prisustvo_trening
        FOREIGN KEY (id_treninga) REFERENCES treninzi(id_treninga)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_prisustvo_igrac
        FOREIGN KEY (id_igraca) REFERENCES igraci(id_igraca)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);