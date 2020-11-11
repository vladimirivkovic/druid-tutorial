SELECT * 
FROM "workorder_rollup"
LIMIT 10

SELECT * 
FROM "workorder_rollup"
WHERE "count" > 1
LIMIT 10

SELECT
  "productid",
  SUM("scrappedqty_sum") AS "scrappedqty_total"
FROM "workorder_rollup"
GROUP BY 1
ORDER BY "scrappedqty_total" DESC

SELECT
  TIME_FLOOR(__time, 'P1M') AS "month",
  SUM("orderqty_sum") AS "orderqty_total",
  SUM("scrappedqty_sum") AS "scrappedqty_total"
FROM "workorder_rollup"
GROUP BY 1
ORDER BY "orderqty_total" DESC

SELECT
  TIME_FLOOR(__time, 'P7D') AS "week",
  SUM("scrappedqty_sum")/SUM("orderqty_sum") AS "scrapped_ratio"
FROM "workorder_rollup"
GROUP BY 1
ORDER BY "scrapped_ratio" DESC

