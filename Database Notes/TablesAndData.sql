-- CREATING THE TABLES --
drop table if exists employee;
CREATE TABLE EMPLOYEE (
    Fname CHAR(20),
    Minit CHAR(2),
    Lname CHAR(10),
    Ssn CHAR(10) PRIMARY KEY,
    Bdate DATE,
    Address TEXT,
    Sex CHAR(1),
    Salary DECIMAL(10,2),
    Super_ssn CHAR(10),
    Dno TINYINT,
    CONSTRAINT fk_super_ssn FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn)
);


CREATE TABLE DEPARTMENT (
    Dname CHAR(20),
    Dnumber TINYINT PRIMARY KEY,
    Mgr_ssn CHAR(10),
    Mgr_start_date DATE,
    CONSTRAINT fk_mgr_ssn FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn)
);

ALTER TABLE EMPLOYEE ADD CONSTRAINT fk_dno FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber);

DESC EMPLOYEE;
DESC DEPARTMENT;

create table DEPT_LOCATIONS (
	Dnumber TINYINT,
    Dlocation CHAR(20),
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT (Dnumber)
);

DESC DEPT_LOCATIONS;

create table PROJECT (
	Pname CHAR (20),
    Pnumber TINYINT PRIMARY KEY,
    Plocation CHAR (20),
    Dnum TINYINT,
    FOREIGN KEY (Dnum) REFERENCES DEPARTMENT (Dnumber)
);

DESC PROJECT;

create table WORKS_ON (
	Essn CHAR (10),
    Pno TINYINT,
    Hours DECIMAL(3, 1),
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES EMPLOYEE (Ssn),
    FOREIGN KEY (Pno) REFERENCES PROJECT (Pnumber)
);

DESC WORKS_ON;

CREATE TABLE DEPENDENT (
    Essn CHAR(10),  
    Dependent_name VARCHAR(20),
    Sex CHAR(6),
    Bdate DATE,
    Relationship CHAR(10),
    PRIMARY KEY (Essn, Dependent_name),
    FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn)
);


DESC DEPENDENT;


-- INSERTING THE DATA --

INSERT INTO DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date) VALUES
    ('Research', 5, NULL, '1988-05-22'),
    ('Administration', 4, NULL, '1995-01-01'),
    ('Headquarters', 1, NULL, '1981-06-19');
    
SELECT * FROM DEPARTMENT;

INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) VALUES
    ('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5),
    ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5),
    ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4),
    ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4),
    ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5),
    ('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5),
    ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4),
    ('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, 1);

SELECT * FROM EMPLOYEE;


UPDATE DEPARTMENT SET Mgr_ssn = '333445555' WHERE Dnumber = 5;

UPDATE DEPARTMENT SET Mgr_ssn = '987654321' WHERE Dnumber = 4;

UPDATE DEPARTMENT SET Mgr_ssn = '888665555' WHERE Dnumber = 1;

SELECT * FROM DEPARTMENT;
    
INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum) VALUES
	('ProductX', 1, 'Bellaire', 5),
    ('ProductY', 2, 'Sugarland', 5),
    ('ProductZ', 3, 'Houston', 5),
    ('Computerization', 10, 'Stafford', 4),
    ('Reorganization', 20, 'Houston', 1),
    ('Newbenefits', 30, 'Stafford', 4);

SELECT * FROM PROJECT;
    
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation) VALUES
	(1, 'Houston'),
    (4, 'Stafford'),
    (5, 'Bellaire'),
    (5, 'Sugarland'),
    (5, 'Houston');

SELECT * FROM DEPT_LOCATIONS;
    
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES
	('123456789', 1, 32.5),
    ('123456789', 2, 7.5),
    ('666884444', 3, 40.0),
    ('453453453', 1, 20.0),
    ('453453453', 2, 20.0),
    ('333445555', 2, 10.0),
    ('333445555', 3, 10.0),
    ('333445555', 10, 10.0),
    ('333445555', 20, 10.0),
    ('999887777', 30, 30.0),
    ('999887777', 10, 10.0),
    ('987987987', 10, 35.0),
    ('987987987', 30, 5.0),
    ('987654321', 30, 20.0),
    ('987654321', 20, 15.0),
    ('888665555', 20, NULL);

SELECT * FROM WORKS_ON;
    
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES
	('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
    ('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
    ('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
    ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse'),
    ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
    ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');
    
SELECT * FROM DEPENDENT;
    

    
    
    
    
    
    
    
    
    