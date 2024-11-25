-- SQL Programming

-- Session Variable -- AKA GLOBAL VARIABLE
	-- The period of time between a client logging in (connecting to) a MySQL database 
	-- and the client logging out (exiting) the MySQL database.
set @v = 1;
set @v = 'Tom'; -- Can switch system variable data type
set @v = @v + 1;
select @v;

-- Local Variable - Must declare before using
-- Must be defined in a stored procedure or function
-- Can only scope in the procedure
DECLARE variable_name data_type [DEFAULT variable_value]

-- Assigning using select
SELECT @variable_name := variable_value;
SELECT variable_value INTO @variable_name; -- Without showing result table

-- Beginning End --  works as curly braces in java
[statement_label]
BEGIN
    [DECLARE local_declaration]
    [statement list]
    [EXCEPTION exception_case]
END [statement_label]

-- Delimiter -- Mark the end of a statemnt (;)
-- used to end statements in a function to compile procedure as a single statement
DELIMITER $$
SELECT * FROM information_schema.tables$$

-- Function
CREATE FUNCTION function_name (parameter1, parameter2…) -- param treated as local var
RETURNS returned_datatype
BEGIN
    [body]
END

-- Example
delimiter &&
CREATE FUNCTION row_no_fn () RETURNS INT
BEGIN
    SET @row_no=@row_no+1;
    RETURN @row_no;
END;
&&
delimiter ; -- Changing dilimiter back to ;

-- Calling Function
SET @row_no = 0;
SELECT row_no_fn(), course_number, course_name FROM course;

CREATE TABLE courseSP (
	id INT, 
    course_number,
    course_name
);




-- In-class Exercise - Create a function 
-- that returns the course number given the course name using the following table course.
CREATE TABLE courseSP (
	id INT, 
    course_number,
    course_name
);

delimiter &&
CREATE FUNCTION row_no_fn () RETURNS INT
BEGIN
    SET @row_no=@row_no+1;
    RETURN @row_no;
END;
&&
delimiter ; -- Changing dilimiter back to ;