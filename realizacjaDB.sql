DROP DATABASE rekinki;
CREATE DATABASE rekinki; 
USE rekinki;

CREATE TABLE siedliska (
  id INT PRIMARY KEY AUTO_INCREMENT, #klucz główny
  typ_siedliska VARCHAR(255), #limit znaków (standardowy)
  lokalizacja VARCHAR(255),
  głębokość_maksymalna FLOAT, #zmienna przecinkowa
  średnia_temperatura FLOAT
);

CREATE TABLE diety (
  id INT PRIMARY KEY AUTO_INCREMENT,
  opis TEXT,
  rodzaje_pożywienia VARCHAR(255)
);

CREATE TABLE zagrożenia (
  id INT PRIMARY KEY AUTO_INCREMENT,
  opis_zagrożenia TEXT,
  źródło VARCHAR(255)
);

CREATE TABLE naukowcy (
  id INT PRIMARY KEY AUTO_INCREMENT,
  imię VARCHAR(255),
  nazwisko VARCHAR(255),
  specjalizacja VARCHAR(255),
  instytucja_powiązana VARCHAR(255)
);

CREATE TABLE badania (
  id INT PRIMARY KEY AUTO_INCREMENT,
  data_badania TIMESTAMP, #czas bardzo dokładny 24 znaki
  miejsce_badania VARCHAR(255),
  wyniki TEXT,
  instytucja VARCHAR(255),
  naukowiec_id INT, #liczba całkowita
  FOREIGN KEY (naukowiec_id) REFERENCES naukowcy(id) ON DELETE CASCADE #klucz z innej tabeli, łączący obie tabele z innym kluczem
);

CREATE TABLE rekiny (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nazwa_naukowa VARCHAR(255),
  nazwa_potoczna VARCHAR(255),
  rodzina VARCHAR(255),
  długość FLOAT,
  waga FLOAT,
  stan_zagrożenia VARCHAR(255),
  dieta_id INT,
  FOREIGN KEY (dieta_id) REFERENCES diety(id) ON DELETE CASCADE
);

CREATE TABLE rekiny_siedliska (
  rekin_id INT,
  siedlisko_id INT,
  PRIMARY KEY (rekin_id, siedlisko_id),
  FOREIGN KEY (rekin_id) REFERENCES rekiny(id) ON DELETE CASCADE,
  FOREIGN KEY (siedlisko_id) REFERENCES siedliska(id) ON DELETE CASCADE
);

CREATE TABLE rekiny_zagrożenia (
  rekin_id INT,
  zagrożenie_id INT,
  PRIMARY KEY (rekin_id, zagrożenie_id),
  FOREIGN KEY (rekin_id) REFERENCES rekiny(id) ON DELETE CASCADE,
  FOREIGN KEY (zagrożenie_id) REFERENCES zagrożenia(id) ON DELETE CASCADE
);

CREATE TABLE rekiny_badania (
  rekin_id INT,
  badanie_id INT,
  PRIMARY KEY (rekin_id, badanie_id),
  FOREIGN KEY (rekin_id) REFERENCES rekiny(id) ON DELETE CASCADE,
  FOREIGN KEY (badanie_id) REFERENCES badania(id) ON DELETE CASCADE
);