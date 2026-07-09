--Array--
WITH skills AS (
    SELECT 'python' AS skill
    UNION ALL 
    SELECT 'sql'
    UNION ALL 
    SELECT 'r'
), skills_array AS (
    SELECT ARRAY_AGG(skill ORDER BY skill) AS skills
    FROM skills
)
SELECT 
    skills[1] AS first_skill,
    skills[2] AS second_skill,
    skills[3] AS third_skill
FROM skills_array;