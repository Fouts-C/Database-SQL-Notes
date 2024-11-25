-- JOIN --
  
  -- INNER JOIN -- Combines two or more TABLES based on a COLUMN related between them

    SELECT Fname, Lname, Address FROM (EMPLOYEE JOIN DEPARTMENT ON Dno = Dnumber)
    Dname = 'Research';
    
	SELECT columns
	FROM table1
	INNER JOIN table2
	ON table1.common_column = table2.common_column;

   
   
   -- NATURAL JOIN -- automatically joins tables based on all columns with the same name and datatype in both tables.
   SELECT Fname, Lname, Address FROM (EMPLOYEE NATURAL JOIN 
	(DEPARTMENT AS DEPT(Dname, Dno, Mssn, Msdate)))
    Dname = 'Research';
    
    SELECT columns
	FROM table1
	NATURAL JOIN table2;


-- OUTER JOIN
   -- RIGHT JOIN -- Keeps columns in right table and columns in both
      -- returns all rows from the right table, and the matched rows from the left table.
      -- If no match is found, NULL values are returned for columns from the left table.
	SELECT columns
	FROM table1
	RIGHT JOIN table2
	ON table1.common_column = table2.common_column;

  
  -- LEFT JOIN -- Keeps columns in left table and columns in both
     -- returns all rows from the left table, and the matched rows from the right table. 
     -- If no match is found, NULL values are returned for columns from the right table.
   select e.lname as employee_name, s.lname as supervisor_name
   from employee e join employee s on e.super_ssn=s.ssn;
   
    SELECT columns
	FROM table1
	LEFT JOIN table2
	ON table1.common_column = table2.common_column;

  -- IMPLICIT JOIN -- a way to join tables without explicitly using the JOIN keyword. 
  -- Instead, you list the tables in the FROM clause and specify the join condition in the WHERE clause.
	SELECT columns
	FROM table1, table2
	WHERE table1.common_column = table2.common_column;

  -- NESTED JOIN -- (also known as a subquery join) in MySQL involves using a subquery within 
  -- the FROM clause to create a temporary table that can then be joined with another table. 
  -- This can be useful for complex queries where you need to filter or aggregate data before joining.

	SELECT columns
	FROM (SELECT columns FROM table1 WHERE condition) AS temp_table
	JOIN table2
	ON temp_table.common_column = table2.common_column;

-- FULL JOIN (MySQL does not support)

-- JOIN EXAMPLE --
CREATE TABLE t1(
    id INT,
    NAME CHAR(1),
    STATUS CHAR(1)
);
CREATE TABLE t2(
    id INT,
    mobile CHAR(5)
);

INSERT INTO t1 VALUES
    (1, 'a', '1'),
    (2, 'b', '1'),
    (3, 'c', '1'),
    (4, 'd', '1'),
    (5, 'e', '1'),
    (6, 'f', '0'),
    (7, 'g', '0'),
    (8, 'h', '0'),
    (9, 'i', '0'),
    (10, 'j', '0');

INSERT INTO t2 VALUES
    (1,'12345'),
    (2,'23456'),
    (3,'34567'),
    (16,'67890'),
    (17,'78901'); 

SELECT * FROM t1 INNER JOIN t2 ON t1.id = t2.id AND t1.status = '1';
SELECT * FROM t1 INNER JOIN t2 ON t1.id = t2.id WHERE t1.status = '1';

SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id AND t1.status = '1' AND t2.id<3;
SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id WHERE t1.status = '1' AND t2.id<3;

SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id AND t2.id<3 WHERE t1.status = '1';
SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id AND t1.status = '1' WHERE t2.id<3;

-- Set Operation (Union, Union All(Includes Overlaps), Intersect, Except(Set Difference))
SELECT col FROM t1
UNION ALL
SELECT col FROM t2
ORDER BY col;
-- result sets of all queries must be the same number of columns


-- Full outer Join (emulated in MySQL)
SELECT * FROM
t1 LEFT JOIN t2 ON t1.id = t2.id
UNION
SELECT * FROM
t1 RIGHT JOIN t2 ON t1.id = t2.id