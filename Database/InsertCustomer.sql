ALTER PROCEDURE InsertCustomer
	@CompanyId AS INT,
	@CustomerNumber AS NVARCHAR(50)
AS
BEGIN
	DECLARE @CustomerId AS INT

	-- Calculate the hash code.	
	DECLARE @HashCode AS INT
	SET @HashCode = CHECKSUM(@CustomerNumber,
		(SELECT HashCode FROM Company WHERE CompanyId = @CompanyId))
	
	-- First try to find an existing record.
	SELECT @CustomerId = CustomerId
	FROM Customer
	WHERE HashCode = @HashCode
	  AND CompanyId = @CompanyId
	  AND CustomerNumber = @CustomerNumber
	  
	-- If it doesn't exist yet, create it.
	IF (@CustomerId IS NULL) BEGIN
		INSERT INTO Customer
			(CompanyId, CustomerNumber, HashCode)
			VALUES (@CompanyId, @CustomerNumber, @HashCode)
		SET @CustomerId = @@IDENTITY
	END
	
	RETURN @CustomerId
END
GO
