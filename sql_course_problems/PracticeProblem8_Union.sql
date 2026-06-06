/*
Find job psotings from the first quarter that have a salary greater than $70k
- Combine job posting tables for January, February, and March using UNION
- Get job postings with an average yearly salary > $70,000
*/
SELECT
    q1_job_postings.job_title_short,
    q1_job_postings.job_location,
    q1_job_postings.job_via,
    q1_job_postings.job_posted_date::DATE,
    q1_job_postings.salary_year_avg
FROM (
    SELECT *
    FROM    january_jobs
    UNION ALL
    SELECT *
    FROM    february_jobs
    UNION ALL
    SELECT *
    FROM    march_jobs
) AS q1_job_postings
WHERE 
    q1_job_postings.salary_year_avg > 70000 AND
    q1_job_postings.job_title_short = 'Data Analyst'
ORDER BY
    q1_job_postings.salary_year_avg DESC;