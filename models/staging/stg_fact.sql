SELECT
    Store AS store_id,
    Date AS sale_date,
    CASE WHEN Temperature = 'NA' THEN NULL ELSE Temperature::FLOAT END AS temperature,
    CASE WHEN Fuel_Price = 'NA' THEN NULL ELSE Fuel_Price::FLOAT END AS fuel_price,
    CASE WHEN MarkDown1 = 'NA' THEN NULL ELSE MarkDown1::FLOAT END AS markdown1,
    CASE WHEN MarkDown2 = 'NA' THEN NULL ELSE MarkDown2::FLOAT END AS markdown2,
    CASE WHEN MarkDown3 = 'NA' THEN NULL ELSE MarkDown3::FLOAT END AS markdown3,
    CASE WHEN MarkDown4 = 'NA' THEN NULL ELSE MarkDown4::FLOAT END AS markdown4,
    CASE WHEN MarkDown5 = 'NA' THEN NULL ELSE MarkDown5::FLOAT END AS markdown5,
    CASE WHEN CPI = 'NA' THEN NULL ELSE CPI::FLOAT END AS cpi,
    CASE WHEN Unemployment = 'NA' THEN NULL ELSE Unemployment::FLOAT END AS unemployment,
    IsHoliday AS is_holiday
FROM {{ source('raw_data', 'FACT') }}