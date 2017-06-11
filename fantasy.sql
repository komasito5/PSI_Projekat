
CREATE TABLE ekipa
(
	IdEkipa              INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Naziv                VARCHAR(50) NULL
) AUTO_INCREMENT = 1;

CREATE TABLE igrac
(
	IdIgrac              INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Ime                  VARCHAR(20) NULL,
	Prezime              VARCHAR(20) NULL,
	DatumRodjenja        DATE NULL,
	Pozicija             CHAR(2) NULL,
	Nacionalnost         VARCHAR(50) NULL,
	IdEkipa              INTEGER NULL
) AUTO_INCREMENT = 1;

CREATE TABLE korisnik
(
	IdKorisnik           INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	KorisnickoIme        VARCHAR(50) NULL,
	Ime                  VARCHAR(50) NULL,
	Prezime              VARCHAR(50) NULL,
	Email                VARCHAR(50) NULL,
	Sifra                VARCHAR(50) NULL,
	Poeni                INTEGER NULL CHECK ( Poeni >= 0 ),
	BrojTokena           CHAR(18) NULL CHECK ( BrojTokena >= 0 )
) AUTO_INCREMENT = 1;


CREATE UNIQUE INDEX XAK1korisnik ON korisnik
(
	KorisnickoIme ASC
);

CREATE TABLE tim
(
	IdKorisnik           INTEGER NOT NULL,
	Naziv                VARCHAR(50) NULL
);

ALTER TABLE tim
ADD PRIMARY KEY (IdKorisnik);

CREATE TABLE timigrac
(
	IdIgrac              INTEGER NOT NULL,
	IdKorisnik           INTEGER NOT NULL,
	JeRezerva            INTEGER NULL CHECK ( JeRezerva BETWEEN 1 AND 12 )
);

ALTER TABLE timigrac
ADD PRIMARY KEY (IdIgrac,IdKorisnik);

CREATE TABLE ucinakigrac
(
	IdIgrac              INTEGER NOT NULL,
	IdKolo               INTEGER NOT NULL CHECK ( IdKolo >= 0 ),
	Poeni                INTEGER NULL CHECK ( Poeni >= 0 ),
	Asistencije          INTEGER NULL CHECK ( Asistencije >= 0 ),
	Skokovi              INTEGER NULL CHECK ( Skokovi >= 0 ),
	Faulovi              INTEGER NULL CHECK ( Faulovi BETWEEN 0 AND 5 )
);

ALTER TABLE ucinakigrac
ADD PRIMARY KEY (IdIgrac,IdKolo);

ALTER TABLE igrac
ADD FOREIGN KEY R_1 (IdEkipa) REFERENCES ekipa (IdEkipa);

ALTER TABLE tim
ADD FOREIGN KEY R_2 (IdKorisnik) REFERENCES korisnik (IdKorisnik);

ALTER TABLE timigrac
ADD FOREIGN KEY R_3 (IdIgrac) REFERENCES igrac (IdIgrac);

ALTER TABLE timigrac
ADD FOREIGN KEY R_4 (IdKorisnik) REFERENCES tim (IdKorisnik);

ALTER TABLE ucinakigrac
ADD FOREIGN KEY R_5 (IdIgrac) REFERENCES igrac (IdIgrac);
