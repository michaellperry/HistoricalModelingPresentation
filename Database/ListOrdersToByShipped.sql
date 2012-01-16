SELECT OrderId, CustomerNumber, CustomerPONumber
FROM [Order]
JOIN Customer ON [Order].CustomerId = Customer.CustomerId
WHERE CompanyId = 1
  AND NOT EXISTS
  (SELECT ShipmentId FROM Shipment
   WHERE Shipment.OrderId = [Order].OrderId)