--STRUCT--
SELECT { skill: 'python', type:'programming',} AS skill_struct;

WITH skill_struct AS(
    SELECT 
        STRUCT_PACK(
            skill := 'python',
            type := 'programming'
        ) AS s
)
SELECT 
    s.skill,
    s.type
FROM skill_struct;


WITH skill_table AS (
SELECT 'python' AS skills, 'programming' AS types
UNION ALL 
SELECT 'sql', 'query_language'
UNION ALL 
SELECT 'r', 'programming'
)
SELECT 
    STRUCT_PACK(
        skill := skills,
        type := types
    )
FROM skill_table;