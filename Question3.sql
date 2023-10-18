SELECT
	t3.food_category,
	t3.year_relevant_to_price,
	ROUND(AVG(t3.food_price), 2) AS average_food_price,
	ROUND(((t3.food_price - t3.prev_year_price) / t3.prev_year_price) * 100, 2) AS annual_percentage_change
FROM
	(
	SELECT
		t1.food_category,
		t1.year_relevant_to_price,
		t1.food_price,
		(
		SELECT
			AVG(t2.food_price)
		FROM
			t_alice_sera_project_sql_primary_final t2
		WHERE
			t2.food_category = t1.food_category
			AND t2.year_relevant_to_price = t1.year_relevant_to_price - 1) AS prev_year_price
	FROM
		t_alice_sera_project_sql_primary_final t1
) AS t3
HAVING
	annual_percentage_change IS NOT NULL
ORDER BY
	t3.food_category,
	t3.year_relevant_to_price;



