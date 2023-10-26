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
