create database sqlproject;
use sqlproject;

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Phone int(15),
    Fine_amount int(20));
insert into User (UserID, Username, Phone)
values('1','Rini','9876463765'),
	  ('2','Harshan','8769544378'),
      ('3','Bhamini','9845367856'),
      ('4','Arun','8790654976'),
      ('5','Varun','9864759037'),
      ('6','John','6789540786'),
      ('7','Hari','8769006543'),
      ('8','Rahul','6890078543'),
      ('9','Faisal','9089676589'),
      ('10','sanal','8090769054');
select * from User;      


CREATE TABLE Facilities (
    FacilityID INT PRIMARY KEY ,
    FacilityName VARCHAR(50) NOT NULL);
insert into Facilities (FacilityID, FacilityName)
values('101','Tennis Court'),
	  ('102','Badminton court'),
      ('103','Multi-purpose field'),
      ('104','Archery Range');
select * from Facilities;

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY ,
    UserID INT,
    FacilityID INT,
    Booking_Date DATE,
	Booking_status varchar(20),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (FacilityID) REFERENCES Facilities(FacilityID));
INSERT INTO Booking (BookingID,UserID, FacilityID, Booking_Date)
VALUES
(201, 10,104,'2024-02-20'),
(202, 9,103,'2024-02-21'),
(203, 3,101,'2024-02-22'),
(204, 5,102,'2024-02-23'),
(205, 4,101,'2024-02-24'),
(206, 6,103,'2024-02-25'),
(207, 7,104,'2024-02-26'),
(208, 1,101,'2024-02-27'),
(209, 2, 104,'2024-02-28'),
(210, 8,102,'2024-02-29');    
select * from Booking;


CREATE TABLE Cancellation (
    UserID INTEGER PRIMARY KEY,
    Cancel_count INTEGER DEFAULT 0,
    FOREIGN KEY (UserID) REFERENCES User(UserID));
INSERT INTO Cancellation (UserID, Cancel_count)
VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 4),
(5, 0),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);
select * from Cancellation;


UPDATE User
SET Fine_Amount = 10
WHERE UserID IN (
    SELECT UserID
    FROM Cancellation
    WHERE Cancel_count >= 3
);
select * from User;


UPDATE Booking
SET Booking_Status = 'Canceled'
WHERE BookingID = 202;

UPDATE Cancellation
SET Cancel_count = Cancel_count + 1
WHERE UserID = (SELECT UserID FROM Booking WHERE BookingID = 202);

select * from Cancellation;
select * from Booking;
