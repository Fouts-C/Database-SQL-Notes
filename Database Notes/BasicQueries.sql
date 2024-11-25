	-- Basic Queries --
    
-- SELECT <field list>    - Always shows result table
-- FROM <table list>     (Optional, very common)
-- WHERE <condition>     (Optional, very common)
-- [GROUP BY <grouping field>]      Optional -> rest
-- [ORDER BY <ordering field>]
-- [LIMIT [start] length]



	-- Options for select statement --
-- 	 *   - all data    

-- 	field_name list   - comma-separated list of field names

-- 	table_name.*   -all data from a specific table

-- 	table_name.field_name    -specific field from a specific table

-- 	expression   -function, calculation


select version(); -- How to get the database version
select now(); -- How to get the current time
select version(), now(); -- Differentiating columns
select version() as Version, now() "Current Time"; -- naming columns (as can be ignored)

CREATE TABLE grade2(
	stu_no INT PRIMARY KEY,
	exam INT,
	quiz INT
);

INSERT INTO grade2 VALUES
	(1, 95, 85),
	(2, 87,94);

select * from grade2;

select exam from grade2; 

select stu_no, exam from grade2;

select stu_no, exam*0.7+quiz*0.3 from grade2;

select *, 'CS' as 'Major' from grade2;

 -- Distinct keyword --
SELECT DISTINCT table_schema, table_type FROM tables; -- Removes duplicates

	  -- WHERE <Condition> --
   
   -- Comparison operator
		-- =, <, <=, >, >=, and <>
	
    -- Logical operator
		-- AND, OR, NOT
        
	-- A BASIC QUERY --
SELECT Fname, Lname, Address FROM EMPLOYEE, DEPARTMENT WHERE Dname = ‘Research’ AND Dnumber = Dno;
    
    -- Use Alias in the FROM Clause
SELECT E.Fname, E.Lname, S.Fname, S.Lname
FROM EMPLOYEE AS E, EMPLOYEE AS S -- A way to give an alias to employee
WHERE E.Super_ssn = S.Ssn;

-- EMPLOYEE AS E(Fn, Mi, Ln, Ssn, Bd, Addr, Sex, Sal, Sssn, Dno)

-- Pattern Mathcing --
	-- % replaces an arbitrary number of zero or more characters
	-- _ replaces a single character


--    LIKE    --
	-- WHERE Address LIKE ‘%Houston,TX%’;
	-- WHERE Ssn LIKE ‘_ _ 1_ _ 8901’;

--     BETWEEN     --
	-- WHERE (Salary BETWEEN 30000 AND 40000) AND Dno = 5;
    
    
-- Order of Query Results --
	-- ORDER BY clause
	-- DESC specifies descending order
	-- ASC specifies ascending order (default)    

select * from grade2;
SELECT stu_no, exam, quiz, exam * 0.7 + quiz * 0.3 total FROM grade2
	order by exam * 0.7 + quiz * 0.3;
  
-- Limit
	--  [start,] length //Limits pages show, start param is optional

select * from information_schema.tables
	limit 61, 10;

    
