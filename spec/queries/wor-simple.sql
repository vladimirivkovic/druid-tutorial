SELECT
  "workorderid",
  COUNT(*) AS "Count"
FROM "wo_routing"
GROUP BY 1
ORDER BY "Count" DESC
LIMIT 10


SELECT
  "locationname",
  COUNT(*) AS "Count"
FROM "wo_routing"
GROUP BY 1
ORDER BY "Count" DESC


SELECT
  "productname",
  COUNT(*) AS "Count"
FROM "wo_routing"
WHERE locationname = 'Paint'
GROUP BY 1
ORDER BY "Count" DESC


SELECT
  "productname",
  SUM("actualresourcehrs") AS "total_hours"
FROM "wo_routing"
GROUP BY 1
ORDER BY "total_hours" DESC
LIMIT 10