ALTER PROCEDURE InsertFollowUp
	@DeliveryId AS INT,
	@PaymentId AS INT,
	@FollowUpDateTime AS DATETIME
AS
BEGIN
	DECLARE @FollowUpId AS INT

	-- Calculate the hash code.	
	DECLARE @HashCode AS INT
	SET @HashCode = CHECKSUM(@FollowUpDateTime,
		(SELECT HashCode FROM Delivery WHERE DeliveryId = @DeliveryId),
		(SELECT HashCode FROM Payment WHERE PaymentId = @PaymentId))
	
	-- First try to find an existing record.
	SELECT @FollowUpId = FollowUpId
	FROM FollowUp
	WHERE HashCode = @HashCode
	  AND DeliveryId = @DeliveryId
	  AND PaymentId = @PaymentId
	  AND FollowUpDateTime = @FollowUpDateTime
	  
	-- If it doesn't exist yet, create it.
	IF (@FollowUpId IS NULL) BEGIN
		INSERT INTO FollowUp
			(DeliveryId, PaymentId, FollowUpDateTime, HashCode)
			VALUES (@DeliveryId, @PaymentId, @FollowUpDateTime, @HashCode)
		SET @FollowUpId = @@IDENTITY
	END
	
	RETURN @FollowUpId
END
GO
