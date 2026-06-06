-- Convertir un timestamp a una fecha
/*
SELECT 
    job_title_short AS job_title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
    EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM
    job_postings_fact
LIMIT 5;
*/
-- Analisis de tendencias de empleo por mes
/*
SELECT
    COUNT(job_id) AS count_jobs,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short IN ('Data Analyst')
GROUP BY
    month
ORDER BY
    count_jobs DESC;
*/
-- PRACTICE PROBLEM 1
/*Encuentra el promedio de salario Anual y por hora,
para los trabajos publicados despues del primero de junio del 2023*/
/*
SELECT
    AVG(salary_year_avg) AS avg_salary_year,
    AVG(salary_hour_avg) AS avg_salary_hour
FROM
    job_postings_fact
WHERE
    job_posted_date > '2023-06-01';
*/
-- PRACTICE PROBLEM 2
/*Cuenta el número de trabajos publicados por cada mes en 2023.
Ajusta la columna job_posted_date a la zona horaria de 'America/New_York' antes de extraer el mes.
La zona horaria actual es 'UTC'
*/
/*
SELECT
    COUNT(job_id) AS job_count,
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS ny_month
FROM
    job_postings_fact
GROUP BY
    ny_month;
*/

-- PRACTICE PROBLEM 3
/* Encuentra las compañias (incluye el nombre de la compañia) que ofrecieron
trabajos con un seguro de salud, fueron publicados en el segundo trimestre del 2023
*/
/*
SELECT
    companies.name AS company_name,
    job_postings.job_health_insurance AS health_insurance,
    EXTRACT(QUARTER FROM job_postings.job_posted_date) AS date_quarter,
    EXTRACT(YEAR FROM job_postings.job_posted_date) AS date_year
FROM
    job_postings_fact AS job_postings
LEFT JOIN company_dim AS companies
    ON job_postings.company_id = companies.company_id
WHERE
    job_postings.job_health_insurance = TRUE
    AND EXTRACT(QUARTER FROM job_postings.job_posted_date) = 2
    AND EXTRACT(YEAR FROM job_postings.job_posted_date) = 2023;
*/
