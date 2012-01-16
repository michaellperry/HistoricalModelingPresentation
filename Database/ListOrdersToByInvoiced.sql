SELECT OrderId, CustomerNumber, CustomerPONumber
FROM [Order]
JOIN Customer ON [Order].CustomerId = Customer.CustomerId
WHERE CompanyId = 1
  AND NOT EXISTS
  (SELECT InvoiceId FROM Invoice
   WHERE Invoice.OrderId = [Order].OrderId)