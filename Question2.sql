
SELECT 
    food_category,
    price_unit,
    food_price,
    MIN(payroll_year) AS first_comp_period,
    MAX(payroll_year) AS last_comp_period,
    ROUND(AVG(CASE WHEN payroll_year = '2006' THEN aver_wage ELSE NULL END)) AS aver_wage_first_comp_period,
    ROUND(AVG(CASE WHEN payroll_year = '2018' THEN aver_wage ELSE NULL END)) AS aver_wage_last_comp_period,
    ROUND(AVG(CASE WHEN payroll_year = '2006' THEN aver_wage ELSE NULL END) / food_price) AS number_of_pieces_2006,
    ROUND(AVG(CASE WHEN payroll_year = '2018' THEN aver_wage ELSE NULL END) / food_price) AS number_of_pieces_2018
FROM t_alice_sera_project_sql_primary_final
WHERE food_category = 'Chléb konzumní kmínový'
UNION
SELECT 
    food_category,
    price_unit,
    food_price,
    MIN(payroll_year) AS first_comp_period,
    MAX(payroll_year) AS last_comp_period,
    ROUND(AVG(CASE WHEN payroll_year = '2006' THEN aver_wage ELSE NULL END)) AS aver_wage_first_comp_period,
    ROUND(AVG(CASE WHEN payroll_year = '2018' THEN aver_wage ELSE NULL END)) AS aver_wage_last_comp_period,
    ROUND(AVG(CASE WHEN payroll_year = '2006' THEN aver_wage ELSE NULL END) / food_price) AS number_of_pieces2006,
    ROUND(AVG(CASE WHEN payroll_year = '2018' THEN aver_wage ELSE NULL END) / food_price) AS number_of_pieces_2018
FROM t_alice_sera_project_sql_primary_final
WHERE food_category = 'Mléko polotučné pasterované';



