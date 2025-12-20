{{ config(
    materialized='incremental',
    unique_key='date_id'
) }}

SELECT DISTINCT
    TO_CHAR(sale_date, 'YYYYMMDD')::INT AS date_id,
    sale_date AS store_date,
    is_holiday,
    CURRENT_TIMESTAMP() AS insert_date,
    CURRENT_TIMESTAMP() AS update_date
FROM {{ ref('stg_department') }}

{% if is_incremental() %}
  WHERE sale_date > (SELECT MAX(store_date) FROM {{ this }})
{% endif %}