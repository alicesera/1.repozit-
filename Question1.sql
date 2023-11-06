-- Table 1: Comparison of the minimum and maximum years for sectors where wages did not decrease.

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


-- Table for more detailed analysis

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
	
-- Sectors in which wages fell

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
