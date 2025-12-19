{{ config(
    materialized='table'
) }}

SELECT DISTINCT
    s.store_id,
    d.dept_id,
    s.store_type,
    s.store_size,
    CURRENT_TIMESTAMP() AS insert_date,
    CURRENT_TIMESTAMP() AS update_date
FROM {{ ref('stg_stores') }} s
CROSS JOIN (
    SELECT DISTINCT dept_id 
    FROM {{ ref('stg_department') }}
) d