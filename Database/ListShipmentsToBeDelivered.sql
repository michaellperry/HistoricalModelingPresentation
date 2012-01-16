SELECT ShipmentId, CustomerNumber, CustomerPONumber, TrackingNumber
FROM Shipment
JOIN [Order] ON Shipment.OrderId = [Order].OrderId
JOIN Customer ON [Order].CustomerId = Customer.CustomerId
WHERE CompanyId = 1
  AND NOT EXISTS
  (SELECT DeliveryId FROM Delivery
   WHERE Delivery.ShipmentId = Shipment.ShipmentId)