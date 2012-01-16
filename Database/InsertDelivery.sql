ALTER PROCEDURE InsertDelivery
	@ShipmentId AS INT,
	@DeliveryDateTime AS DATETIME
AS
BEGIN
	DECLARE @DeliveryId AS INT

	-- Calculate the hash code.	
	DECLARE @HashCode AS INT
	SET @HashCode = CHECKSUM(@DeliveryDateTime,
		(SELECT HashCode FROM Shipment WHERE ShipmentId = @ShipmentId))
	
	-- First try to find an existing record.
	SELECT @DeliveryId = DeliveryId
	FROM Delivery
	WHERE HashCode = @HashCode
	  AND ShipmentId = @ShipmentId
	  AND DeliveryDateTime = @DeliveryDateTime
	  
	-- If it doesn't exist yet, create it.
	IF (@DeliveryId IS NULL) BEGIN
		INSERT INTO Delivery
			(ShipmentId, DeliveryDateTime, HashCode)
			VALUES (@ShipmentId, @DeliveryDateTime, @HashCode)
		SET @DeliveryId = @@IDENTITY
	END
	
	RETURN @DeliveryId
END
GO
