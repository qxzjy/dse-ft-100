-- SQL Bolt
-- 10
SELECT MAX(years_employed) as max_years_employed
FROM employees;
--
SELECT Role, AVG(Years_employed) as average_years_employed
FROM employees
GROUP BY Role;
--
SELECT building, SUM(Years_employed) as sum_years_employed
FROM employees
GROUP BY building;

-- 11
SELECT Role, count(Role) as count_artist
FROM employees
WHERE Role = "Artist";
--
SELECT Role, count(role) as count_by_role
FROM employees
GROUP BY Role;
--
SELECT Role, SUM(Years_employed) as sum_years_employed
FROM employees
GROUP BY Role
HAVING Role = "Engineer";

-- NYSE
-- 1
SELECT GICS_Sector, COUNT(GICS_Sector) as count_sector
FROM NYSE.companies
GROUP BY GICS_Sector
ORDER BY count_sector DESC
LIMIT 1;

-- 2
SELECT Address_of_Headquarters, COUNT(Address_of_Headquarters) as count_adress_hq
FROM NYSE.companies
GROUP BY Address_of_Headquarters
HAVING Address_of_Headquarters LIKE "%California"
ORDER BY count_adress_hq DESC
LIMIT 5;

-- 3
SELECT Ticker_Symbol, Net_Income
FROM NYSE.indicators
WHERE For_Year = 2015.0
ORDER BY Net_Income DESC
LIMIT 5;

-- 4
SELECT Ticker_Symbol, SUM(Net_Income) as sum_net_income
FROM NYSE.indicators
GROUP BY Ticker_Symbol
ORDER BY sum_net_income DESC
LIMIT 5;

-- 5
SELECT Ticker_Symbol, AVG(ROUND((Total_Assets/Total_Liabilities), 3)) as avg_ratio_assets_liabilities
FROM NYSE.indicators
GROUP BY Ticker_Symbol
LIMIT 5;

-- 6
SELECT Ticker_Symbol, AVG(Net_Income) as avg_net_income_2014_2016
FROM NYSE.indicators
WHERE For_Year BETWEEN 2014 AND 2016
GROUP BY Ticker_Symbol
HAVING Ticker_Symbol = "AAPL";

-- 7
SELECT Ticker_Symbol, AVG(Net_Income) as avg_net_income, AVG(Long_Term_Debt) as avg_long_term_debt
FROM NYSE.indicators
GROUP BY Ticker_Symbol
HAVING avg_long_term_debt < 1000000.0
ORDER BY avg_net_income DESC
LIMIT 5;

-- 8
SELECT movie_title, country, imdb_score
FROM IMDB.movies
WHERE imdb_score > (
  SELECT MAX(imdb_score)
  FROM IMDB.movies
  WHERE Country = "USA")
AND Country != "USA";

-- Hacker Rank
-- 1
SELECT CITY, CHAR_LENGTH(CITY) as city_char_length
FROM STATION
ORDER BY city_char_length DESC, CITY ASC
LIMIT 1;
SELECT CITY, CHAR_LENGTH(CITY) as city_char_length
FROM STATION
ORDER BY city_char_length DESC, CITY ASC
LIMIT 1;

-- 2
SELECT SALARY*MONTHS as max_total_earnings, COUNT(*)
FROM EMPLOYEE 
GROUP BY max_total_earnings
ORDER BY max_total_earnings  DESC
LIMIT 1;

-- 3
SELECT concat(NAME,
  CASE
    WHEN occupation = "Doctor" THEN "(D)" 
    WHEN occupation = "Professor" THEN "(P)"
    WHEN occupation = "Singer" THEN "(S)"
    WHEN occupation = "Actor" THEN "(A)"
  END )
FROM OCCUPATIONS
ORDER BY NAME;
SELECT "There are a total of ", COUNT(OCCUPATION), concat(LOWER(OCCUPATION),"s.")
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(OCCUPATION) ASC, OCCUPATION ASC;

-- 4
SELECT c.company_code,
  c.founder, 
  count(DISTINCT l.lead_manager_code), -- 
  count(DISTINCT s.senior_manager_code), 
  count(DISTINCT m.manager_code),
  count(DISTINCT e.employee_code) 
FROM Company c, Lead_Manager l, Senior_Manager s, Manager m, Employee e 
WHERE c.company_code = l.company_code 
AND l.lead_manager_code=s.lead_manager_code 
AND s.senior_manager_code=m.senior_manager_code 
AND m.manager_code=e.manager_code 
GROUP BY c.company_code
ORDER BY c.company_code;