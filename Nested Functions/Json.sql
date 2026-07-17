
WITH raw_skill_json AS (
    SELECT
        '{"skill":"python","type":"programming"}'::JSON AS skill_json
)
SELECT
    STRUCT_PACK(
    skill := json_extract_string(skill_json, '$.skill'),
    type := json_extract_string(skill_json, '$.type')
    )
FROM raw_skill_json;