ALTER PROCEDURE InsertInvoice
	@OrderId AS INT,
	@InvoiceNumber AS NVARCHAR(50)
AS
BEGIN
	DECLARE @InvoiceId AS INT

	-- Calculate the hash code.	
	DECLARE @HashCode AS INT
	SET @HashCode = CHECKSUM(@InvoiceNumber,
		(SELECT HashCode FROM [Order] WHERE OrderId = @OrderId))
	
	-- First try to find an existing record.
	SELECT @InvoiceId = InvoiceId
	FROM Invoice
	WHERE HashCode = @HashCode
	  AND OrderId = @OrderId
	  AND InvoiceNumber = @InvoiceNumber
	  
	-- If it doesn't exist yet, create it.
	IF (@InvoiceId IS NULL) BEGIN
		INSERT INTO Invoice
			(OrderId, InvoiceNumber, HashCode)
			VALUES (@OrderId, @InvoiceNumber, @HashCode)
		SET @InvoiceId = @@IDENTITY
	END
	
	RETURN @InvoiceId
END
GO
