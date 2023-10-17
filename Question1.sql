-- 1. tabulka srovnávací min. a max. rok

SELECT
    industry_name,
    aver_wage,
    MIN(payroll_year) AS start_year,
    MAX(payroll_year) AS end_year
FROM t_alice_sera_project_sql_primary_final pt
WHERE industry_name IS NOT NULL
GROUP BY industry_name
HAVING MIN(aver_wage) <= MAX(aver_wage);


-- tabulka k detailnější analýze
SELECT
    industry_name,
    payroll_year,
    AVG(aver_wage) AS average_wage
FROM t_alice_sera_project_sql_primary_final pt
WHERE industry_name IS NOT NULL
GROUP BY industry_name, payroll_year
;