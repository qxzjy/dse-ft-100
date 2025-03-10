-- 1
SELECT movie_title, budget, imdb_score
FROM IMDB.movies
ORDER BY budget DESC
LIMIT 1;

-- 2
SELECT actor_1_name
FROM IMDB.main_actors
WHERE actor_1_name LIKE "%John%";

-- 3
SELECT movie_title, movie_facebook_likes
FROM IMDB.movies
ORDER BY movie_facebook_likes DESC
LIMIT 1;

-- 4
SELECT movie_title, imdb_score
FROM IMDB.movies
ORDER BY imdb_score DESC
LIMIT 15;

-- 5
SELECT movie_title, country, imdb_score
FROM IMDB.movies
WHERE country != "USA"
ORDER BY imdb_score DESC
LIMIT 15;

-- 6
SELECT movie_title, title_year,imdb_score
FROM IMDB.movies
WHERE title_year BETWEEN 1990 AND 1999
ORDER BY imdb_score DESC
LIMIT 10;

-- 7
SELECT Country, Happiness_rank
FROM world_happiness_record.world_happiness_record
ORDER BY Happiness_rank ASC
LIMIT 5;

-- 8
SELECT Country, Happiness_rank
FROM world_happiness_record.world_happiness_record
ORDER BY Happiness_rank DESC
LIMIT 5;

-- 9
SELECT Country, Happiness_rank, Life_expectancy
FROM world_happiness_record.world_happiness_record
ORDER BY Life_expectancy DESC
LIMIT 1;

-- HACKER RANK
-- 2 
SELECT DISTINCT CITY
FROM STATION 
WHERE mod(ID,2) = 0;

-- 2
SELECT COUNT(CITY)-COUNT(DISTINCT CITY)
FROM STATION;

-- 3
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP "^[aeiou]";
-- ALTERNATIVE
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE "a%"
OR CITY LIKE "e%"
OR CITY LIKE "i%"
OR CITY LIKE "o%"
OR CITY LIKE "u%";

-- 4
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP "^[aeiou].*[aeiou]$";
-- ALTERNATIVE
SELECT DISTINCT CITY
FROM STATION
WHERE CITY IN (
    SELECT DISTINCT CITY
    FROM STATION
    WHERE CITY LIKE "a%"
    OR CITY LIKE "e%"
    OR CITY LIKE "i%"
    OR CITY LIKE "o%"
    OR CITY LIKE "u%")
AND CITY LIKE "%a"
OR CITY LIKE "%e"
OR CITY LIKE "%i"
OR CITY LIKE "%o"
OR CITY LIKE "u%";

-- 5
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT IN (SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP "^[aeiou].*[aeiou]$")
-- ALTERNATIVE
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT IN (
    SELECT DISTINCT CITY
    FROM STATION
    WHERE CITY IN (
        SELECT DISTINCT CITY
        FROM STATION
        WHERE CITY LIKE "a%"
        OR CITY LIKE "e%"
        OR CITY LIKE "i%"
        OR CITY LIKE "o%"
        OR CITY LIKE "u%")
    AND CITY LIKE "%a"
    OR CITY LIKE "%e"
    OR CITY LIKE "%i"
    OR CITY LIKE "%o"
    OR CITY LIKE "u%")