SELECT
  "subcategory",
  "category",
  SUM("orderqty_sum") AS "orderqty_total"
FROM "workorder2_rollup"
GROUP BY 1, 2
ORDER BY "orderqty_total" DESC


SELECT
  "subcategory",
  SUM("scrappedqty_sum")/SUM("orderqty_sum") AS "scrap_rate"
FROM "workorder2_rollup"
GROUP BY 1
ORDER BY "scrap_rate" DESC