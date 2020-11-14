SELECT
    __time,
    productid,
    workorderid,
    orderqty
FROM "workorder"
WHERE orderqty > 30000
ORDER BY __time

SELECT
    TIME_FLOOR("__time", 'P1M') AS "Time",
    COUNT(*) AS "Count"
FROM "workorder"
GROUP BY 1
ORDER BY "Time" ASC

SELECT 
    productid, 
    COUNT(workorderid) AS cnt, 
    SUM(orderqty) AS total 
FROM "workorder"
GROUP BY productid
ORDER BY total DESC
LIMIT 20