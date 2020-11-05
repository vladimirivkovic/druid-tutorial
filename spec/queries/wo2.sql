SELECT
  "productname",
  COUNT(*) AS "Count"
FROM "workorder2"
WHERE category = 'Bikes'
GROUP BY 1
ORDER BY "Count" DESC;

SELECT
  "subcategory",
  "category", COUNT(*) AS "Count"
FROM "workorder2"
GROUP BY 1, 2
ORDER BY "Count" DESC;

SELECT
  "productname",
  SUM("orderqty") AS "qty"
FROM "workorder2"
GROUP BY 1
ORDER BY "qty" DESC
LIMIT 10;