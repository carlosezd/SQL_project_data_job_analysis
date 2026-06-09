/*
Questions to answer:
1. What are the top-paying jobs for my role "data analyst"?
2. What are the skills required for these top-paying roles?
3. What are the most in-demand skills for my role?
4. What are the top skills based on salary for my role?
5. What are the most optimal skills to learn? (Optimal = High Demand + High Paying)
*/

/*Question: What are the top-paying data analyst jobs?

Deliverables:
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focus on job postings with a specified salary (remove null values).
- Why are we doing this? It will offer insights into the final problem of finding the most optimal skills and optimal roles to pursue as a data analyst.
*/

-- Q1

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON
    job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

