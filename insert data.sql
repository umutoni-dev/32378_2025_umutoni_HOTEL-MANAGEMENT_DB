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
