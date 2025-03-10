-- EXTRACT
-- 1
SELECT EXTRACT(day FROM date) as day, count(*) as nb_match_by_day
FROM EUROPEAN_SOCCER.Match
GROUP BY day
ORDER BY nb_match_by_day DESC
LIMIT 1;

-- 2
SELECT EXTRACT(month FROM date) as month, count(*) as nb_match_by_month
FROM EUROPEAN_SOCCER.Match
GROUP BY month
ORDER BY nb_match_by_month DESC
LIMIT 1;

-- SQL Bolt - JOIN
-- 12
SELECT director, COUNT(*)
FROM movies
GROUP BY director;
--
SELECT director, SUM(domestic_sales + international_sales) as sum_domestic_internationale_sales
FROM movies m
INNER JOIN boxoffice b ON m.id = b.movie_id
GROUP BY director;

-- EUROPEAN SOCCER
-- 1
SELECT team_long_name, SUM(home_team_goal) as sum_home_team_goal
FROM EUROPEAN_SOCCER.Match m
JOIN EUROPEAN_SOCCER.Team t ON m.home_team_api_id = t.team_api_id
GROUP BY team_long_name
ORDER BY sum_home_team_goal DESC
LIMIT 1;

-- 2
SELECT team_long_name, SUM(away_team_goal) as sum_away_team_goal
FROM EUROPEAN_SOCCER.Match m
JOIN EUROPEAN_SOCCER.Team t ON m.away_team_api_id = t.team_api_id
GROUP BY team_long_name
ORDER BY sum_away_team_goal DESC
LIMIT 1;

-- 3
SELECT player_name, ROUND(AVG(overall_rating), 2) as round_avg_overall_rating
FROM EUROPEAN_SOCCER.Player p
JOIN EUROPEAN_SOCCER.Player_attributes pa ON p.player_fifa_api_id = p.player_fifa_api_id
WHERE EXTRACT(year FROM date) = 2016
GROUP BY player_name
ORDER BY round_avg_overall_rating DESC, player_name ASC
LIMIT 5; -- lot of returned rows

-- NYSE
-- 1
SELECT Ticker_Symbol, Investments
FROM NYSE.indicators
WHERE EXTRACT(year FROM Period_Ending) = 2016
ORDER BY Investments DESC
LIMIT 1;

-- 2
SELECT Ticker_Symbol, SUM(Investments) as sum_investements
FROM NYSE.indicators
GROUP BY Ticker_Symbol
ORDER BY sum_investements DESC
LIMIT 1;

-- 3
-- Same as 4, don't know which column to use
SELECT n.GICS_Sector, SUM(Gross_Profit) as sum_gross_profit_2016
FROM NYSE.indicators i
JOIN NYSE.nyse n ON i.Ticker_Symbol = n.Ticker_symbol
WHERE EXTRACT(year FROM Period_Ending) = 2016
GROUP BY n.GICS_Sector
ORDER BY sum_gross_profit_2016 DESC
LIMIT 1;

-- 4
SELECT n.GICS_Sector, SUM(Gross_Profit) as sum_gross_profit_2016
FROM NYSE.indicators i
JOIN NYSE.nyse n ON i.Ticker_Symbol = n.Ticker_symbol
WHERE EXTRACT(year FROM Period_Ending) = 2016
GROUP BY n.GICS_Sector
ORDER BY sum_gross_profit_2016 DESC
LIMIT 1;

-- 5
SELECT n.GICS_Sector, SUM(Short_Term_Debt___Current_Portion_of_Long_Term_Debt) as sum_short_debt
FROM NYSE.indicators i
JOIN NYSE.nyse n ON i.Ticker_Symbol = n.Ticker_symbol
GROUP BY n.GICS_Sector
ORDER BY sum_short_debt DESC
LIMIT 1;

-- 6
-- Already did in the "Connect the dots" exercice

-- IMDB - WITH AS
-- 1
WITH movies_with_johnny_depp AS (
 SELECT m.movie_title, m.imdb_score
  FROM IMDB.movies m
  JOIN IMDB.main_actors ma ON m.actor_1_id = ma.actor_1_id
  JOIN IMDB.second_actors sa ON m.actor_2_id = sa.actor_2_id
  JOIN IMDB.third_actors ta ON m.actor_3_id = ta.actor_3_id
  WHERE ma.actor_1_name = "Johnny Depp"
  OR sa.actor_2_name = "Johnny Depp"
  OR ta.actor_3_name = "Johnny Depp"
)
SELECT m.movie_title, m.imdb_score
FROM movies_with_johnny_depp m
ORDER BY m.imdb_score DESC
LIMIT 1; 

-- Hacker Rank
-- 1
SELECT h.hacker_id, h.name
FROM submissions s
JOIN challenges c ON s.challenge_id = c.challenge_id
JOIN difficulty d ON c.difficulty_level = d.difficulty_level 
JOIN hackers h ON s.hacker_id = h.hacker_id
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.hacker_id) > 1
ORDER BY COUNT(s.hacker_id) DESC, s.hacker_id ASC

-- 2
SELECT c.hacker_id, h.name, COUNT(c.hacker_id) as count_hacker_id
FROM Hackers h
INNER JOIN Challenges c ON c.hacker_id = h.hacker_id
GROUP BY c.hacker_id, h.name
HAVING
    count_hacker_id = 
        (SELECT MAX(tempTable.count_challenge)
        FROM (SELECT COUNT(hacker_id) as count_challenge
             FROM Challenges
             GROUP BY hacker_id
             ORDER BY hacker_id ASC) tempTable)
    OR count_hacker_id IN 
        (SELECT tempTable.count_challenge
         FROM (SELECT COUNT(*) AS count_challenge 
               FROM challenges
               GROUP BY hacker_id) tempTable
         GROUP BY tempTable.count_challenge
         HAVING COUNT(tempTable.count_challenge) = 1)
ORDER BY count_hacker_id DESC, c.hacker_id ASC