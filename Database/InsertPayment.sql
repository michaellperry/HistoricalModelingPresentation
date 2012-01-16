ALTER PROCEDURE InsertPayment
	@InvoiceId AS INT,
	@PaymentDateTime AS DATETIME
AS
BEGIN
	DECLARE @PaymentId AS INT

	-- Calculate the hash code.	
	DECLARE @HashCode AS INT
	SET @HashCode = CHECKSUM(@PaymentDateTime,
		(SELECT HashCode FROM Invoice WHERE InvoiceId = @InvoiceId))
	
	-- First try to find an existing record.
	SELECT @PaymentId = PaymentId
	FROM Payment
	WHERE HashCode = @HashCode
	  AND InvoiceId = @InvoiceId
	  AND PaymentDateTime = @PaymentDateTime
	  
	-- If it doesn't exist yet, create it.
	IF (@PaymentId IS NULL) BEGIN
		INSERT INTO Payment
			(InvoiceId, PaymentDateTime, HashCode)
			VALUES (@InvoiceId, @PaymentDateTime, @HashCode)
		SET @PaymentId = @@IDENTITY
	END
	
	RETURN @PaymentId
END
GO
