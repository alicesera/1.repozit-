-- přejmenování sloupečku v tabulce

ALTER TABLE t_alice_sera_project_sql_primary_final 
RENAME COLUMN year_relevant_to_price TO year;

-- vytvoření spojené tabulky

SELECT
	tp.payroll_year AS year,
	AVG(tp.food_price) AS avg_food_price,
	ROUND(AVG(tp.aver_wage)) AS aver_wage,
	ROUND(ts.GDP) AS rounded_GDP,
	ROUND((tp.aver_wage / LAG(tp.aver_wage) OVER (ORDER BY tp.payroll_year) - 1) * 100) AS aver_wage_growth_in_percent,
	ROUND((tp.food_price / LAG(tp.food_price) OVER (ORDER BY tp.payroll_year) - 1) * 100) AS food_price_growth_in_percent,
	ROUND((ts.GDP / LAG(ts.GDP) OVER (ORDER BY ts.year) - 1) * 100) AS GDP_growth_percentage
FROM
	t_alice_sera_project_sql_primary_final tp
LEFT JOIN t_alice_sera_project_sql_secondary_final ts ON
	tp.payroll_year = ts.year
WHERE
	ts.country = 'Czech Republic'
GROUP BY
	year;

-- pro lepší přehlednost výsledné tabulky

SELECT
	tp.payroll_year AS year,
	ROUND((tp.aver_wage / LAG(tp.aver_wage) OVER (ORDER BY tp.payroll_year) - 1) * 100) AS aver_wage_growth_in_percent,
	ROUND((tp.food_price / LAG(tp.food_price) OVER (ORDER BY tp.payroll_year) - 1) * 100) AS food_price_growth_in_percent,
	ROUND((ts.GDP / LAG(ts.GDP) OVER (ORDER BY ts.year) - 1) * 100) AS GDP_growth_percentage
FROM
	t_alice_sera_project_sql_primary_final tp
LEFT JOIN t_alice_sera_project_sql_secondary_final ts ON
	tp.payroll_year = ts.year
WHERE
	ts.country = 'Czech Republic'
GROUP BY
	year;

    
   