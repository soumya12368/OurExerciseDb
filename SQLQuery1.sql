-- Drop the database if it exists
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'OurExerciseDb')
    DROP DATABASE OurExerciseDb;

-- Create the database with specified file locations and sizes
CREATE DATABASE OurExerciseDb
ON PRIMARY
    (NAME = 'OurExerciseDb_data',
    FILENAME = 'C:\MSSQL\Day1\OurExerciseDb_data.mdf',
    SIZE = 24MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 8MB)
LOG ON
    (NAME = 'OurExerciseDb_log',
    FILENAME = 'C:\MSSQL\Day1\OurExerciseDb_log.ldf',
    SIZE = 8MB,
    MAXSIZE = 2048GB,
    FILEGROWTH = 8MB);

-- Use the created database
USE OurExerciseDb;

-- Create the Product table
CREATE TABLE Products (
    Pid INT PRIMARY KEY,
    PName NVARCHAR(255) NOT NULL,
    PPrice DECIMAL(10, 2) CHECK (PPrice >= 50 AND PPrice <= 100000),
    PCompany NVARCHAR(255) DEFAULT 'Default',
    PQty INT CHECK (PQty >= 1)
);

-- Insert at least 5 records into the Product table
INSERT INTO Products (Pid, PName, PPrice, PCompany, PQty) VALUES
(50, 'M20', 1000.00, 'Samsung', 1),
(51, 'S40', 1500.00, 'Apple', 1),
(52, 'F23', 800.00, 'Redmi', 2),
(53, 'A50', 1200.00, 'HTC', 3),
(54, 'LG4', 500.00, 'Sony', 5);
Select * from Products