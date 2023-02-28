USE sakila;

# 1. In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT last_name 
FROM actor
ORDER BY last_name ASC; #check to get an idea of the last names in the table

SELECT last_name, COUNT(last_name) AS num_last_name # count the last names
FROM actor
GROUP BY last_name # group everything by the last names
HAVING num_last_name = 1; # we are looking for last names that only appear once

 
# 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT COUNT(last_name) AS num_last_name, last_name # count the last names
FROM actor
GROUP BY last_name
HAVING num_last_name > 1 # we are only looking for last names that appear more than once
ORDER BY num_last_name DESC; #ordered in descending order to see which surname is repeated the most (for fun)

# 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT *
FROM rental;

SELECT staff_id, COUNT(inventory_id) AS num_of_rentals # count the inventory
FROM rental
GROUP BY staff_id; # group by the staff_id to get the number of rentals they each processed 


# 4. Using the film table, find out how many films were released each year.
SELECT *
FROM film;

SELECT COUNT(title) AS num_of_films # count the titles
FROM film
GROUP BY release_year; # group by release year to get the number of films released. They were only released in 2006 so it was 1000


# 5. Using the film table, find out for each rating how many films were there.
SELECT *
FROM film;

SELECT COUNT(title) AS num_of_films, rating # count the titles
FROM film
GROUP BY rating #group by the rating to see how many films there are per rating
ORDER BY num_of_films DESC; #ordered in descending order to be neater 

# 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT ROUND(AVG(length), 2) AS mean_length, rating  # get the average duration/length of the films and use ROUND to round it off to 2 decimal points
FROM film
GROUP BY rating; #group by rating to see the average length per rating


# 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT ROUND(AVG(length), 2) AS mean_length, rating # get the average duration/length of the films. I left ROUND in to round it off to 2 decimal points and make it look a bit neater
FROM film
GROUP BY rating # group by rating
HAVING mean_length > 120; # look at which films were longer than 120 minutes
