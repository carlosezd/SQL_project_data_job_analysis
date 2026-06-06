-- This query retrieves the names of companies that have job postings mentioning that no degree is required.
/*
SELECT name AS company_name
FROM company_dim
WHERE company_id IN(
    SELECT 
        company_id
    FROM 
        job_postings_fact
    WHERE 
        job_no_degree_mention = TRUE;
)
*/
-- CTE improvement version of the above query
/*
WITH company_job_counts AS (
    SELECT 
            company_id,
            COUNT(*) AS total_jobs
    FROM 
            job_postings_fact
    GROUP BY 
            company_id
)

SELECT 
    name AS company_name,
    company_job_counts.total_jobs
FROM company_dim
LEFT JOIN company_job_counts ON 
    company_job_counts.company_id = company_dim.company_id
WHERE total_jobs > 0
ORDER BY total_jobs DESC;
*/

/*
Practice Problem 1
Identify the top 5 skills that are most frequently mentioned 
in job postings. 
Use a subquery to find the skill IDs with 
the highest counts in the skills_job_dim table and 
then join this result with the skills_dim table to get the skill names.
*/
/*
Alternativa 1
WITH top_5_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM 
        skills_job_dim
    GROUP BY
        skill_id
)

SELECT 
    skills AS skill_name,
    skill_count
FROM skills_dim
LEFT JOIN top_5_skills ON 
    top_5_skills.skill_id = skills_dim.skill_id
ORDER BY skill_count DESC
LIMIT 5;
*/


/*
Alternativa 2
SELECT 
    skills_dim.skills AS skill_name,
    top_skills.skill_count
FROM 
    skills_dim
INNER JOIN (
    -- Subconsulta: Encuentra los 5 IDs de habilidades más repetidos
    SELECT 
        skill_id,
        COUNT(*) AS skill_count
    FROM 
        skills_job_dim
    GROUP BY 
        skill_id
    ORDER BY 
        skill_count DESC
    LIMIT 5
) AS top_skills ON skills_dim.skill_id = top_skills.skill_id
ORDER BY 
    top_skills.skill_count DESC;
*/

/*
Practice Problem 2
Determine the size category ('Small', 'Medium', or 'Large') 
for each company by first identifying the number of job postings 
they have. Use a subquery to calculate the total job postings per 
company. A company is considered 'Small' if it has less than 10 job 
postings, 'Medium' if the number of job postings is between 10 and 50, 
and 'Large' if it has more than 50 job postings. 
Implement a subquery to aggregate job counts per company 
before classifying them based on size.
*/

/*
SELECT
    company_dim.name AS company_name,
    COUNT(job_postings_fact.job_id) AS total_job_postings,
    CASE 
        WHEN COUNT(job_postings_fact.job_id) < 10 THEN 'Small'
        WHEN COUNT(job_postings_fact.job_id) BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM
    job_postings_fact
LEFT JOIN company_dim ON 
    company_dim.company_id = job_postings_fact.company_id
GROUP BY 
    company_dim.name
ORDER BY 
    total_job_postings DESC;
*/

SELECT
    company_job_counts.company_id,
    CASE 
        WHEN company_job_counts.total_job_postings < 10 THEN 'Small'
        WHEN company_job_counts.total_job_postings BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size,
    company_job_counts.total_job_postings
FROM (-- Subconsulta: Cuenta el total de ofertas por cada empresa
    SELECT
        company_id,
        COUNT(*) AS total_job_postings
    FROM
        job_postings_fact
GROUP BY
        company_id
) AS company_job_counts
