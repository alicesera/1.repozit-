CREATE TABLE IF NOT EXISTS t_Alice_Sera_project_SQL_primary_final AS (
SELECT 
	cpc.name AS food_category,
	cpc.price_value,
	cpc.price_unit,
	cp.value AS food_price,
	year(cp.date_from) AS year_relevant_to_price,
	cpib.name AS industry_name,
	cpay.payroll_quarter,
	cpay.payroll_year,
	cpay.value AS aver_wage,
	cpu.name AS currency
FROM czechia_price cp 
JOIN czechia_payroll cpay 
	ON year(cp.date_from) = cpay.payroll_year
LEFT JOIN czechia_payroll_industry_branch cpib 
	ON cpay.industry_branch_code  = cpib.code 
LEFT JOIN czechia_price_category cpc 
	ON cpc.code = cp.category_code 
LEFT JOIN czechia_payroll_unit cpu
	ON cpu.code = cpay.unit_code
WHERE 
	cpay.value_type_code = 5958 AND cpay.calculation_code = 200)
;




