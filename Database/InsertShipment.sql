ALTER PROCEDURE InsertShipment
	@OrderId AS INT,
	@TrackingNumber AS NVARCHAR(50)
AS
BEGIN
	DECLARE @ShipmentId AS INT

	-- Calculate the hash code.	
	DECLARE @HashCode AS INT
	SET @HashCode = CHECKSUM(@TrackingNumber,
		(SELECT HashCode FROM [Order] WHERE OrderId = @OrderId))
	
	-- First try to find an existing record.
	SELECT @ShipmentId = ShipmentId
	FROM Shipment
	WHERE HashCode = @HashCode
	  AND OrderId = @OrderId
	  AND TrackingNumber = @TrackingNumber
	  
	-- If it doesn't exist yet, create it.
	IF (@ShipmentId IS NULL) BEGIN
		INSERT INTO Shipment
			(OrderId, TrackingNumber, HashCode)
			VALUES (@OrderId, @TrackingNumber, @HashCode)
		SET @ShipmentId = @@IDENTITY
	END
	
	RETURN @ShipmentId
END
GO
