-- 1. tabulka srovnávací min. a max. rok, odvětví, ve kterých mzdy neklesly

SELECT
	industry_name,
	AVG(aver_wage) AS average_wage,
	MIN(payroll_year) AS start_year,
	MAX(payroll_year) AS end_year
FROM
	t_alice_sera_project_sql_primary_final pt
WHERE
	industry_name IS NOT NULL
GROUP BY
	industry_name
HAVING
	MIN(aver_wage) <= MAX(aver_wage);


-- tabulka k detailnější analýze

SELECT
	industry_name,
	AVG(aver_wage) AS average_wage,
	MIN(payroll_year) AS start_year,
	MAX(payroll_year) AS end_year
FROM
	t_alice_sera_project_sql_primary_final pt
WHERE
	industry_name IS NOT NULL
GROUP BY
	industry_name,
	payroll_year
HAVING
	MIN(aver_wage) <= MAX(aver_wage);
	
-- odvětví, ve kterých mzdy klesaly

SELECT
	industry_name,
	AVG(aver_wage) AS average_wage,
	MIN(payroll_year) AS start_year,
	MAX(payroll_year) AS end_year
FROM
	t_alice_sera_project_sql_primary_final pt
WHERE
	industry_name IS NOT NULL
GROUP BY
	industry_name,
	payroll_year
HAVING
	MIN(aver_wage) > MAX(aver_wage);