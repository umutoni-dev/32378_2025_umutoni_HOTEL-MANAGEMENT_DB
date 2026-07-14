CREATE TRIGGER trg_PreventDoubleBooking ON
Reservation INSTEAD OF INSERT AS BEGIN IF
EXISTS( SELECT 1 FROM Reservation r JOIN 
inserted i ON r.RoomID = i.RoomID WHERE i.CheckInDate < r.CheckOutDate
AND i.CheckOutDate > r.CheckInDate )
BEGIN RAISERROR('Room already booked for selected dates.',16,1); 
RETURN; END INSERT INTO Reservation( GuestID, RoomID, ReservationDate,
CheckInDate, CheckOutDate, ReservationStatus, NumberOfGuests ) 
SELECT GuestID, RoomID, GETDATE(), CheckInDate, CheckOutDate, 'Booked', 
NumberOfGuests FROM inserted; END;


CREATE TRIGGER trg_CalculateBill ON Bill AFTER INSERT, 
UPDATE AS BEGIN UPDATE Bill 
SET TotalAmount = RoomCharges + ServiceCharges + TaxAmount - DiscountAmount
WHERE BillID IN ( SELECT BillID FROM inserted ); END;

CREATE TRIGGER trg_AuditReservation ON Reservation AFTER INSERT, 
UPDATE, DELETE AS BEGIN INSERT INTO AuditLog
( TableName, ActionPerformed, PerformedBy ) 
VALUES ( 'Reservation', 'Data Modified', SYSTEM_USER ); END;

