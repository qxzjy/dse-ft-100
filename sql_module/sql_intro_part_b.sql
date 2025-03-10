-- WHERE
SELECT movie_title, imdb_score
FROM IMDB.movies
WHERE imdb_score <= 1.5;

-- AND
SELECT movie_title, country, budget, imdb_score
FROM IMDB.movies
WHERE imdb_score < 3
AND budget > 50000000
AND country = "USA";

-- OR AND
SELECT movie_title, country, imdb_score
FROM IMDB.movies
WHERE country = "North Korea"
OR (imdb_score > 7 AND imdb_score <8);

-- DISTINCT
SELECT DISTINCT director_name
FROM IMDB.directors
WHERE director_facebook_likes > 100;

-- BETWEEN
SELECT movie_title, title_year, imdb_score
FROM IMDB.movies
WHERE title_year BETWEEN 1988 AND 2000
AND imdb_score BETWEEN 4 AND 5;

-- LIKE
SELECT movie_title
FROM IMDB.movies
WHERE movie_title LIKE "J%" OR movie_title LIKE "%man%";

-- ORDER BY
SELECT movie_title, budget
FROM IMDB.movies
WHERE budget IS NOT NULL
ORDER BY budget ASC
LIMIT 1;

-- AS
SELECT movie_title AS Title, title_year AS Year
FROM IMDB.movies
WHERE movie_title LIKE '%woman%'
AND title_year > 1935;