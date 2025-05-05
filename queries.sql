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