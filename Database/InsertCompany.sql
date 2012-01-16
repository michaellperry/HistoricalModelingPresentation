ALTER PROCEDURE InsertCompany
	@TaxIdNumber AS NVARCHAR(50)
AS
BEGIN
	DECLARE @CompanyId AS INT
	
	-- Calculate the hash code.	
	DECLARE @HashCode AS INT
	SET @HashCode = CHECKSUM(@TaxIdNumber)
	
	-- First try to find an existing record.
	SELECT @CompanyId = CompanyId
	FROM Company
	WHERE HashCode = @HashCode
	  AND TaxIdNumber = @TaxIdNumber
	  
	-- If it doesn't exist yet, create it.
	IF (@CompanyId IS NULL) BEGIN
		INSERT INTO Company
			(TaxIdNumber, HashCode)
			VALUES (@TaxIdNumber, @HashCode)
		SET @CompanyId = @@IDENTITY
	END
	
	RETURN @CompanyId
END
GO
