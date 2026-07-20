
--Build a flat skill table for co-workers to access job titles, salary info, and skills in one table
SELECT 
    jpf.job_id,
    jpf.job_title_short,
    jpf.salary_year_avg,
    ARRAY_AGG(sd.skills) AS skills_array
FROM job_postings_fact AS jpf 
LEFT JOIN skills_job_dim AS sjd 
    ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim AS sd 
    ON sd.skill_id = sjd.skill_id
GROUP BY ALL;




--Array of structs--
--Build a flat skill & type table for co-workers to access job titles, salary info, skills and type in one table

SELECT 
    jpf.job_id,
    jpf.job_title_short,
    jpf.salary_year_avg,
    ARRAY_AGG(
        STRUCT_PACK(
            skill_type := sd.type,
            skill_name := sd.skills
        )
    )
FROM job_postings_fact AS jpf 
LEFT JOIN skills_job_dim AS sjd 
    ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim AS sd 
    ON sd.skill_id = sjd.skill_id
GROUP BY ALL;