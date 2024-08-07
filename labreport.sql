--1. Creating database:
CREATE DATABASE rajkumar;

DROP DATABASE rajkumar;

---2. Creating table:

CREATE TABLE person(
ID int NOT NULL,
Name varchar(255),
Address varchar(255),
Mobileno varchar(255),
Gmail varchar(255)
);

DROP TABLE person;

---3. Inserting the value in table and selecting all and even distinct:

INSERT INTO person (ID, Name, Address, Mobileno, Gmail)
VALUES ('1', 'Ram', 'talchikhel', '9862792737', 'ram56@gmail.com');

INSERT INTO person (ID, Name, Address, Mobileno, Gmail)
VALUES ('2', 'Bim', 'Gwarko', '9807439367', 'Bim73@gmail.com');

SELECT *FROM person;

SELECT DISTINCT Address, Gmail FROM person;

---4. Auto incrementing the primary key:
CREATE TABLE person(
PersonID int IDENTITY(5,1)PRIMARY KEY,
Name varchar(255),
Address varchar(255),
Mobileno varchar(255),
Gmail varchar(255)
);

INSERT INTO person (Name, Address, Mobileno, Gmail)
VALUES ('Ram', 'talchikhel', '9862792737', 'ram56@gmail.com');
INSERT INTO person (Name, Address, Mobileno, Gmail)
VALUES ('Bim', 'Gwarko', '9807439367', 'Bim73@gmail.com');

SELECT *FROM person;

--5. Altering the table and adding a column to the table:


ALTER TABLE person
ADD Surname varchar(255);

SELECT *FROM person;

-- 6. Declare constraints in the table and remove one of them:

--i.UNQUIE:
CREATE TABLE Rajkumar(
ID int NOT NULL UNIQUE,
LastName varchar(255)NOT NULL,
FirstName varchar(255),
Age int
CONSTRAINT UC_RAJKUMAR UNIQUE(ID,LastName));

SELECT * FROM Rajkumar;

ALTER TABLE Rajkumar
DROP CONSTRAINT UC_RAJKUMAR;

--ii.PRIMARY KEY:

CREATE TABLE Rajkumars(
ID int NOT NULL,
LastName varchar(255)NOT NULL,
FirstName varchar(255),
Age int
CONSTRAINT PK_RAJKUMARS PRIMARY KEY(ID));

SELECT * FROM Rajkumars;

DROP TABLE Rajkumars;

--iii.FUNCTION KEY:

CREATE TABLE Purchase(
ItemID int NOT NULL,
ItemNumber int NOT NULL,
PersonID int,
PRIMARY KEY(ItemID),
CONSTRAINT FK_Purchase FOREIGN KEY(PersonID)
REFERENCES Rajkumars(ID));

SELECT * FROM Purchase;

DROP TABLE Purchase;

-- 7. Use the Where clause in the query:

CREATE TABLE person(
PersonID int IDENTITY(5,1)PRIMARY KEY,
Name varchar(255),
Address varchar(255),
Mobileno varchar(255),
Gmail varchar(255)
);

INSERT INTO person (Name, Address, Mobileno, Gmail)
VALUES ('Ram', 'talchikhel', '9862792737', 'ram56@gmail.com');
INSERT INTO person (Name, Address, Mobileno, Gmail)
VALUES ('Bim', 'Gwarko', '9807439367', 'Bim73@gmail.com');

SELECT *FROM person
WHERE Name= 'Bim';

-- 8. Use AND, OR, NOT queries:
CREATE TABLE person(
PersonID int IDENTITY(5,1)PRIMARY KEY,
Name varchar(255),
Address varchar(255),
Mobileno varchar(255),
Gmail varchar(255)
);

INSERT INTO person (Name, Address, Mobileno, Gmail)
VALUES ('Ram', 'talchikhel', '9862792737', 'ram56@gmail.com');
INSERT INTO person (Name, Address, Mobileno, Gmail)
VALUES ('Bim', 'Gwarko', '9807439367', 'Bim73@gmail.com');

--i. AND:
SELECT *FROM person
WHERE Name ='Bim' AND Address ='Gwarko';

-- ii. OR:
SELECT *FROM person
WHERE Address ='talchikhel' OR Address ='Gwarko';

-- iii. NOT:


SELECT *FROM person
WHERE NOT Address ='talchikhel';

-- 9. Use “ ORDER BY ” query for both ascending and descending orders:
CREATE TABLE person(
PersonID int IDENTITY(5,1)PRIMARY KEY,
Name varchar(255),
Address varchar(255),
Mobileno varchar(255),
Gmail varchar(255)
);

INSERT INTO person (Name, Address, Mobileno, Gmail)
VALUES ('Ram', 'talchikhel', '9862792737', 'ram56@gmail.com');
INSERT INTO person (Name, Address, Mobileno, Gmail)
VALUES ('Bim', 'Gwarko', '9807439367', 'Bim73@gmail.com');

-- i. Ascending:
SELECT *FROM person
ORDER BY Name ASC;

-- ii. Descending:
SELECT *FROM person
ORDER BY Name DESC;

