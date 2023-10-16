CREATE TABLE IF NOT EXISTS t_Alice_Sera_project_SQL_secondary_final AS (
SELECT 
	e.GDP, 
	e.population,
	e.gini,
	e.year,
	e.country,
	c.continent
FROM
	economies e
LEFT JOIN countries c 
    ON
	c.country = e.country
WHERE
	c.continent LIKE '%Europe%'
	AND e.year BETWEEN 2006 AND 2018)
;






























SELECT *
FROM countries

SELECT *
FROM economies e 
ORDER BY `year` asc;

SELECT 
	payroll_year 
FROM t_Alice_Sera_project_SQL_primary_final
ORDER BY payroll_year desc