USE rekinki;

SHOW TABLES;
SHOW COLUMNS IN badania;
SELECT * FROM badania;

INSERT INTO diety (opis, rodzaje_pożywienia)
VALUES ('Mięsożerna', 'Ryby, ssaki morskie'),
('Mięsożerna', 'Ryby, żółwie'),
('Planktonożerna', 'Plankton, kryl'),
('Mięsożerna', 'Ryby, głowonogi'),
('Mięsożerna', 'Ryby, skorupiaki'),
('Mięsożerna', 'Ryby denne'),
('Mięsożerna', 'Małe ryby, bezkręgowce'),
('Planktonożerna', 'Plankton'),
('Mięsożerna', 'Ryby, foki'),
('Mięsożerna', 'Ryby, kałamarnice');

INSERT INTO siedliska (typ_siedliska, lokalizacja, głębokość_maksymalna, średnia_temperatura)
VALUES ('Oceaniczne', 'Atlantyk', 4000, 20),
('Przybrzeżne', 'Pacyfik', 200, 25),
('Tropikalne', 'Ocean Indyjski', 1000, 27),
('Umiarkowane', 'Atlantyk', 300, 15),
('Rafa', 'Morze Koralowe', 50, 28),
('Głębinowe', 'Ocean Arktyczny', 5000, -2),
('Płytkie', 'Morze Śródziemne', 30, 22),
('Pelagiczne', 'Północny Atlantyk', 1000, 10),
('Arktyczne', 'Ocean Arktyczny', 2000, -1),
('Otwarte wody', 'Pacyfik', 3000, 18);

INSERT INTO rekiny (nazwa_naukowa, nazwa_potoczna, rodzina, długość, waga, stan_zagrożenia, dieta_id)
VALUES ('Carcharodon carcharias', 'Żarłacz biały', 'Lamnidae', 6.0, 1100, 'Narażony na wyginięcie', 1),
('Galeocerdo cuvier', 'Żarłacz tygrysi', 'Carcharhinidae', 5.5, 900, 'Bliski zagrożenia', 2),
('Rhincodon typus', 'Rekin wielorybi', 'Rhincodontidae', 12.0, 21000, 'Zagrożony', 3),
('Sphyrna zygaena', 'Rekin młot', 'Sphyrnidae', 4.3, 500, 'Narażony na wyginięcie', 5),
('Pristiophorus cirratus', 'Piłonos zwyczajny', 'Pristiophoridae', 1.5, 18, 'Najmniejszej troski', 7),
('Cetorhinus maximus', 'Rekin baskijski', 'Cetorhinidae', 10.0, 19000, 'Narażony na wyginięcie', 8),
('Somniosus microcephalus', 'Rekin grenlandzki', 'Somniosidae', 7.0, 1000, 'Bliski zagrożenia', 9),
('Alopias vulpinus', 'Kosogon', 'Alopiidae', 6.1, 500, 'Narażony na wyginięcie', 10),
('Cetorhinus maximus', 'Długoszpar', 'Cetorhinidae', 5, 5200, 'Zagrożony', 8),
('Somniosus microcephalus', 'Rekin polarny', 'Somniosidae', 5, 1500, 'Bliski zagrożenia', 1),
('Squalus acanthias', 'Koleń pospolity', 'Squalus', 1.6, 9, 'Narażony na wyginięcie', 5),
('Isurus oxyrinchus', 'Ostronos atlantycki', 'Isurus', 3.2, 400, 'Zagrożony', 4),
('Carcharhinus leucas', 'Żarłacz tępogłowy', 'Carcharhinus', 2, 90, 'Narażony na wyginięcie', 2);

INSERT INTO naukowcy (imię, nazwisko, specjalizacja, instytucja_powiązana)
VALUES ('Anna', 'Kowalska', 'Ekologia morska', 'Marine Research Center'),
('Jan', 'Nowak', 'Biologia morska', 'Oceanography Institute'),
('Maria', 'Wiśniewska', 'Ochrona raf koralowych', 'Coral Foundation'),
('Piotr', 'Zieliński', 'Zachowanie rekinów', 'Institute of Shark Studies'),
('Ewa', 'Malinowska', 'Zanieczyszczenie mórz', 'Marine Pollution Research'),
('Tomasz', 'Lewandowski', 'Migracje morskie', 'Sea Life Observatory'),
('Joanna', 'Kwiatkowska', 'Genetyka rekinów', 'Genetics and Marine Life'),
('Adam', 'Czarnecki', 'Ekosystemy głębinowe', 'Deep Sea Research Center'),
('Karolina', 'Mazur', 'Rekiny planktonożerne', 'Ocean Life Studies'),
('Paweł', 'Szymański', 'Zmiany klimatu i ich wpływ', 'Climate Impact Research');

INSERT INTO badania (data_badania, miejsce_badania, wyniki, instytucja, naukowiec_id)
VALUES (CURRENT_DATE, 'Bahamy', 'Obserwacja migracji żarłacza białego', 'Marine Research Center', 1),
(CURRENT_DATE, 'Hawaje', 'Badanie diety żarłacza tygrysiego', 'Oceanography Institute', 2),
(CURRENT_DATE, 'Indonezja', 'Ochrona siedlisk rekinów młotów', 'Coral Foundation', 3),
(CURRENT_DATE, 'Malediwy', 'Zachowanie rekinów wielorybich w ich naturalnym środowisku', 'Institute of Shark Studies', 4),
(CURRENT_DATE, 'Filipiny', 'Wpływ zanieczyszczeń na rekiny młotki', 'Marine Pollution Research', 5),
(CURRENT_DATE, 'Ocean Arktyczny', 'Badanie migracji rekinów grenlandzkich', 'Sea Life Observatory', 6),
(CURRENT_DATE, 'Atlantyk', 'Analiza genetyczna żarłaczy mako', 'Genetics and Marine Life', 7),
(CURRENT_DATE, 'Głębinowe wody Pacyfiku', 'Wpływ głębinowych ekosystemów na rekiny sześciozabowe', 'Deep Sea Research Center', 8),
(CURRENT_DATE, 'Ocean Indyjski', 'Obserwacja diety rekinów planktonożernych', 'Ocean Life Studies', 9),
(CURRENT_DATE, 'Północny Atlantyk', 'Wpływ zmian klimatu na migracje rekinów baskijskich', 'Climate Impact Research', 10);

INSERT INTO zagrożenia (opis_zagrożenia, źródło)
VALUES ('Kłusownictwo', 'Raport WWF'),
('Zanieczyszczenie wody', 'Greenpeace'),
('Utrata siedlisk', 'UNEP');

INSERT INTO rekiny_badania (rekin_id, badanie_id)
VALUES (1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 1),
(8, 2),
(9, 3),
(10, 1);

INSERT INTO rekiny_siedliska (rekin_id, siedlisko_id)
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO rekiny_zagrożenia (rekin_id, zagrożenie_id)
VALUES (1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 2),
(8, 1),
(9, 3),
(10, 1);