-- 10. Update and delete table fields:
CREATE TABLE person(
PersonID int IDENTITY(5,1)PRIMARY KEY,
Name varchar(255),
Address varchar(255),
Mobileno varchar(255),
Gmail varchar(255));

INSERT INTO person (Name, Address, Mobileno, Gmail)
VALUES ('Ram', 'talchikhel', '9862792737', 'ram56@gmail.com');
INSERT INTO person (Name, Address, Mobileno, Gmail)
VALUES ('Bim', 'Gwarko', '9807439367', 'Bim73@gmail.com');

UPDATE person
SET Name='Dinesh', Address='Chapagaun'
WHERE personID = 6;

SELECT *FROM person;

DELETE FROM person 
WHERE Name='Dinesh';

-- 11. Use Join queries:
---Country:
CREATE TABLE Country(
CountryId int IDENTITY(1,1) PRIMARY KEY,
CountryName varchar(255)
);

INSERT INTO Country(CountryName)
VALUES('China');
INSERT INTO Country(CountryName)
VALUES('India');
INSERT INTO Country(CountryName)
VALUES('Nepal');

SELECT * FROM Country;

DROP TABLE Country;

---State:
CREATE TABLE State(
StateId int IDENTITY(1,1) PRIMARY KEY,
CountryId int,
StateName varchar(255)
);
	
INSERT INTO State(CountryId, StateName)
VALUES(1, 'Benjing');
INSERT INTO State(CountryId, StateName)
VALUES(1, 'NewDelhi');
INSERT INTO State(CountryId, StateName)
VALUES(2, 'Kathmand');

SELECT * FROM State;

DROP TABLE State;

---People:
CREATE TABLE People(
PeopleID int IDENTITY(1, 1) PRIMARY KEY,
StateId int,
PeopleName varchar(255),
Wages int);

INSERT INTO People(StateId, PeopleName, Wages)
VALUES(1, 'Ram', 52000);
INSERT INTO People(StateId, PeopleName, Wages)
VALUES(2, 'Prabin', 35000);
INSERT INTO People(StateId, PeopleName, Wages)
VALUES(3, 'Yam', 62000);
	
SELECT * FROM People;

DROP TABLE People;

---1.) INNER JOIN:
SELECT * FROM Country
INNER JOIN State
ON Country.CountryId=State.CountryId

---2.) LEFT JOIN:
SELECT * FROM Country
LEFT JOIN State
ON Country.CountryId=State.CountryId

---3.) RIGHT JOIN:
SELECT * FROM Country
RIGHT JOIN State
ON Country.CountryId=State.CountryId

---4.) FULL OUTER JOIN:
SELECT *FROM Country
FULL OUTER JOIN State
ON Country.CountryId=State.CountryId
ORDER BY State.StateName;

-- 12. Use the MIN and MAX functions:
CREATE TABLE trade(
ProductID int IDENTITY(1,1)PRIMARY KEY,
Name varchar(255),
Price int);

INSERT INTO trade (Name, Price)
VALUES ('Rice', '1500');
INSERT INTO trade (Name, Price)
VALUES ('Chocolate', '100');
INSERT INTO trade (Name, Price)
VALUES ('Biscuit', '50');

SELECT *FROM trade;

-- i. MIN:
SELECT MIN(Price) AS SmallestPrice
FROM trade;

-- ii. MAX:
SELECT MAX(Price) AS LargestPrice
FROM trade;

-- 13. Use the COUNT, AVERAGE, and SUM functions:
CREATE TABLE trade(
ProductID int IDENTITY(1,1)PRIMARY KEY,
Name varchar(255),
Price int);

INSERT INTO trade (Name, Price)
VALUES ('Rice', '1500');
INSERT INTO trade (Name, Price)
VALUES ('Chocolate', '100');
INSERT INTO trade (Name, Price)
VALUES ('Biscuit', '50');

SELECT COUNT(Price)
FROM trade;

SELECT AVG(Price)
FROM trade;

SELECT SUM(Price)
FROM trade;

-- 14. Display students' names with "OR" letter in any position:

CREATE TABLE Student(
PersonID int IDENTITY(5,1)PRIMARY KEY,
Name varchar(255),
Address varchar(255));

INSERT INTO Student (Name, Address)
VALUES ('Orsha', 'talchikhel');
INSERT INTO Student (Name, Address)
VALUES ('Ram', 'Gwarko');
INSERT INTO Student (Name, Address)
VALUES ('Dinor', 'Lagankhel');
INSERT INTO Student (Name, Address)
VALUES ('Bimala', 'Patan');

SELECT *FROM Student;

SELECT *FROM Student
WHERE Name LIKE '%or%';

DROP TABLE Student;

-- 15. Display all customers that are not located in India and the USA:

CREATE TABLE Customer(
PersonID int IDENTITY(5,1)PRIMARY KEY,
Name varchar(255),
Country varchar(255));

INSERT INTO Customer (Name, Country)
VALUES ('Orsha', 'India');
INSERT INTO Customer (Name, Country)
VALUES ('Ram', 'Nepal');
INSERT INTO Customer (Name, Country)
VALUES ('Dinor', 'USA');
INSERT INTO Customer (Name, Country)
VALUES ('Bimala', 'China');

