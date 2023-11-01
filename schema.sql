/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
	id              int GENERATED ALWAYS as IDENTITY,
	name            varchar(100) NOT NULL,
	date_of_birth   date NOT NULL,
	escape_attempts int NOT NULL,
	neutered        boolean NOT NULL,
	weight_kg       decimal NOT NULL,
	primary key(id)
);

ALTER TABLE animals ADD species varchar(40);

CREATE TABLE owners(
	id int GENERATED ALWAYS AS IDENTITY,
	full_name varchar(50),
	age int,
	primary key(id)
);

CREATE TABLE species(
	id int GENERATED ALWAYS AS IDENTITY,
	name varchar(45),
	primary key(id)
);

ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD COLUMN species_id INT,
DROP COLUMN species;

ALTER TABLE animals
ADD CONSTRAINT species_fk
	FOREIGN KEY (species_id)
		REFERENCES species(id);

ALTER TABLE animals
ADD CONSTRAINT owner_fk
	FOREIGN KEY (owner_id)
		REFERENCES owners(id);

CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    age INT,
    date_of_graduation date,
    primary key(id)
);

CREATE TABLE specializations(
    species_id INT,
    vet_id INT,
    CONSTRAINT fk_species 
	FOREIGN KEY(species_id) 
		REFERENCES species(id),
    CONSTRAINT fk_vets 
	FOREIGN KEY(vet_id) 
		REFERENCES vets(id)
);

CREATE TABLE visits(
    animal_id INT,
    vet_id INT,
    date_of_visit date,
    CONSTRAINT fk_animal 
	FOREIGN KEY(animal_id) 
		REFERENCES animals(id),
    CONSTRAINT fk_vet 
	FOREIGN KEY(vet_id) 
		REFERENCES vets(id)
);
