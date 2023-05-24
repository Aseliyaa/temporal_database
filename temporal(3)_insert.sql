USE MachinesServiceTemporal;
GO

--заполнение таблиц со сменой дат

--22.02.2022 (февраль)
INSERT INTO Machines (CountryCreator, YearOfRelease, Mark)
VALUES
('Russia', 2019, 'Lathe 2000'),
('China', 2016, 'Milling machine 700'),
('USA', 2017, 'Drilling machine 3000'),
('Germany', 2018, 'Grinding machine 400'),
('Japan', 2020, 'Boring machine 900')
GO

UPDATE RepairType 
SET Name = 'Routine maintenance', Duration = 3, Price = 150.00
WHERE TypeCode = 1;
UPDATE RepairType 
SET Name = 'Emergency repair', Duration = 2, Price = 250.00
WHERE TypeCode = 10;
UPDATE RepairType 
SET Name = 'Overhaul', Duration = 36, Price = 2000.00
WHERE TypeCode = 7;
UPDATE RepairType 
SET Name = 'Replacement', Duration = 72, Price = 4000.00
WHERE TypeCode = 8;
UPDATE RepairType 
SET Name = 'Preventive maintenance', Duration = 9, Price = 450.00
WHERE TypeCode = 9;

DELETE FROM Repair 
WHERE MachineCode = 1 AND TypeCode = 4 AND DateOfStart = '2021-03-25';
DELETE FROM Repair
WHERE MachineCode = 3 AND TypeCode = 8 AND DateOfStart = '2021-02-25';
DELETE FROM Repair 
WHERE MachineCode = 7 AND TypeCode = 10 AND DateOfStart = '2021-03-05';

--29.03.2022 (март)
INSERT INTO Machines (CountryCreator, YearOfRelease, Mark) VALUES
('India', 2016, 'Planer 500'),
('China', 2017, 'Slotting machine 1700'),
('Germany', 2018, 'Shaper 700'),
('Canada', 2019, 'Broaching machine 1400'),
('Australia', 2020, 'Sawing machine 1200');
GO

UPDATE RepairType 
SET Name = 'Cleaning and lubrication', Duration = 2, Price = 50 
WHERE TypeCode = 1;
UPDATE RepairType 
SET Name = 'Bearing replacement', Duration = 4, Price = 150 
WHERE TypeCode = 2;
UPDATE RepairType 
SET Name = 'Belt replacement', Duration = 3, Price = 100 
WHERE TypeCode = 3;
UPDATE RepairType 
SET Name = 'Motor repair', Duration = 6, Price = 300 
WHERE TypeCode = 4;
UPDATE RepairType 
SET Name = 'Electronics repair', Duration = 8, Price = 500 
WHERE TypeCode = 5;
GO

DELETE FROM Repair
WHERE MachineCode = 1 AND TypeCode = 1;
DELETE FROM Repair
WHERE MachineCode = 3 AND TypeCode = 3;
DELETE FROM Repair
WHERE MachineCode = 5 AND TypeCode = 5;

--08.04.2022 (апрель)
INSERT INTO Machines (CountryCreator, YearOfRelease, Mark)
VALUES ('USA', 2019, 'Generator 5000'),
       ('Germany', 2018, 'Drill press 2000'),
       ('Japan', 2020, 'CNC machine 3000'),
       ('Italy', 2021, 'Robotic arm 4000'),
       ('South Korea', 2022, 'Laser cutter 5000');

UPDATE RepairType SET Name = 'Type6' WHERE TypeCode = 1;
UPDATE RepairType SET Price = 250 WHERE TypeCode = 2;
UPDATE RepairType SET Duration = 6 WHERE TypeCode = 3;
UPDATE RepairType SET Name = 'Type7', Price = 450 WHERE TypeCode = 4;
UPDATE RepairType SET Duration = 8, Price = 600 WHERE TypeCode = 5;

DELETE FROM Machines WHERE Mark = 'Robotic arm 4000' OR Mark = 'Laser cutter 5000';
DELETE FROM RepairType WHERE Name = 'Controller repair';
DELETE FROM Repair WHERE MachineCode = 1 OR MachineCode = 3;

--12.05.2022 (май)
INSERT INTO RepairType (Name, Duration, Price)
VALUES ('Oil change', 1, 50),
       ('Bearing replacement', 2, 150),
       ('Controller repair', 5, 500),
       ('Arm overhaul', 10, 1000),
       ('Lens replacement', 1, 100);
GO

UPDATE Machines SET CountryCreator = 'France' WHERE Mark = 'Generator 5000';
UPDATE Machines SET YearOfRelease = 2017 WHERE Mark = 'Drill press 2000'
UPDATE Repair SET TypeCode = 4 WHERE DateOfStart = '2021-02-23';
UPDATE Machines SET CountryCreator = 'France', YearOfRelease = 2022, Mark = 'Machine F' WHERE MachineCode IN (5, 10);

DELETE FROM Machines WHERE Mark = 'Lathe 1000';
DELETE FROM RepairType WHERE Name = 'Controller repair';
DELETE FROM Repair WHERE MachineCode = 6;

