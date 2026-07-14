CREATE VIEW AvailableRooms 
AS SELECT * FROM Room WHERE Status='Available';

CREATE VIEW DailyRevenue AS SELECT
CAST(PaymentDate AS DATE) AS RevenueDate,
SUM(AmountPaid) AS TotalRevenue FROM Payment
GROUP BY CAST(PaymentDate AS DATE);

CREATE VIEW OutstandingBills AS SELECT * FROM Bill
WHERE BillStatus <> 'Paid';

CREATE VIEW OccupancyRate AS SELECT COUNT(*) AS OccupiedRooms 
FROM Room WHERE Status = 'Occupied';

CREATE VIEW StaffAssignmentsReport AS SELECT
s.FirstName, s.LastName, sa.Task, sa.AssignmentDate, sa.Status FROM
StaffAssignment sa INNER JOIN Staff s ON sa.StaffID = s.StaffID;

CREATE VIEW vw_Room_Occupancy_Dashboard AS
SELECT COUNT(RoomID) AS Total_Rooms,
    SUM(CASE WHEN Status = 'Available' THEN 1 ELSE 0 END) AS Available_Rooms,
    SUM(CASE WHEN Status = 'Occupied' THEN 1 ELSE 0 END) AS Occupied_Rooms,
    SUM(CASE WHEN Status = 'Maintenance' THEN 1 ELSE 0 END) AS Maintenance_Rooms,
    CAST((SUM(CASE WHEN Status = 'Occupied' THEN 1 ELSE 0 END) * 100.0) 
        / COUNT(RoomID)
        AS DECIMAL(5,2)
    ) AS Occupancy_Rate_Percentage
FROM Room;



CREATE VIEW vw_Revenue_Dashboard AS
SELECT
    YEAR(PaymentDate) AS Payment_Year,
    MONTH(PaymentDate) AS Payment_Month,
    SUM(AmountPaid) AS Total_Revenue
FROM Payment
GROUP BY 
    YEAR(PaymentDate),
    MONTH(PaymentDate);

CREATE VIEW vw_Guest_Report_Dashboard AS
SELECT
    COUNT(DISTINCT G.GuestID) AS Total_Guests,
    COUNT(R.ReservationID) AS Total_Reservations
FROM Guest G
LEFT JOIN Reservation R
ON G.GuestID = R.GuestID;

CREATE VIEW vw_Room_Performance_Dashboard AS
SELECT RT.TypeName AS Room_Type,
    COUNT(R.RoomID) AS Number_Of_Rooms,
    COUNT(RES.ReservationID) AS Total_Bookings
FROM RoomType RT
JOIN Room R
ON RT.RoomTypeID = R.RoomTypeID
LEFT JOIN Reservation RES
ON R.RoomID = RES.RoomID
GROUP BY RT.TypeName;

CREATE VIEW vw_Payment_Method_Dashboard AS
SELECT
    PaymentMethod,
    COUNT(PaymentID) AS Number_Of_Payments,
    SUM(AmountPaid) AS Total_Amount
FROM Payment
GROUP BY PaymentMethod;



