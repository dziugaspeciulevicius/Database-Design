CREATE DATABASE join_practice;

CREATE TABLE EMPLOYEE (													/*<----- EMPLOYEE*/
	EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(20) NOT NULL,
    EmployeeSurname VARCHAR(20) NOT NULL,
    EmployeeAge INT NOT NULL,
    EmployeeEmail VARCHAR(30) NOT NULL UNIQUE,
    PhoneNo INT NOT NULL UNIQUE, 
    Address VARCHAR(40), 
	PRIMARY KEY(EmployeeID)
);
SELECT * FROM EMPLOYEE;
DESCRIBE EMPLOYEE;

CREATE TABLE CLIENTS (													/*<----- CLIENTS*/
	ClientID INT NOT NULL,
    ClientName VARCHAR(20) NOT NULL,
    ClientSurname VARCHAR(20) NOT NULL,
    ClientAge INT NOT NULL,
    ClientEmail VARCHAR(30) NOT NULL UNIQUE,
    PhoneNo INT NOT NULL UNIQUE, 
    Address VARCHAR(40), 
    EmployeeID INT NOT NULL,
	PRIMARY KEY(ClientID),
    FOREIGN KEY(EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
);
SELECT * FROM CLIENTS;
DESCRIBE CLIENTS;

CREATE TABLE PROJECT (													/*<----- PROJECT*/
	ProjectID INT NOT NULL,
    EmployeeID INT NOT NULL,
    ClientID INT NOT NULL,
    ProjectName VARCHAR(20) NOT NULL,
    ProjectStartDate DATE NOT NULL UNIQUE,
    PRIMARY KEY(ProjectID),
	FOREIGN KEY(EmployeeID) REFERENCES EMPLOYEE(EmployeeID),
	FOREIGN KEY(ClientID) REFERENCES CLIENTS(ClientID)
);
SELECT * FROM PROJECT;
DESCRIBE PROJECT;

/*--------------------------------------------------------------DATA INSERTION--------------------------------------------------------------*/

INSERT INTO EMPLOYEE(EmployeeID, EmployeeName, EmployeeSurname, EmployeeAge, EmployeeEmail, PhoneNo, Address) VALUES (1, 'Vardhan', 'Kumar', 22, 'vardv@abc.com', 867966666, 'Vilnius'); 
INSERT INTO EMPLOYEE(EmployeeID, EmployeeName, EmployeeSurname, EmployeeAge, EmployeeEmail, PhoneNo, Address) VALUES (2, 'Darius', 'Parkeris', 32, 'darpar@abc.com', 867919966, 'Kaunas'); 
INSERT INTO EMPLOYEE(EmployeeID, EmployeeName, EmployeeSurname, EmployeeAge, EmployeeEmail, PhoneNo, Address) VALUES (3, 'Saule', 'Butkute', 24, 'saulbut@abc.com', 867966656, 'Klaipeda'); 
INSERT INTO EMPLOYEE(EmployeeID, EmployeeName, EmployeeSurname, EmployeeAge, EmployeeEmail, PhoneNo, Address) VALUES (4, 'Dziugas', 'Rimkys', 25, 'dziurim@abc.com', 867965416, 'Siauliai'); 
INSERT INTO EMPLOYEE(EmployeeID, EmployeeName, EmployeeSurname, EmployeeAge, EmployeeEmail, PhoneNo, Address) VALUES (5, 'Rokas', 'Rimkus', 26, 'rokrim@abc.com', 867916666, 'Moletai'); 

INSERT INTO CLIENTS(ClientID, ClientName, ClientSurname, ClientAge, ClientEmail, PhoneNo, Address, EmployeeID) VALUES (1, 'Vardhan', 'Kumar', 22, 'vardv@abc.com', 867966666, 'Vilnius', 1); 
INSERT INTO CLIENTS(ClientID, ClientName, ClientSurname, ClientAge, ClientEmail, PhoneNo, Address, EmployeeID) VALUES (2, 'Pardhan', 'Bumar', 29, 'adfrdv@abc.com', 867943666, 'Vilnius', 2); 
INSERT INTO CLIENTS(ClientID, ClientName, ClientSurname, ClientAge, ClientEmail, PhoneNo, Address, EmployeeID) VALUES (3, 'Lardhan', 'Lumar', 30, 'vfgdv@abc.com', 867923466, 'Vilnius', 3); 
INSERT INTO CLIENTS(ClientID, ClientName, ClientSurname, ClientAge, ClientEmail, PhoneNo, Address, EmployeeID) VALUES (4, 'Mardhan', 'Jumar', 23, 'gfrdv@abc.com', 867965466, 'Vilnius', 3); 
INSERT INTO CLIENTS(ClientID, ClientName, ClientSurname, ClientAge, ClientEmail, PhoneNo, Address, EmployeeID) VALUES (5, 'GVardhan', 'Mumar', 18, 'vsdgdv@abc.com', 866536666, 'Vilnius', 4); 

INSERT INTO PROJECT(ProjectID, EmployeeID, ClientID, ProjectName, ProjectStartDate) VALUES (111, 1, 3, 'Project1', '2019-04-10'); 
INSERT INTO PROJECT(ProjectID, EmployeeID, ClientID, ProjectName, ProjectStartDate) VALUES (222, 2, 1, 'Project2', '2019-05-10'); 
INSERT INTO PROJECT(ProjectID, EmployeeID, ClientID, ProjectName, ProjectStartDate) VALUES (333, 3, 5, 'Project3', '2019-04-20'); 
INSERT INTO PROJECT(ProjectID, EmployeeID, ClientID, ProjectName, ProjectStartDate) VALUES (444, 3, 2, 'Project4', '2019-04-30'); 
INSERT INTO PROJECT(ProjectID, EmployeeID, ClientID, ProjectName, ProjectStartDate) VALUES (555, 5, 4, 'Project5', '2019-10-10'); 
INSERT INTO PROJECT(ProjectID, EmployeeID, ClientID, ProjectName, ProjectStartDate) VALUES (666, 4, 1, 'Project6', '2019-12-15'); 
INSERT INTO PROJECT(ProjectID, EmployeeID, ClientID, ProjectName, ProjectStartDate) VALUES (777, 5, 2, 'Project7', '2019-03-19'); 
INSERT INTO PROJECT(ProjectID, EmployeeID, ClientID, ProjectName, ProjectStartDate) VALUES (888, 3, 3, 'Project8', '2019-01-10'); 
INSERT INTO PROJECT(ProjectID, EmployeeID, ClientID, ProjectName, ProjectStartDate) VALUES (999, 2, 2, 'Project9', '2019-02-01'); 

/*-----------------------------------------------------------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------WRITTING JOINS--------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------*/

/*--------------------------------------------------------------INNER JOIN--------------------------------------------------------------*/
/*This type of join returns those records which have matching values in both tables*/
SELECT Employee.EmployeeID, Employee.EmployeeName, Employee.EmployeeSurname, Project.ProjectID, Project.ProjectName
FROM Employee
INNER JOIN Project ON Employee.EmployeeID=Project.EmployeeID;

/*--------------------------------------------------------------LEFT JOIN--------------------------------------------------------------*/
/*Returns all recors from the left table and also those records which satisfy the condition from the right table*/
SELECT Employee.EmployeeName, Employee.EmployeeSurname, Project.ProjectID, Project.ProjectName
FROM Employee
LEFT JOIN Project ON Employee.EmployeeID = Project.EmployeeID;

/*--------------------------------------------------------------RIGHT JOIN--------------------------------------------------------------*/
/*Same as left join, just opposite*/
SELECT Employee.EmployeeName, Employee.EmployeeSurname, Project.ProjectID, Project.ProjectName
FROM Employee
RIGHT JOIN Project ON Employee.EmployeeID = Project.EmployeeID;

/*--------------------------------------------------------------FULL JOIN--------------------------------------------------------------*/
/*Returns all records which either have a matching values in the left table or the right table*/
SELECT Employee.EmployeeName, Employee.EmployeeSurname, Project.ProjectID
FROM Employee
LEFT JOIN Project ON Employee.EmployeeID = Project.EmployeeID
UNION /*HAS A KEYWORD UNION IN BETWEEN BOTH TABLES*/
SELECT Employee.EmployeeName, Employee.EmployeeSurname, Project.ProjectID
FROM Employee
RIGHT JOIN Project ON Employee.EmployeeID = Project.EmployeeID;