--07.06.2022 (июнь)
INSERT INTO Repair (MachineCode, TypeCode, MachineType, DateOfStart)
VALUES (10, 7, 'Type G', '2022-04-01'),
(11, 7, 'Type H', '2022-04-01'),
(12, 8, 'Type I', '2022-04-01'),
(13, 9, 'Type J', '2022-04-01'),
(14, 10, 'Type K', '2022-04-01');

UPDATE Machines
SET CountryCreator = 'Spain', YearOfRelease = 2023, Mark = 'Machine Q'
WHERE MachineCode IN (2, 3, 4, 6, 8);

DELETE FROM Machines WHERE MachineCode IN (17, 16, 15);

--20.07.2022 (июль)

INSERT INTO Machines (CountryCreator, YearOfRelease, Mark)
VALUES ('USA', 2018, 'Machine R'),
('Germany', 2017, 'Machine S'),
('Japan', 2016, 'Machine T'),
('Russia', 2015, 'Machine U'),
('China', 2014, 'Machine V');

UPDATE RepairType
SET Name = 'Type N', Duration = 140, Price = 14000.00
WHERE TypeCode IN (6, 7, 8, 9, 10);

DELETE FROM RepairType WHERE TypeCode IN (12, 14, 15);

--20.08.2022 (август)
INSERT INTO Repair (MachineCode, TypeCode, MachineType, DateOfStart)
VALUES (21, 6, 'Type G', '2022-04-01'),
(27, 7, 'Type H', '2022-04-01'),
(28, 8, 'Type I', '2022-04-01'),
(29, 9, 'Type J', '2022-04-01'),
(30, 10, 'Type K', '2022-04-01');
GO


UPDATE Machines
SET CountryCreator = 'Spain', YearOfRelease = 2023, Mark = 'Machine Q'
WHERE MachineCode IN (12, 13, 14, 16, 18);

DELETE FROM Machines WHERE MachineCode IN (18, 19, 20);

--15.09.2022 (сентябрь)


UPDATE Machines
SET YearOfRelease = 2021, Mark = 'Vertical Lathe'
WHERE Mark = 'Machine Q';

INSERT INTO RepairType (Name, Duration, Price)
VALUES ('Mechanical repairs', 3, 50),
       ('Electrical repairs', 2, 150),
       ('Plumbing repairs ', 5, 500),
       ('Structural repairs', 10, 1000),
       ('Automotive repairs', 1, 100);
GO

DELETE FROM Repair WHERE MachineType = 'Type I' OR MachineType = 'Type H'


--05.10.2022 (октябрь)
DELETE FROM Machines
WHERE Mark = 'Machine T'
DELETE FROM Machines
WHERE Mark = 'Machine R'
DELETE FROM Machines
WHERE Mark = 'Machine S'

UPDATE Repair
SET MachineType = 'Drilling machine'
WHERE MachineType = 'Type G'
UPDATE Repair
SET MachineType = 'Perforator'
WHERE MachineType = 'Type K'
UPDATE Repair
SET MachineType = 'Welding machine'
WHERE MachineType = 'Type J'

INSERT INTO Machines (CountryCreator, YearOfRelease, Mark)
VALUES ('USA', 2018, 'Milling machine'),
('Germany', 2017, 'Woodworking maching'),
('Japan', 2016, 'Horizontal milling machine'),
('Russia', 2015, '5-Axis milling machine'),
('China', 2014, 'Milling machine');

--17.11.2022 (ноябрь)
UPDATE Machines
SET Mark = 'CNC Lathes'
WHERE Mark = 'Machine U' OR Mark = 'Machine V' OR Mark = 'Machine F'
UPDATE RepairType
SET Name = 'Curaitive maintenance'
WHERE Name = 'Type6'

DELETE FROM Repair
WHERE TypeCode = 5 AND MachineType = 'Milling machine'
DELETE FROM Repair
WHERE TypeCode = 8 AND MachineType = 'Slotting machine'
DELETE FROM Repair
WHERE TypeCode = 3 AND MachineType = 'Sawing machine'

INSERT INTO RepairType (Name, Duration, Price)
VALUES ('Corrective maintenance', 7, 54),
       ('Predictive maintenance', 2, 170),
       ('Systematic maintenance', 5, 400),
       ('Conditional maintenance', 10, 1020),
       ('Controlled maintenance', 11, 130);
GO

--19.12.2022 (декабрь)

DELETE FROM Machines
WHERE MachineCode = 6
DELETE FROM Machines
WHERE MachineCode = 22
DELETE FROM Machines
WHERE MachineCode = 23

UPDATE RepairType
SET Name = 'Condition-based'
WHERE Name = 'Type N'
UPDATE RepairType
SET Name = 'Predetermined' 
WHERE Name = 'Condition-based' AND TypeCode = 6
UPDATE RepairType
SET Name = 'Predetermined' 
WHERE Name = 'Condition-based' AND TypeCode = 8
UPDATE RepairType
SET Price = 172
WHERE Name = 'Condition-based'

INSERT INTO Machines (CountryCreator, YearOfRelease, Mark)
VALUES ('USA', 2018, 'Turning machine'),
('Belarus', 2020, 'Maz'),
('Japan', 2015, 'Carousel machine'),
('Canada', 2017, 'Overlock sewing machine'),
('China', 2014, 'Stitch machine');