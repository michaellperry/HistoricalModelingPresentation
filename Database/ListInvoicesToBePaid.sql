SELECT InvoiceId, CustomerNumber, CustomerPONumber, InvoiceNumber
FROM Invoice
JOIN [Order] ON Invoice.OrderId = [Order].OrderId
JOIN Customer ON [Order].CustomerId = Customer.CustomerId
WHERE CompanyId = 1
  AND NOT EXISTS
  (SELECT PaymentId FROM Payment
   WHERE Payment.InvoiceId = Invoice.InvoiceId)