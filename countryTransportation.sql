-- Veritabanını oluştur
CREATE DATABASE IF NOT EXISTS PROJE;
USE PROJE;

-- PASSENGER tablosunu oluştur
CREATE TABLE IF NOT EXISTS PASSENGER (
    ID_Passport INT PRIMARY KEY,
    Name VARCHAR(255),
    Mname VARCHAR(255),
    LName VARCHAR(255),
    Nationality VARCHAR(50),
    Specific_Passenger_Program VARCHAR(255),
    Mail VARCHAR(255),
    DOB DATE,
    Gender VARCHAR(10),
    Billing_Address VARCHAR(255)
);

-- HISTORY tablosunu oluştur
CREATE TABLE IF NOT EXISTS HISTORY (
    HistoryID INT PRIMARY KEY,
    PName VARCHAR(255),
    ID_Passport INT,
    FOREIGN KEY (ID_Passport) REFERENCES PASSENGER(ID_Passport)
);

-- TRIP tablosunu oluştur
CREATE TABLE IF NOT EXISTS TRIP (
    TripID INT PRIMARY KEY,
    Price DECIMAL(10,2),
    Travel_Company VARCHAR(255),
    Travel_Date DATE,
    Destination_Location VARCHAR(255),
    Departure_Location VARCHAR(255)
);

-- TICKET tablosunu oluştur
CREATE TABLE IF NOT EXISTS TICKET (
    TripID INT PRIMARY KEY,
    PNR VARCHAR(50),
    Time TIME,
    Seat_no INT,
    Support_Type VARCHAR(50),
    FOREIGN KEY (TripID) REFERENCES TRIP(TripID)
);


-- HAS tablosunu oluştur
CREATE TABLE IF NOT EXISTS HAS (
    ID_Passport INT,
    TripID INT,
    PRIMARY KEY (ID_Passport, TripID),
    FOREIGN KEY (ID_Passport) REFERENCES PASSENGER(ID_Passport),
    FOREIGN KEY (TripID) REFERENCES TRIP(TripID)
);

-- STORES_ON tablosunu oluştur
CREATE TABLE IF NOT EXISTS STORES_ON (
    TripID INT,
    HistoryID INT,
    PRIMARY KEY (TripID, HistoryID),
    FOREIGN KEY (TripID) REFERENCES TRIP(TripID),
    FOREIGN KEY (HistoryID) REFERENCES HISTORY(HistoryID)
);

-- TRANSFERRED_FLIGHT tablosunu oluştur
CREATE TABLE IF NOT EXISTS TRANSFERRED_FLIGHT (
    TripID INT PRIMARY KEY,
    Transfer_Flight_1D INT,
    Transfer_Seat_no INT,
    Transfer_Date DATE,
    FOREIGN KEY (TripID) REFERENCES TRIP(TripID)
);

-- TRIP_PREFERENCE tablosunu oluştur
CREATE TABLE IF NOT EXISTS TRIP_PREFERENCE (
    HistoryID INT PRIMARY KEY,
    PID INT,
    Preferred_Trip_Type VARCHAR(50),
    Preferred_Seat_Type VARCHAR(50),
    Trip_Selection VARCHAR(50),
    Seat_Selection VARCHAR(50),
    FOREIGN KEY (HistoryID) REFERENCES HISTORY(HistoryID)
);


-- MARTI tablosunu oluştur
CREATE TABLE IF NOT EXISTS MARTI (
    TripID INT PRIMARY KEY,
    VehicleID INT,
    Vehicle_Type VARCHAR(50),
    Driver_None BOOLEAN,
    DriverID INT,
    FOREIGN KEY (TripID) REFERENCES TRIP(TripID)
);

-- IZBAN tablosunu oluştur
CREATE TABLE IF NOT EXISTS IZBAN (
    TripID INT PRIMARY KEY,
    Return_Price DECIMAL(10,2),
    FOREIGN KEY (TripID) REFERENCES TRIP(TripID)
);

-- CAR_RENTAL tablosunu oluştur
CREATE TABLE IF NOT EXISTS CAR_RENTAL (
    TripID INT PRIMARY KEY,
    Pickup_Time TIME,
    Delivering_Type VARCHAR(50),
    Number_of_people INT,
    Size_of_baggage VARCHAR(50),
    FOREIGN KEY (TripID) REFERENCES TRIP(TripID)
);

-- PLANE tablosunu oluştur
CREATE TABLE IF NOT EXISTS PLANE (
    TripID INT PRIMARY KEY,
    Baggage_Weight DECIMAL(10,2),
    Plane_Code VARCHAR(50),
    FOREIGN KEY (TripID) REFERENCES TRIP(TripID)
);

-- TICKET tablosuna kayıt ekle
INSERT INTO TICKET (TripID, PNR, Time, Seat_no, Support_Type)
VALUES
(201, 'ABC123', '12:00:00', 15, 'Online Support'),
(202, 'DEF456', '14:30:00', 7, 'Phone Support'),
(203, 'GHI789', '08:45:00', 22, 'Email Support'),
(204, 'JKL012', '16:20:00', 10, 'Online Support'),
(205, 'MNO345', '10:10:00', 5, 'Phone Support');

-- MARTI tablosuna kayıt ekle
INSERT INTO MARTI (TripID, VehicleID, Vehicle_Type, Driver_None, DriverID)
VALUES
(201, 101, 'Car', 1, 1001),
(202, 201, 'Train', 0, NULL),
(203, 301, 'Bus', 1, 1002),
(204, 401, 'Ship', 0, NULL),
(205, 501, 'Car', 1, 1003);

-- IZBAN tablosuna kayıt ekle
INSERT INTO IZBAN (TripID, Return_Price)
VALUES
(201, 50.00),
(202, 30.00),
(203, 20.00),
(204, 80.00),
(205, 40.00);

-- CAR_RENTAL tablosuna kayıt ekle
INSERT INTO CAR_RENTAL (TripID, Pickup_Time, Delivering_Type, Number_of_people, Size_of_baggage)
VALUES
(201, '10:30:00', 'Airport Delivery', 3, 'Large'),
(202, '09:15:00', 'City Center Pickup', 2, 'Medium'),
(203, '14:00:00', 'Hotel Delivery', 5, 'Extra Large'),
(204, '11:45:00', 'Airport Pickup', 4, 'Small'),
(205, '08:00:00', 'City Center Pickup', 1, 'Medium');

-- PLANE tablosuna kayıt ekle
INSERT INTO PLANE (TripID, Baggage_Weight, Plane_Code)
VALUES
(201, 25.0, 'AB123'),
(202, 20.5, 'CD456'),
(203, 15.0, 'EF789'),
(204, 30.0, 'GH012'),
(205, 18.5, 'IJ345');

