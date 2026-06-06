WITH q1 AS (
    SELECT
        job_id,
        job_title_short,
        salary_year_avg
    FROM
        january_jobs

    UNION -- get jobs from february, but only unique records (no duplicates)

    SELECT
        job_id,
        job_title_short,
        salary_year_avg
    FROM
        february_jobs

    UNION -- get jobs from march, but only unique records (no duplicates)

    SELECT
        job_id,
        job_title_short,
        salary_year_avg
    FROM
        march_jobs
)

SELECT
    q1.job_id,
    skills.skills AS skill_name,
    skills.type AS skill_type,
    q1.salary_year_avg AS salary
FROM
    q1
INNER JOIN skills_job_dim AS skills_to_job
    ON skills_to_job.job_id = q1.job_id
INNER JOIN skills_dim AS skills
    ON skills.skill_id = skills_to_job.skill_id
WHERE
    q1.salary_year_avg > 70000
ORDER BY
    q1.salary_year_avg DESC

