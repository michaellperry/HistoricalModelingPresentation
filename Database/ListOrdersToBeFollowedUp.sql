SELECT DeliveryId, PaymentId, CustomerNumber, CustomerPONumber, InvoiceNumber, PaymentDateTime, TrackingNumber, DeliveryDateTime
FROM Delivery
JOIN Shipment ON Delivery.ShipmentId = Shipment.ShipmentId,
	 Payment
JOIN Invoice ON Payment.InvoiceId = Invoice.InvoiceId
JOIN [Order] ON Invoice.OrderId = [Order].OrderId
JOIN Customer ON [Order].CustomerId = Customer.CustomerId
WHERE CompanyId = 1
  AND Shipment.OrderId = [Order].OrderId
  AND NOT EXISTS
	(SELECT FollowUpId
	 FROM FollowUp
	 WHERE FollowUp.DeliveryId = Delivery.DeliveryId
	   AND FollowUp.PaymentId = Payment.PaymentId)