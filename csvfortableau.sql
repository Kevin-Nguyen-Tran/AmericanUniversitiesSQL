// What is the admissions ratio for each American University?

SELECT admissions_total, applicants_total, admissions_total/CAST(applicants_total AS decimal) AS admissions_ratio, american_universities.name FROM enrollment
JOIN american_universities ON american_universities.id = enrollment.au_id;

// What is the four year bachelors graduation rate for each American University?

SELECT graduation_rate_four_year_bachelors, geographical_location.latitude, geographical_location.longitude, american_universities.name FROM graduation_rate
JOIN num_degrees_awarded ON num_degrees_awarded.graduation_rate_id = graduation_rate.id
JOIN american_universities ON american_universities.id = num_degrees_awarded.au_id
JOIN geographical_location ON geographical_location.au_id = american_universities.id
ORDER BY graduation_rate_four_year_bachelors;

// How diverse is each university in regards to ethnic background?

SELECT percent_american_indian, percent_asian, percent_african_american, percent_hispanic_latino, percent_native_hawaiian, percent_white, percent_two_plus_races, 
percent_unknown, percent_nonresident_alien, geographic_region, american_universities.name FROM percent_of_total_enrollment_race
JOIN enrollment ON enrollment.percent_of_total_enroll_race_id = percent_of_total_enrollment_race.id
JOIN american_universities ON american_universities.id = enrollment.au_id
JOIN geographical_location ON geographical_location.au_id = american_universities.id;
