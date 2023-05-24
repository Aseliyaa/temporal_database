USE master;
GO
DROP DATABASE IF EXISTS MachinesServiceTemporal;
GO
CREATE DATABASE MachinesServiceTemporal;
GO
USE MachinesServiceTemporal;
GO


CREATE TABLE [Machines]
(
 [MachineCode] Int IDENTITY NOT NULL PRIMARY KEY CLUSTERED,
 [CountryCreator] Nvarchar(30) NOT NULL,
 [YearOfRelease] Int NOT NULL,
 [Mark] Nvarchar(30) NOT NULL,
 [StartTime] datetime2(0) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
 [EndTime] datetime2(0) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 PERIOD FOR SYSTEM_TIME (StartTime, EndTime),
 CONSTRAINT CK_Machines_Year CHECK (YearOfRelease > 0)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.MachinesHistory));
GO

CREATE TABLE [RepairType] 
(
 [TypeCode] Int IDENTITY NOT NULL PRIMARY KEY CLUSTERED,
 [Name] Nvarchar(30) NOT NULL,
 [Duration] Int NOT NULL,
 [Price] Money NOT NULL,
 [StartTime] datetime2(0) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
 [EndTime] datetime2(0) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 PERIOD FOR SYSTEM_TIME (StartTime, EndTime),
 CONSTRAINT CK_Type_Duration CHECK (Duration > 0)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.RepairTypeHistory));
GO

CREATE TABLE [Repair]
(
 [Id] Int IDENTITY NOT NULL PRIMARY KEY CLUSTERED,
 [MachineCode] Int NOT NULL,
	CONSTRAINT FK_Repair_Machine FOREIGN KEY (MachineCode)
 REFERENCES Machines(MachineCode),
 [TypeCode] Int NOT NULL,
 	CONSTRAINT FK_Repair_Type FOREIGN KEY (TypeCode)
 REFERENCES RepairType(TypeCode),
 [MachineType] Nvarchar(30) NOT NULL,
 [DateOfStart] Date NOT NULL,
 [StartTime] datetime2(0) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
 [EndTime] datetime2(0) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 PERIOD FOR SYSTEM_TIME (StartTime, EndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.RepairHistory));
GO

CREATE TABLE [MachineRepairs]
(
[MachineCode] Int NOT NULL,
CONSTRAINT FK_MachineRepairs_Machine FOREIGN KEY (MachineCode)
REFERENCES Machines(MachineCode),
CONSTRAINT PK_MachineRepairs PRIMARY KEY (MachineCode),
[RepairCount] Int NOT NULL,
[StartTime] datetime2(0) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
[EndTime] datetime2(0) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
PERIOD FOR SYSTEM_TIME (StartTime, EndTime),
CONSTRAINT CK_RepairCount CHECK (RepairCount >= 0)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.MachineRepairsHistory));
GO

CREATE TABLE [MachinesHistory]
(
 [MachineCode] Int NOT NULL,
 [CountryCreator] Nvarchar(30) NOT NULL,
 [YearOfRelease] Int NOT NULL,
 [Mark] Nvarchar(30) NOT NULL,
 [StartTime] datetime2(0) NOT NULL,
 [EndTime] datetime2(0) NOT NULL
)
GO

CREATE TABLE [RepairTypeHistory]
(
 [TypeCode] Int NOT NULL,
 [Name] Nvarchar(30) NOT NULL,
 [Duration] Int NOT NULL,
 [Price] Money NOT NULL,
 [StartTime] datetime2(0) NOT NULL,
 [EndTime] datetime2(0) NOT NULL
)
GO

CREATE TABLE [RepairHistory]
(
 [MachineCode] Int NOT NULL,
 [TypeCode] Int NOT NULL,
 [MachineType] Nvarchar(30) NOT NULL,
 [DateOfStart] Date NOT NULL,
 [StartTime] datetime2(0) NOT NULL,
 [EndTime] datetime2(0) NOT NULL
)
GO
CREATE TABLE [MachineRepairsHistory]
(
 [MachineCode] Int NOT NULL,
 [RepairCount] Int NOT NULL,
 [StartTime] datetime2(0) NOT NULL,
 [EndTime] datetime2(0) NOT NULL
)
GO

--2022-01-01 08:12:05

INSERT INTO Machines (CountryCreator, YearOfRelease, Mark)
VALUES
('USA', 2010, 'Lathe 1000'),
('Germany', 2015, 'Milling machine 500'),
('Japan', 2018, 'Drilling machine 2000'),
('France', 2014, 'Grinding machine 300'),
('Italy', 2016, 'Boring machine 800'),
('Spain', 2019, 'Planer 400'),
('UK', 2012, 'Slotting machine 1500'),
('Canada', 2013, 'Shaper 600'),
('Australia', 2017, 'Broaching machine 1200'),
('China', 2020, 'Sawing machine 1000');
GO

INSERT INTO RepairType (Name, Duration, Price)
VALUES
('Cleaning', 1, 50.00),
('Lubrication', 1, 50.00),
('Inspection', 2, 100.00),
('Minor repair', 4, 200.00),
('Major repair', 8, 400.00),
('Upgrade', 12, 800.00),
('Overhaul', 24, 1600.00),
('Replacement', 48, 3200.00),
('Emergency repair', 1, 500.00),
('Preventive maintenance', 6, 300.00);
GO

INSERT INTO Repair (MachineCode, TypeCode, MachineType, DateOfStart)
VALUES
(1, 3, 'Lathe', '2021-03-20'),
(2, 5, 'Milling machine', '2021-03-05'),
(3, 7, 'Drilling machine', '2021-02-20'),
(4, 10, 'Grinding machine', '2021-02-10'),
(5, 6, 'Boring machine', '2021-03-15'),
(6, 4, 'Planer', '2021-03-25'),
(7, 8, 'Slotting machine', '2021-03-03'),
(8, 9, 'Shaper', '2021-02-18'),
(9, 1, 'Broaching machine', '2021-02-09'),
(10, 2, 'Sawing machine', '2021-02-01'),
(1, 4, 'Lathe', '2021-03-25'),
(2, 6, 'Milling machine', '2021-03-10'),
(3, 8, 'Drilling machine', '2021-02-25'),
(4, 1, 'Grinding machine', '2021-02-15'),
(5, 7, 'Boring machine', '2021-03-20'),
(6, 5, 'Planer', '2021-03-28'),
(7, 9, 'Slotting machine', '2021-03-05'),
(8, 10, 'Shaper', '2021-02-23'),
(9, 2, 'Broaching machine', '2021-02-14'),
(10, 3, 'Sawing machine', '2021-02-06'),
(1, 5, 'Lathe', '2021-03-30'),
(2, 7, 'Milling machine', '2021-03-15'),
(3, 9, 'Drilling machine', '2021-03-01'),
(4, 2, 'Grinding machine', '2021-02-20'),
(5, 8, 'Boring machine', '2021-03-25'),
(6, 6, 'Planer', '2021-04-02'),
(7, 10, 'Slotting machine', '2021-03-10'),
(8, 1, 'Shaper', '2021-02-28'),
(9, 3, 'Broaching machine', '2021-02-19'),
(10, 4, 'Sawing machine', '2021-02-11');
GO

INSERT INTO MachineRepairs (MachineCode, RepairCount)
SELECT
MachineCode,
COUNT(*) AS RepairsCount
FROM Repair
GROUP BY MachineCode;