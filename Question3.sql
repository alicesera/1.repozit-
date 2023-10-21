SELECT
	food_category,
	ROUND(AVG((food_price - prev_price) / prev_price * 100), 2) AS average_annual_perc_increase
FROM
	(
	SELECT
		food_category,
		year,
		AVG(food_price) AS food_price,
		LAG(AVG(food_price), 1) OVER (PARTITION BY food_category
	ORDER BY
		year) AS prev_price
	FROM
		t_alice_sera_project_sql_primary_final
	WHERE
		year BETWEEN 2007 AND 2018
	GROUP BY
		food_category,
		year
) AS t1
GROUP BY
	food_category
ORDER BY
	average_annual_perc_increase
;