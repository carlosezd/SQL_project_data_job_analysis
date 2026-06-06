# Análisis del Mercado Laboral para Analistas de Datos

## Introducción
Sumérgete en el mercado laboral de los datos enfocándote en los roles de Analista de Datos [2]. Este proyecto explora los **trabajos mejor pagados**, las **habilidades con mayor demanda** y el punto exacto donde la alta demanda se encuentra con el alto salario en el campo de la analítica de datos [2]. 

CORREGIR AQUI >>
Puedes revisar las consultas SQL completas en esta carpeta: [Consultas SQL](/project_sql) [7].

## Contexto
El objetivo de este proyecto es ayudar a quienes buscan empleo a encontrar las mejores oportunidades [3]. Para lograrlo, respondimos 5 preguntas clave sobre el mercado laboral:
1. ¿Cuáles son los 10 trabajos remotos mejor pagados?
2. ¿Qué habilidades requieren esos roles principales?
3. ¿Cuáles son las habilidades más demandadas en general?
4. ¿Qué habilidades están asociadas con los salarios más altos?
5. ¿Cuáles son las habilidades más óptimas para aprender? [3]

## Herramientas Utilizadas
Para llevar a cabo este análisis, utilicé las siguientes herramientas clave:
* **SQL:** Para consultar y manipular la base de datos [3].
* **Postgres:** Como sistema de gestión de bases de datos relacionales [3].
* **VS Code:** Como editor de código [3].
* **Git y GitHub:** Para el control de versiones y compartir mi código [3].

## El Análisis
### 1. Los trabajos remotos mejor pagados
Para identificar los roles con mejor remuneración, filtramos las publicaciones de trabajo remoto para Analistas de Datos que incluían información salarial [4].

```sql
SELECT
    job_title_short,
    job_location,
    salary_year_average
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_average IS NOT NULL
ORDER BY
    salary_year_average DESC
LIMIT 10;
```
## Hallazgos
Los resultados muestran una gran presencia de empresas tecnológicas e indican que los trabajos de analista de datos mejor pagados de forma remota superan ampliamente el promedio del mercado.

## Lo que aprendí
El desarrollo de este proyecto me permitió mejorar considerablemente mis habilidades técnicas. 
Específicamente reforcé:
La escritura de consultas complejas de datos y el uso de agregaciones avanzadas.

La aplicación de verdadera "magia analítica" para resolver problemas del mundo real.

## Conclusiones
**Insights Principales**
- El dominio de SQL y Python: Son habilidades fundamentales que aparecen en casi todas las ofertas de alto nivel.
- Habilidades Especializadas: Herramientas de Big Data, Machine Learning y Cloud Computing son los principales impulsores de los salarios más altos.

**Pensamientos Finales**
- Realizar este análisis me ayudó a construir y afianzar mis habilidades en SQL.
- Este tipo de proyectos prácticos proporciona una visión muy clara no solo de cómo manipular datos, sino de cómo extraer valor real para tomar decisiones de carrera.
