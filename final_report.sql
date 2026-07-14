UNIVERSITY OF LAY ADVENTIST OF KIGALI (UNILAK)

FACULTY OF COMPUTING AND INFORMATION SCIENCE

FINAL PROJECT REPORT
HOTEL MANAGEMENT AND HOSPITALITY 

Submitted by:

Name: Umutoni
Registration Number: 32378/2025

Course: Database Programming
Database Platform: Microsoft SQL Server
Academic Year: 2025/2026

---

## ABSTRACT

The Hotel Management and Hospitality Information System is a database solution developed to improve and automate hotel operations.
  The system manages guest registration, room reservations, check-in and check-out, billing, payments,
  staff assignments, and service requests.

The project was developed using Microsoft SQL Server and database programming techniques including tables,
  relationships, stored procedures, functions, triggers, views, and a data reporting dashboard.
  The system reduces manual work, improves accuracy, and supports management decision-making.

---

1.CHAPTER ONE: INTRODUCTION

Background

Hotels handle large amounts of information every day, including guest records, room bookings, and financial transactions.
Manual methods are often slow, error-prone, and difficult to manage efficiently.

Problem Statement

Many hotels experience:

* Double booking of rooms.
* Inaccurate billing and payments.
* Poor tracking of guest information.
* Delays in service delivery.
* Difficulty generating management reports.

## Objective

To design and implement a database system that automates hotel operations and improves service delivery using Microsoft SQL Server.

---

2.CHAPTER TWO: SYSTEM SCOPE

The system covers:

* Guest Management
* Room Management
* Reservation Management
* Check-in and Check-out
* Billing and Payments
* Staff Management
* Service Requests
* Reporting and Analysis

---

3.CHAPTER THREE: BUSINESS PROCESS

The hotel operation follows these steps:

3.1. Guest requests a reservation.
3.2. Receptionist checks room availability.
3.3. Reservation is created.
3.4. Guest checks in.
3.5. Additional services are recorded.
3.6. Bill is generated automatically.
3.7. Payment is processed.
3.8. Guest checks out and room status is updated.

---

4.CHAPTER FOUR: DATABASE DESIGN

## Main Tables

* Guest
* RoomType
* Room
* Reservation
* CheckInOut
* Bill
* Payment
* Staff
* StaffAssignment
* ServiceRequest
* LoyaltyProgram

## Relationships

* One Guest can have many Reservations.
* One RoomType can have many Rooms.
* One Reservation generates one Bill.
* One Bill can have many Payments.
* One Staff member can manage multiple assignments.

(Insert ER Diagram Here)

---

5.CHAPTER FIVE: DATABASE NORMALIZATION

The database was normalized up to Third Normal Form (3NF) to eliminate redundancy and improve consistency.

.1NF: Removed repeating groups and ensured atomic values.
.2NF:** Removed partial dependencies.
.3NF:** Removed transitive dependencies.

---

6.CHAPTER SIX: DATABASE IMPLEMENTATION

The system was implemented in Microsoft SQL Server using:

* Primary Keys
* Foreign Keys
* Constraints
* Sample Data
* SQL Queries

Database programming features implemented include:

* Stored Procedures
* Functions
* Triggers
* Views

---

7.CHAPTER SEVEN: INNOVATION

....Data Reporting Dashboard

The innovation of this project is the implementation of a **Data Reporting Dashboard** that converts database information into useful management reports.

The dashboard provides:

* Room occupancy analysis
* Revenue reports
* Reservation statistics
* Guest activity reports
* Payment status reports
* Room performance analysis

This innovation supports faster and more informed management decisions.

---

8.CHAPTER EIGHT: SECURITY AND AUDITING

The system uses:

* User roles and permissions
* Primary and foreign key constraints
* Validation rules
* Audit mechanisms for monitoring database changes

---

9.CHAPTER NINE: BENEFITS OF THE SYSTEM

The system provides:

* Faster hotel operations
* Reduced human errors
* Improved customer service
* Better data management
* Accurate business reports

---

# CONCLUSION

The Hotel Management and Hospitality Information System successfully automates 
  key hotel operations including reservations, room management, billing, payments,
  and reporting.

The integration of the Data Reporting Dashboard improves decision-making and overall operational efficiency,
  making the system reliable and effective for modern hotel management.

---

# FUTURE IMPROVEMENTS

Future versions of the system may include:

* Online booking functionality
* Mobile application support
* Integration with payment gateways
* Advanced analytics and forecasting

---

# REFERENCES

1. Microsoft SQL Server Documentation.
2. Database System Concepts by Silberschatz, Korth, and Sudarshan.
3. Database Programming Course Materials.
4. Microsoft Learn SQL Server Tutorials.
