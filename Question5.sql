-- renaming a column in the table

ALTER TABLE t_alice_sera_project_sql_primary_final 
RENAME COLUMN year_relevant_to_price TO year;

-- creating a linked table

SELECT
	*
FROM
	(
	SELECT
		tp.payroll_year AS year,
		ROUND(AVG(tp.food_price), 2) AS avg_food_price,
		ROUND(AVG(tp.aver_wage), 2) AS aver_wage,
		ROUND(ts.GDP, 2) AS rounded_GDP,
		ROUND(
            (LAG(AVG(tp.food_price), 0) OVER (ORDER BY tp.payroll_year) / LAG(AVG(tp.food_price), 1) OVER (ORDER BY tp.payroll_year) * 100) - 100,
            2
        ) AS food_price_growth_in_percent,
		ROUND(
            (LAG(AVG(tp.aver_wage), 0) OVER (ORDER BY tp.payroll_year) / LAG(AVG(tp.aver_wage), 1) OVER (ORDER BY tp.payroll_year) * 100) - 100,
            2
        ) AS wage_growth_in_percent,
		ROUND(
            (LAG(AVG(ts.GDP), 0) OVER (ORDER BY ts.year) / LAG(AVG(ts.GDP), 1) OVER (ORDER BY ts.year) * 100) - 100,
            2
        ) AS GDP_growth_in_percent,
		ROUND(
            (LAG(AVG(ts.GDP), 1) OVER (ORDER BY ts.year) / LAG(AVG(ts.GDP), 2) OVER (ORDER BY ts.year) * 100) - 100,
            2
        ) AS prev_year_GDP_growth_in_percent
	FROM
		t_alice_sera_project_sql_primary_final tp
	LEFT JOIN t_alice_sera_project_sql_secondary_final ts ON
		tp.payroll_year = ts.year
	WHERE
		ts.country = 'Czech Republic'
	GROUP BY
		year
) AS subquery
WHERE
	GDP_growth_in_percent > 3
	AND food_price_growth_in_percent > 2
	AND wage_growth_in_percent > 2
	OR prev_year_GDP_growth_in_percent > 3
	AND wage_growth_in_percent > 2
	AND food_price_growth_in_percent > 2


   
