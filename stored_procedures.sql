CREATE OR REPLACE PROCEDURE increase_expected_deaths(target_country TEXT, inc_percent NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE weekly_excess_deaths
    SET expected_deaths = expected_deaths + (expected_deaths * inc_percent / 100)
    WHERE country = target_country;
END;
$$;

CALL increase_expected_deaths('Australia', 10);