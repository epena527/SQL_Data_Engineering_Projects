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

--Array of Struct--
SELECT [
{ skill: 'python', type: 'programming'}, 
{ skill: 'sql', type: 'query_language'}

] AS skills_array_of_structures;


WITH skill_table AS (
SELECT 'python' AS skills, 'programming' AS types
UNION ALL 
SELECT 'sql', 'query_language'
UNION ALL 
SELECT 'r', 'programming'
), skills_array_struct AS (
SELECT 
    ARRAY_AGG(
        STRUCT_PACK(
        skill := skills,
        type := types
    )
) array_struct
FROM skill_table
)
SELECT * FROM skills_array_struct;