CREATE FUNCTION CalculateTotalBill ( @RoomCharges DECIMAL(10,2),
@ServiceCharges DECIMAL(10,2), @TaxAmount DECIMAL(10,2), 
@DiscountAmount DECIMAL(10,2) )
RETURNS DECIMAL(10,2) AS BEGIN RETURN 
( @RoomCharges + @ServiceCharges + @TaxAmount - @DiscountAmount ); 
END;

