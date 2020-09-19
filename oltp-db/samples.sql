SELECT * FROM production.workorder;

SELECT 
    workOrder.workOrderId, product.name, location.name, workOrder.orderQty,
    operationSequence, plannedCost, actualCost, actualStartDate, actualResourceHrs  
    FROM production.workOrderRouting wor
        JOIN production.location ON wor.locationId = location.locationId
        JOIN production.product ON wor.productId = product.productId
        JOIN production.workOrder ON wor.workOrderId = workOrder.workOrderId
    LIMIT 10;

SELECT 
    billOfMaterialsId, bomLevel, um.name AS unitMeasure,
    p1.name AS productAssembly, p2.name AS component
    FROM production.billOfMaterials bom
        LEFT JOIN production.product p1 ON bom.productAssemblyId = p1.productId
        LEFT JOIN production.product p2 ON bom.componentId = p2.productId
        LEFT JOIN production.unitMeasure um ON bom.unitMeasureCode = um.unitMeasureCode
    -- WHERE p2.name IS NOT NULL and p1.name IS NOT NULL
    LIMIT 10;
        