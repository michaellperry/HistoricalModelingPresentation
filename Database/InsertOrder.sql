ALTER PROCEDURE InsertOrder
	@CustomerId AS INT,
	@CustomerPONumber AS NVARCHAR(50)
AS
BEGIN
	DECLARE @OrderId AS INT

	-- Calculate the hash code.	
	DECLARE @HashCode AS INT
	SET @HashCode = CHECKSUM(@CustomerPONumber,
		(SELECT HashCode FROM Customer WHERE CustomerId = @CustomerId))
	
	-- First try to find an existing record.
	SELECT @OrderId = OrderId
	FROM [Order]
	WHERE HashCode = @HashCode
	  AND CustomerId = @CustomerId
	  AND CustomerPONumber = @CustomerPONumber
	  
	-- If it doesn't exist yet, create it.
	IF (@OrderId IS NULL) BEGIN
		INSERT INTO [Order]
			(CustomerId, CustomerPONumber, HashCode)
			VALUES (@CustomerId, @CustomerPONumber, @HashCode)
		SET @OrderId = @@IDENTITY
	END
	
	RETURN @OrderId
END
GO
