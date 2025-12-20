SELECT
    Store AS store_id,
    Dept AS dept_id,
    Date AS sale_date,
    Weekly_Sales AS weekly_sales,
    IsHoliday AS is_holiday
FROM {{ source('raw_data', 'DEPARTMENT') }}