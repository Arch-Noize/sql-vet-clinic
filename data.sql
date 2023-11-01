/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES
('Agumon', '2020-02-3', 0, true, 10.23),
('Gabumon', '2018-11-15', 2, true, 8),
('Pikachu', '2021-01-07', 1, false, 15.04),
('Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES
('Charmander', '2020-02-08', 0, false, -11),
('Plantmon', '2021-11-15', 2, true, -5.7),
('Squirtle', '1993-04-02', 3, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45),
('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17),
('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners (full_name, age) VALUES 
('San Smith', 34), 
('Jennifer Orwell', 19 ), 
('Bob', 45 ), 
('Melody Pond', 77 ), 
('Dean Winchester', 14 ), 
('Jodie Whittaker', 38 );

INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');

UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals 
SET owner_id = CASE
	WHEN name = 'Agumon' THEN 1
	WHEN name = 'Gabumon' OR name = 'Pikachu' THEN 2
	WHEN name = 'Devimon' OR name = 'Plantmon' THEN 3
	WHEN name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom' THEN 4
	WHEN name = 'Angemon' OR name = 'Boarmon' THEN 5
END;

INSERT INTO vets(name, age, date_of_graduation) VALUES
('Vet William Tatcher', 45, '2000/04/23'),
('Vet Maisy Smith', 26, '2019/01/17'),
('Vet Stephanie Mendez', 64, '1981/05/04'),
('Vet Jack Harkness', 38, '2008/06/08');

INSERT INTO specializations (species_id, vet_id) VALUES
(1,1),
(1,3),
(2,3), 
(2,4);

INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES
(6, 1, '2020-05-24'),
(6, 3, '2020-07-22'),
(3, 4, '2021-02-02'),
(9, 2, '2020-01-05'),
(9, 2, '2020-03-08'),
(9, 2, '2020-05-14'),
(4, 3, '2021-05-04'),
(7, 4, '2021-02-24'),
(1, 2, '2019-12-21'),
(1, 1, '2020-08-10'),
(1, 2, '2021-04-07'),
(8, 3, '2019-09-29'),
(2, 4, '2020-10-03'),
(2, 4, '2020-11-04'),
(5, 2, '2019-01-24'),
(5, 2, '2019-05-15'),
(5, 2, '2020-02-27'),
(5, 2, '2020-08-03'),
(10, 3, '2020-05-24'),
(10, 1, '2021-01-11');

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

CREATE INDEX animal_index ON visits (animal_id);
CREATE INDEX vet_index ON visits (vet_id);
CREATE INDEX email_index ON owners (email);
