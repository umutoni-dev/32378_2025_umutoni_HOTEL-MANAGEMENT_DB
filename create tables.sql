CREATE TABLE Guest( GuestID INT IDENTITY(1,1) PRIMARY KEY, 
FirstName NVARCHAR(50) NOT NULL, LastName NVARCHAR(50) NOT NULL,
Gender NVARCHAR(10), Phone NVARCHAR(20) UNIQUE, 
Email NVARCHAR(100) UNIQUE, Nationality NVARCHAR(50),
PassportID NVARCHAR(30) UNIQUE, LoyaltyPoints INT DEFAULT 0 );

CREATE TABLE RoomType( RoomTypeID INT IDENTITY(1,1) PRIMARY KEY,
TypeName NVARCHAR(50) NOT NULL,
Description NVARCHAR(200),
PricePerNight DECIMAL(10,2) NOT NULL );

CREATE TABLE Room( RoomID INT IDENTITY(1,1) PRIMARY KEY,
RoomNumber NVARCHAR(10) UNIQUE NOT NULL, 
RoomTypeID INT NOT NULL, 
FloorNumber INT, 
Status NVARCHAR(20) DEFAULT 'Available', 
CONSTRAINT FK_Room_RoomType FOREIGN KEY(RoomTypeID) 
REFERENCES RoomType(RoomTypeID), 
CONSTRAINT CHK_Room_Status
CHECK(Status IN ('Available','Occupied','Reserved','Maintenance')) );

CREATE TABLE Reservation( ReservationID INT IDENTITY(1,1) PRIMARY KEY,
GuestID INT NOT NULL, RoomID INT NOT NULL,
ReservationDate DATETIME DEFAULT GETDATE(),
CheckInDate DATE NOT NULL, CheckOutDate DATE NOT NULL,
ReservationStatus NVARCHAR(20) DEFAULT 'Booked',
NumberOfGuests INT, 
CONSTRAINT FK_Reservation_Guest FOREIGN KEY(GuestID) REFERENCES Guest(GuestID),
CONSTRAINT FK_Reservation_Room FOREIGN KEY(RoomID) REFERENCES Room(RoomID),
CONSTRAINT CHK_Reservation_Status 
CHECK(ReservationStatus IN ('Booked','Checked In','Completed','Cancelled')) );


CREATE TABLE CheckInOut( TransactionID INT IDENTITY(1,1) PRIMARY KEY,
ReservationID INT NOT NULL, 
ActualCheckIn DATETIME, 
ActualCheckOut DATETIME, 
Remarks NVARCHAR(255),
CONSTRAINT FK_CheckInOut_Reservation
FOREIGN KEY(ReservationID) REFERENCES Reservation(ReservationID) );


CREATE TABLE Bill( BillID INT IDENTITY(1,1) PRIMARY KEY,
ReservationID INT NOT NULL,
RoomCharges DECIMAL(10,2) DEFAULT 0,
ServiceCharges DECIMAL(10,2) DEFAULT 0,
TaxAmount DECIMAL(10,2) DEFAULT 0, DiscountAmount DECIMAL(10,2) DEFAULT 0, 
TotalAmount DECIMAL(10,2), BillStatus NVARCHAR(20) DEFAULT 'Pending', 
CONSTRAINT FK_Bill_Reservation FOREIGN KEY(ReservationID)
REFERENCES Reservation(ReservationID),
CONSTRAINT CHK_Bill_Status 
CHECK(BillStatus IN ('Paid','Pending','Partially Paid')) );

CREATE TABLE Payment( PaymentID INT IDENTITY(1,1) PRIMARY KEY,
BillID INT NOT NULL,
PaymentDate DATETIME DEFAULT GETDATE(),
PaymentMethod NVARCHAR(30), 
AmountPaid DECIMAL(10,2),
TransactionReference NVARCHAR(100),
CONSTRAINT FK_Payment_Bill FOREIGN KEY(BillID) REFERENCES Bill(BillID) );

CREATE TABLE Staff( StaffID INT IDENTITY(1,1) PRIMARY KEY,
FirstName NVARCHAR(50),
LastName NVARCHAR(50), 
Position NVARCHAR(50),
Phone NVARCHAR(20), 
Salary DECIMAL(10,2), HireDate DATE );


CREATE TABLE StaffAssignment( AssignmentID INT IDENTITY(1,1) PRIMARY KEY,
StaffID INT NOT NULL, 
RoomID INT NOT NULL,
AssignmentDate DATETIME DEFAULT GETDATE(),
Task NVARCHAR(100),Status NVARCHAR(20) DEFAULT 'Pending',
CONSTRAINT FK_StaffAssignment_Staff FOREIGN KEY(StaffID) 
REFERENCES Staff(StaffID),
CONSTRAINT FK_StaffAssignment_Room FOREIGN KEY(RoomID) REFERENCES Room(RoomID),
CONSTRAINT CHK_Assignment_Status 
CHECK(Status IN ('Pending','In Progress','Completed')) );

CREATE TABLE ServiceRequest( RequestID INT IDENTITY(1,1) PRIMARY KEY,
GuestID INT NOT NULL, 
RoomID INT NOT NULL, RequestType NVARCHAR(100), 
RequestDate DATETIME DEFAULT GETDATE(), 
Status NVARCHAR(20) DEFAULT 'Pending', 
CONSTRAINT FK_Request_Guest FOREIGN KEY(GuestID) REFERENCES Guest(GuestID), 
CONSTRAINT FK_Request_Room FOREIGN KEY(RoomID) REFERENCES Room(RoomID),
CONSTRAINT CHK_Request_Status
CHECK(Status IN ('Pending','Processing','Completed')) );

CREATE TABLE LoyaltyProgram( LoyaltyID INT IDENTITY(1,1) PRIMARY KEY,
GuestID INT NOT NULL, PointsEarned INT DEFAULT 0, 
PointsRedeemed INT DEFAULT 0,
MembershipLevel NVARCHAR(20) DEFAULT 'Silver',
CONSTRAINT FK_Loyalty_Guest FOREIGN KEY(GuestID) REFERENCES Guest(GuestID), 
CONSTRAINT CHK_Loyalty_Level
CHECK(MembershipLevel IN ('Silver','Gold','Platinum')) );


CREATE TABLE AuditLog ( AuditID INT IDENTITY(1,1) PRIMARY KEY, 
TableName NVARCHAR(50),
ActionPerformed NVARCHAR(20), 
PerformedBy NVARCHAR(100), 
ActionDate DATETIME DEFAULT GETDATE() );
