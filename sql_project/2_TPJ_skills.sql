/*
Questions to answer:
1. What are the top-paying jobs for my role "data analyst"?
2. What are the skills required for these top-paying roles?
3. What are the most in-demand skills for my role?
4. What are the top skills based on salary for my role?
5. What are the most optimal skills to learn? (Optimal = High Demand + High Paying)
*/

/*
Question: What skills are required for the top-paying data analyst jobs?

Deliverables:
- Use the top 10 highest-paying Data Analyst jobs from the previous query.
- Combine and join these top roles with the skills data.
- Why are we doing this? To identify the top skills inside of these roles that are the main drivers behind their high salaries.
*/

-- Q2
WITH top_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
    LIMIT 10
)

SELECT 
    top_jobs.*,
    skills.skills AS skill_name
FROM 
    top_jobs
INNER JOIN skills_job_dim AS skills_to_job ON
    skills_to_job.job_id = top_jobs.job_id
INNER JOIN skills_dim AS skills ON
    skills.skill_id = skills_to_job.skill_id
ORDER BY
    top_jobs.salary_year_avg DESC;

/*
1. Resumen de Salarios
En las ofertas analizadas, los salarios son bastante atractivos:
Salario promedio anual: $207,320 USD.
Rango salarial: Va desde un mínimo de $184,000 USD hasta un máximo de $255,829.50 USD.
La mitad de los puestos ofrecen más de $197,154.50 USD.
2. Habilidades Más Demandadas
Las herramientas fundamentales en el área de datos lideran indiscutiblemente la lista de requisitos:
SQL es la habilidad más solicitada (mencionada en 8 ofertas).
Le siguen muy de cerca Python (7 menciones) y Tableau (6 menciones).
Otras herramientas importantes incluyen R, Snowflake, Pandas y Excel.
Aquí puedes ver la distribución de estas habilidades:
3. Habilidades Mejor Pagadas
Curiosamente, las habilidades más comunes no son necesariamente las que reportan los salarios promedios más altos. Las herramientas y ecosistemas especializados o de Big Data dominan esta lista:
Habilidades como Jupyter, PySpark, Databricks y Powerpoint están asociadas con el salario promedio más alto del conjunto de datos ($255,829.50 USD). Este pico se debe principalmente a un puesto directivo muy bien remunerado ("Associate Director- Data Insights" en AT&T).
Hadoop, Azure, Power BI y AWS también figuran entre las tecnologías vinculadas a sueldos superiores a los $222,000 USD.
4. Empresas con Más Ofertas
En esta muestra reducida (8 posiciones únicas en total), la empresa SmartAsset fue la única que publicó más de una oferta de empleo (2 publicaciones). Otras empresas en la lista incluyen AT&T, Pinterest, y UCLA Health.

*/