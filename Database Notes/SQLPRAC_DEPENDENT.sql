-- Parent Table --
create table EMPLOYEE(
	Fname CHAR(20),
    Minit CHAR(2),
    Lname CHAR(10),
    Ssn CHAR(10) PRIMARY KEY,
    Bdate DATE,
    Address TEXT,
    Sex CHAR(1),
    Salary DECIMAL(10,2),
    Super_ssn INT,
    Dno TINYINT
);

-- Child Table --
create table DEPENDENT (
	Essn INT, -- primary key w/ Dependent_name --
	Dependent_name VARCHAR(20),
    Sex CHAR(6),
    Bdate DATE,
    Relationship CHAR(10) NOT NULL,
    PRIMARY KEY (Essn, Dependent_name), -- Creating multiple primary keys --
    FOREIGN KEY (EMPLOYEE) REFERENCES EMPLOYEE (Ssn)
);

desc dependent;
