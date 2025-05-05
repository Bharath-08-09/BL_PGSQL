-- SQL queries used-
-- CRUD
-- Create-
INSERT INTO weekly_excess_deaths (country, year, week, total_deaths)
VALUES ('India', 2021, 12, 3400);
-- Read-
SELECT * FROM weekly_excess_deaths WHERE country = 'India';
-- Update-
UPDATE weekly_excess_deaths
SET total_deaths = 3600
WHERE country = 'India' AND year = 2021 AND week = 12;
-- Delete-
DELETE FROM weekly_excess_deaths
WHERE country = 'India' AND year = 2021 AND week = 12;

-- Aggregated Queries
-- Total Deaths by Country
SELECT country, SUM(total_deaths) AS total_deaths
FROM weekly_excess_deaths
GROUP BY country
ORDER BY total_deaths DESC;

-- Average Weekly COVID Deaths by Country
SELECT country, AVG(covid_deaths) AS avg_weekly_covid_deaths
FROM weekly_excess_deaths
GROUP BY country
ORDER BY avg_weekly_covid_deaths DESC;

-- Total Excess Deaths
SELECT country,
       SUM(total_deaths - expected_deaths) AS total_excess_deaths
FROM weekly_excess_deaths
GROUP BY country
ORDER BY total_excess_deaths DESC;

-- Death Rate per 100,000 People
SELECT country,
       SUM(total_deaths) AS total_deaths,
       MAX(population) AS population,
       ROUND((SUM(total_deaths)::decimal / MAX(population)) * 100000, 2) AS death_rate_per_100k
FROM weekly_excess_deaths
GROUP BY country
ORDER BY death_rate_per_100k DESC;

-- Yearly COVID Deaths Summary
SELECT year, SUM(covid_deaths) AS yearly_covid_deaths
FROM weekly_excess_deaths
GROUP BY year
ORDER BY year;

-- Top 5 Countries by Weekly Deaths in Any Week
SELECT country, year, week, total_deaths
FROM weekly_excess_deaths
ORDER BY total_deaths DESC
LIMIT 5;