/*Create a new column category with a CASE expression*/
/*
SELECT
    COUNT(job_id) AS job_count,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst'

GROUP BY 
    location_category;
*/

-- Practice Problem
/*Categorize salaries form each job posting.*/
SELECT
    job_title_short,
    salary_year_avg,
    CASE
        WHEN salary_year_avg < 50000 THEN 'Low'
        WHEN salary_year_avg BETWEEN 50000 AND 100000 THEN 'Standard'
        ELSE 'High'
    END AS salary_category
FROM
    job_postings_fact
WHERE
    NOT salary_year_avg IS NULL
    AND job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC;