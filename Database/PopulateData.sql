DECLARE @Company AS INT
EXEC @Company = InsertCompany '74-3688377'

DECLARE @CustomerA AS INT
DECLARE @CustomerB AS INT
EXEC @CustomerA = InsertCustomer @Company, '6572'
EXEC @CustomerB = InsertCustomer @Company, '3989'

DECLARE @Order1 AS INT, @Order2 AS INT, @Order3 AS INT
EXEC @Order1 = InsertOrder @CustomerA, 'PO258'
EXEC @Order2 = InsertOrder @CustomerA, 'PO259'
EXEC @Order3 = InsertOrder @CustomerB, 'AN287568'
