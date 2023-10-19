WITH t_price_wage AS (
    SELECT
        food_category,
        payroll_year AS year,
        AVG(food_price) AS average_food_price,
        LAG(AVG(food_price), 1) OVER (PARTITION BY food_category ORDER BY payroll_year) AS prev_year_avg_food_price,
        AVG(aver_wage) AS average_wage,
        LAG(AVG(aver_wage), 1) OVER (PARTITION BY food_category ORDER BY payroll_year) AS prev_year_avg_wage
    FROM
        t_alice_sera_project_sql_primary_final
    WHERE
        payroll_year BETWEEN 2007 AND 2018
    GROUP BY
        year, food_category
)
SELECT
    food_category,
    prev_year_avg_food_price,
    prev_year_avg_wage,
	year,
	ROUND(average_food_price, 2) AS average_food_price,
	ROUND(average_wage, 2) AS average_wage,
	ROUND(((average_food_price - prev_year_avg_food_price) / prev_year_avg_food_price) * 100, 2) AS food_price_growth,
	ROUND(((average_wage - prev_year_avg_wage) / prev_year_avg_wage) * 100, 2) AS wage_growth
FROM
	t_price_wage
WHERE
	(((average_food_price - prev_year_avg_food_price) / prev_year_avg_food_price) * 100) > (((average_wage - prev_year_avg_wage) / prev_year_avg_wage) * 110)
GROUP BY
	food_category;
	

