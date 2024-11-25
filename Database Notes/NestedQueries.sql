     -- NESTED QUERY (WHERE) --

-- How to retrieve average grade --
SELECT AVG(exam_grade) FROM exam;
-- How to retrieve students with grade lower than average
SELECT stu_no FROM exam
WHERE
	exam_grade < (SELECT AVG(exam_grade) FROM exam);
   
   
   -- EXAMPLE
CREATE TABLE instructorEx(
      instructor_no INT PRIMARY KEY,
      instructor_name CHAR(20),
      phone CHAR(10)
);
CREATE TABLE courseEx(
      course_no INT PRIMARY KEY,
      course_number CHAR(6),
      course_name CHAR(50),
      credit_hours INT,
      instructor_no INT,
      FOREIGN KEY (instructor_no) REFERENCES instructorEx (instructor_no)
);

INSERT INTO instructorEx VALUES
      (1, 'Tom', '1111111111'), 
      (2, 'Jerry', '2222222222'), 
      (3, 'Mickey', '3333333333');
      
INSERT INTO courseEx VALUES
      (1, 'CS3430', 'Database', 3, 1), 
      (2, 'CS4755', 'Machine Learning', 3, 1), 
      (3, 'CS1440', 'Java', 3, 2);

-- Finding instructor not teaching using join
SELECT instructor_name from instructorEx left join courseEx on instructorEx.instructor_no = courseEx.instructor_no
where course_no is null;
      
-- Using a nested query
SELECT instructor_no FROM courseEx;

select instructor_name from instructorEx
where instructor_no not in
	(select instructor_no from courseEX where instructor_no is not null);
    
insert into courseEx values (4, 'CS2440', 'Advanced Java', 3, null);

-- Keywords in where clause
   -- All compares all the values in a query (salary > all(select etc.) -- Salary greater than query max
   -- Any
   -- Exists 

     -- NESTED QUERY (FROM) --
     
use information_schema;
     
select * from 
	(select table_schema, count(*) cnt from tables
    group by table_schema) as tbl -- you need alias to represent alias in from clause
where cnt>20;

-- Complementary to Subqueries

WITH virtual_table (field_list) AS (query)
-- If we need to invoke a nested query repeatedly
-- WITH clause defines a temporary table that will be used only in one query and then dropped.

VIEW
-- If we want to store a nested query
-- A view is a single table that is derived from other tables or views.
--  view is considered to be a virtual table, in contrast to base tables.
-- VIEW does NOT take up additional storage space.
CREATE VIEW view_name(fields list)
AS
query

     -- Index --
-- data structure used to locate data without scanning all the rows in a table
CREATE TABLE t_index(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uid INT NOT NULL,
    name CHAR(20) NOT NULL
);

CREATE <UNIQUE|FULLTEXT> INDEX index_name ON table_name (field<(length)>);

-- Both at same time
CREATE TABLE table_name(
	field type <constraints>
	…
	<constraints>
	 <UNIQUE|FULLTEXT> INDEX <index_name> (field<(length)>)
);

DROP INDEX index_name ON table_name;