SELECT *FROM Customer;

SELECT *FROM Customer
WHERE NOT Country='India' AND NOT Country='USA';

DROP TABLE Customer;

-- 16. Display all orders with an OrderDate between '01-July-2020' and '31-July-2020':
CREATE TABLE Orders(
OrderID int IDENTITY(200,10)PRIMARY KEY, 
Name varchar(255),
Address varchar(255),
OrderDate varchar(255),
);
INSERT INTO Orders (Name, Address, OrderDate)
VALUES ('Rice', 'Talchhikhel','06-15-2020');
INSERT INTO Orders (Name, Address, OrderDate)
VALUES ('Wheat','Balkumari','04-30-2020');
INSERT INTO Orders (Name, Address, OrderDate)
VALUES ('Sunflower Oil','Chapagaun','02-08-2020');
INSERT INTO Orders (Name, Address, OrderDate)
VALUES ('Soyabean','Jaulakhel', '06-27-2020');

SELECT *FROM Orders;

Drop table Orders;

SELECT *FROM Orders
WHERE OrderDate BETWEEN '06-01-2020' AND '06-31-2020';

-- 17. Count the number of customers in each country:

CREATE TABLE Customer(
CustomerID int IDENTITY(5,1)PRIMARY KEY,
Name varchar(255),
Country varchar(255));

INSERT INTO Customer (Name, Country)
VALUES ('Orsha', 'India');
INSERT INTO Customer (Name, Country)
VALUES ('Ram', 'Nepal');
INSERT INTO Customer (Name, Country)
VALUES ('Dinor', 'Nepal');
INSERT INTO Customer (Name, Country)
VALUES ('Bimala', 'India');
INSERT INTO Customer (Name, Country)
VALUES ('Anish', 'India');

SELECT *FROM Customer;

SELECT COUNT(CustomerID),Country
FROM Customer
GROUP BY Country;

DROP TABLE Customer;

-- 18. Create a view to display all tourists from China:

CREATE TABLE  Tourists(
CustomerID int IDENTITY(5,1)PRIMARY KEY,
TouristName varchar(255),
Country varchar(255));

INSERT INTO Tourists (TouristName, Country)
VALUES ('Orsha', 'China');
INSERT INTO Tourists (TouristName, Country)
VALUES ('Ram', 'Nepal');
INSERT INTO Tourists (TouristName, Country)
VALUES ('Dinor', 'China');
INSERT INTO Tourists (TouristName, Country)
VALUES ('Bimala', 'India');
INSERT INTO Tourists (TouristName, Country)
VALUES ('Anish', 'China');

SELECT *FROM Tourists;

CREATE VIEW [China Tourists] AS
SELECT TouristName, Country
FROM Tourists
WHERE Country = 'China';

SELECT * FROM [China Tourists];

DROP TABLE Tourists;

-- 19. Create a stored procedure named "SelectAllStudents"that selects all records from 
--     the "Students" table:
CREATE TABLE Students(
StudentID int IDENTITY(100,11)PRIMARY KEY,
Name varchar(255),
Address varchar(255),
RollNO varchar(255));

INSERT INTO Students (Name, Address, RollNo)
VALUES ('Ram', 'Talchhikhel', '4006');
INSERT INTO Students (Name, Address, RollNo)
VALUES ('Logan', 'Patan', '4007');
INSERT INTO Students (Name, Address, RollNo)
VALUES ('Sandeep', 'Gwarko', '4008');

SELECT * FROM Students;

DROP TABLE Students;

CREATE PROCEDURE SelectAllStudents
AS
SELECT *FROM Students
GO;

EXEC SelectAllStudents; 

DROP PROCEDURE SelectAllStudents;

-- 20. Create a trigger that stores transaction records of each inserted operation on the 
--     Students table:

CREATE TABLE Students(
Id INT IDENTITY(100,11) PRIMARY KEY,
Name VARCHAR(45),
Salary INT,
Gender VARCHAR(12),
Department INT
);

INSERT INTO Students VALUES
('Raju', 82000,'Male',3),
('Rabina', 52000,'Female',2),
('Rani', 25000,'Female',1);

SELECT *FROM Students; 

DROP TABLE Students;

CREATE TABLE Students_Audit_Test(    
Id int IDENTITY,   
Audit_Action text);  

SELECT * FROM Students_Audit_Test; 

DROP TABLE Students_Audit_Test;

CREATE TRIGGER trInsertStudents   
ON Students  
FOR INSERT  
AS  
BEGIN  
Declare @Id int  
SELECT @Id = Id from inserted  
INSERT INTO Students_Audit_Test  
VALUES ('New Students with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is added at '
+ CAST(Getdate() AS VARCHAR(22)))  
END 

INSERT INTO Students VALUES ('Prabin', 5000, 'Male', 3)  
INSERT INTO Students VALUES ('Shyam', 6000, 'Male', 1)  

SELECT * FROM Students_Audit_Test;





 

