SELECT
    food_category,
    price_unit,
    ROUND(AVG(CASE WHEN payroll_year = '2006' THEN aver_wage ELSE NULL END)) AS aver_wage_first_comp_period,
    ROUND(AVG(CASE WHEN payroll_year = '2018' THEN aver_wage ELSE NULL END)) AS aver_wage_last_comp_period,
    ROUND(AVG(CASE WHEN payroll_year = '2006' THEN food_price ELSE NULL END)) AS avg_food_price_2006,
    ROUND(AVG(CASE WHEN payroll_year = '2018' THEN food_price ELSE NULL END)) AS avg_food_price_2018,
    ROUND(AVG(CASE WHEN payroll_year = '2006' THEN aver_wage ELSE NULL END) / AVG(CASE WHEN payroll_year = '2006' THEN food_price ELSE NULL END)) AS number_of_pieces_2006,
    ROUND(AVG(CASE WHEN payroll_year = '2018' THEN aver_wage ELSE NULL END) / AVG(CASE WHEN payroll_year = '2018' THEN food_price ELSE NULL END)) AS number_of_pieces_2018
FROM t_alice_sera_project_sql_primary_final
WHERE food_category IN ('Chléb konzumní kmínový', 'Mléko polotučné pasterované')
GROUP BY food_category, price_unit;
