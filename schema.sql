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
