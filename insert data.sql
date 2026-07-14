INSERT INTO RoomType(TypeName,Description,PricePerNight) 
VALUES ('Standard Room','Standard room',50000),
('Deluxe Room','Luxury room',80000); 

INSERT INTO Room(RoomNumber,RoomTypeID,FloorNumber,Status)
VALUES ('101',1,1,'Available'),
  ('102',2,1,'Available');

INSERT INTO Guest (FirstName,LastName,Gender,Phone,Email,Nationality) 
VALUES ('Dorcas','Uwase','Female','0788000000', 'dorcas@gmail.com','Rwandan');

INSERT INTO Staff (FirstName,LastName,Position,Phone,Salary,HireDate)
VALUES ('John','Mugisha','Receptionist', '0788111111',350000,'2026-01-15');

INSERT INTO Bill ( ReservationID, RoomCharges, 
ServiceCharges, TaxAmount, DiscountAmount, BillStatus ) 
VALUES ( 1, 150000, 20000, 27000, 10000, 'Pending' );
INSERT INTO Reservation 
( GuestID, RoomID, CheckInDate, CheckOutDate, 
ReservationStatus, NumberOfGuests )
VALUES ( 1, 1, '2026-07-20', '2026-07-23', 'Booked', 2 );
INSERT INTO Payment ( BillID, PaymentMethod, AmountPaid, TransactionReference ) 
VALUES ( 1, 'Mobile Money', 187000, 'MTN20260714001' );

