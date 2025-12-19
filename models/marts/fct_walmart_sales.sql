{{ config(
    materialized='table'
) }}

SELECT
    d.store_id,
    d.dept_id,
    d.sale_date,
    s.store_size,
    d.weekly_sales AS store_weekly_sales,
    f.fuel_price,
    f.temperature AS store_temperature,
    f.unemployment,
    f.cpi,
    f.markdown1,
    f.markdown2,
    f.markdown3,
    f.markdown4,
    f.markdown5,
    CURRENT_TIMESTAMP() AS insert_date,
    CURRENT_TIMESTAMP() AS update_date
FROM {{ ref('stg_department') }} d
JOIN {{ ref('stg_fact') }} f 
    ON d.store_id = f.store_id 
    AND d.sale_date = f.sale_date
JOIN {{ ref('stg_stores') }} s 
    ON d.store_id = s.store_id