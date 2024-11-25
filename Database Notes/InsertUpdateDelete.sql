-- INSERT
	-- Insert a row or several rows into a table

-- UPDATE
	-- Update a number of rows in a table that satisfy the condition
    -- UPDATE table_name SET field=value [WHERE condition];
    -- Beware of FOREIGN KEY CONSTRAINT

-- DELETE
	-- Remove rows
    -- DELETE FROM table_name [WHERE condition]; // works with DML works with data
    -- TRUNCATE is delete without where condition
    -- TRUNCATE TABLE table_name // works with DDL works with data structure resets auto_increment
    
-- IN CLASS PRACTICE
CREATE TABLE grade (
	id INT PRIMARY KEY AUTO_INCREMENT,
    student VARCHAR(20) NOT NULL,
    exam INT UNSIGNED
);

INSERT INTO grade (student, exam) VALUES
	('Tom', null),
    ('Jerry', 53),
    ('Mickey', 73),
    ('Minnie',98);
    
UPDATE grade SET exam = exam + 5;

UPDATE grade SET exam = 100 WHERE exam > 100;

UPDATE grade SET exam = 60 WHERE exam > 54 AND exam < 60;

DELETE FROM grade;
INSERT INTO grade (id, student, exam) VALUES (NULL, 'EXAMPLE STUDENT', 90);

TRUNCATE TABLE grade;
INSERT INTO grade (id, student, exam) VALUES (NULL, 'EXAMPLE STUDENT', 90);

select*from grade;