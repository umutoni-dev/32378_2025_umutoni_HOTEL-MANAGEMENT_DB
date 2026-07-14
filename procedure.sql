CREATE PROCEDURE MakeReservation @GuestID INT,
@RoomID INT, @CheckInDate DATE, 
@CheckOutDate DATE, 
@NumberOfGuests INT AS BEGIN INSERT INTO Reservation 
( GuestID, RoomID, ReservationDate, CheckInDate, CheckOutDate,
ReservationStatus, NumberOfGuests ) VALUES 
( @GuestID, @RoomID, GETDATE(), @CheckInDate, @CheckOutDate, 'Booked',
@NumberOfGuests ); END;

CREATE PROCEDURE CheckInGuest @ReservationID
INT AS BEGIN INSERT INTO CheckInOut ( ReservationID, ActualCheckIn ) 
VALUES ( @ReservationID, GETDATE() );
UPDATE Reservation SET 
ReservationStatus = 'Checked In'
WHERE ReservationID = @ReservationID; END;

CREATE PROCEDURE CheckOutGuest @ReservationID 
INT AS BEGIN UPDATE CheckInOut SET ActualCheckOut = GETDATE() 
WHERE ReservationID = @ReservationID;
UPDATE Reservation SET ReservationStatus = 'Completed'
WHERE ReservationID = @ReservationID; END;

