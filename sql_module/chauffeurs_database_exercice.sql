-- CREATE
-- 1
CREATE TABLE Drivers (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name TEXT,
    last_name TEXT,
    age INTEGER,
    address TEXT,
    date_permit DATE,
    accidents INTEGER,
    average_score REAL
);

-- 2
CREATE TABLE Users (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name TEXT,
    last_name TEXT,
    age INTEGER,
    average_score REAL
);

-- 3
CREATE TABLE Employees (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name TEXT,
    last_name TEXT,
    years_experience INTEGER,
    kilometers_used REAL
);

-- 4
CREATE TABLE Cities (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name TEXT,
    size INTEGER,
    population INTEGER
);

-- INSERT
-- 1
INSERT INTO Drivers (first_name, last_name, age, address, date_permit, accidents, average_score) VALUES
('Fitzgerald','Greene',54,'6557 Mi Rd.','2012-03-14',0,1.4),
('Ezekiel','Herring',39,'6075 Ut Ave','2012-05-27',9,1.9),
('Cally','Hopkins',55,'Ap #548-2709 Justo. Av.','2024-02-06',8,4.5),
('Lacota','Wooten',50,'P.O. Box 561, 7899 Mollis. Road','2009-08-26',2,4.9),
('Tanner','Wise',32,'796 Tristique St.','2021-06-16',2,2.3);

-- 2
INSERT INTO Users (first_name,last_name,age,average_score) VALUES
('Malachi','Livingston',43,1.8),
('Joseph','Murray',37,5),
('Ulric','Wooten',60,1.3),
('Bell','Gould',45,0.8),
('Leilani','Schneider',31,2.9);

-- 3
INSERT INTO Employees (first_name,last_name,years_experience,kilometers_used) VALUES
('Jack','Johnson',9,608),
('Lenny','Conray',6,854),
('Isabella','Donovan',9,786),
('Lucia','Moad',8,916),
('Sophie','Ford',13,163);

-- 4
INSERT INTO Cities (name,size,population) VALUES
('Chicago',1215,236928),
('Denver',1292,158516),
('Seatle',427,684409),
('Boston',126,159637),
('Miami',1290,521277);

-- SELECT
-- 1
SELECT * FROM Drivers;
SELECT * FROM Users;
SELECT * FROM Employees;
SELECT * FROM Cities;

-- 2
SELECT accidents FROM Drivers;

-- 3
SELECT date_permit FROM Drivers;

-- UPDATE
-- 1
UPDATE Drivers SET age = 28 WHERE id = 1;

-- 2
UPDATE Users SET first_name = 'John' WHERE id = 1;

-- 3
UPDATE Employees SET years_experience = 6 WHERE id = 1;

-- ALTER
-- 1
ALTER TABLE Cities ADD COLUMN cars_number INTEGER;

-- DELETE
-- 1
DELETE FROM Employees WHERE id = 5;