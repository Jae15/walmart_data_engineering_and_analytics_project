SELECT
    Store AS store_id,
    Type AS store_type,
    Size AS store_size
FROM {{ source('raw_data', 'STORES') }}