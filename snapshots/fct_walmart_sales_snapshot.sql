{% snapshot fct_walmart_sales_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='store_id || \'-\' || dept_id || \'-\' || sale_date',
      strategy='check',
      check_cols=['store_weekly_sales', 'fuel_price', 'store_temperature', 'unemployment', 'cpi', 'markdown1', 'markdown2', 'markdown3', 'markdown4', 'markdown5'],
    )
}}

SELECT * FROM {{ ref('fct_walmart_sales') }}

{% endsnapshot %}