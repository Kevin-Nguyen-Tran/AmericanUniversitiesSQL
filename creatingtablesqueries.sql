// Creating tables for relational database

CREATE TABLE american_universities(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);

CREATE TABLE geographical_location(
	id SERIAL PRIMARY KEY,
	au_id INT REFERENCES american_universities(id),
	geographic_region VARCHAR(100),
	longitude DECIMAL,
	latitude DECIMAL,
	state VARCHAR(40)
);

CREATE TABLE hbcu(
	id SERIAL PRIMARY KEY,
	au_id INT REFERENCES american_universities(id),
	historically_black_college_or_univeristy VARCHAR(3)
);

CREATE TABLE graduation_rate(
	id SERIAL PRIMARY KEY,
	graduation_rate_four_year_bachelors SMALLINT
);

CREATE TABLE num_degrees_awarded(
	id SERIAL PRIMARY KEY,
	au_id INT REFERENCES american_universities(id),
	num_associates_degree SMALLINT,
  	num_bachelors_degree SMALLINT,
  	num_masters_degree SMALLINT,
  	graduation_rate_id INT REFERENCES graduation_rate(id)
);

CREATE TABLE percent_of_total_enrollment_race(
	id SERIAL PRIMARY KEY,
	percent_american_indian SMALLINT,
  	percent_asian SMALLINT,
  	percent_african_american SMALLINT,
  	percent_hispanic_latino SMALLINT,
  	percent_native_hawaiian SMALLINT,
  	percent_white SMALLINT,
  	percent_two_plus_races SMALLINT,
 	percent_unknown SMALLINT,
  	percent_nonresident_alien SMALLINT
);

CREATE TABLE enrollment(
	id SERIAL PRIMARY KEY,
	au_id INT REFERENCES american_universities(id),
	applicants_total SMALLINT,
  	admissions_total SMALLINT,
  	enrollment_total SMALLINT,
  	percent_of_total_enroll_race_id INT REFERENCES percent_of_total_enrollment_race(id)
);
