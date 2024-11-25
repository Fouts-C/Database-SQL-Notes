-- Stored Procedure

CREATE PROCEDURE procedure_name (parameter1, parameter2…) 
BEGIN
    [procedure_body]
END


drop procedure if exists show_course(); -- Can drop procedure

delimeter %%
CREATE PROCEDURE show_course()
BEGIN
    SELECT * FROM course;
END
%%

delimeter ;

call show_course;

-- Differences between Procedure and Function
-- A function returns a single value directly to be used in an expression.
   -- A procedure does NOT return a value.
-- We cannot invoke a function with a CALL statement.
   -- We cannot invoke a procedure in an expression.
-- A function can use SELECT … INTO… to assign a value to a variable, but cannot include 
-- any query that returns a result set.
   -- Procedure can.
-- A function cannot have transactions.
   -- Procedure can.
   
-- Procedure doesn't contain a RETURN clause but CAN output a value

-- PROCEDURE PARAMETERS
 -- IN (default): The application passes an argument to the stored procedure.
 -- OUT: The stored procedure returns a final output to the passed argument.
 -- INOUT: The application passes an argument, and the procedure returns the output to the same argument.
 
 -- Getting course number usinb procedure
CREATE PROCEDURE given_name_get_number
	(IN nm CHAR(20), OUT nmb CHAR(10))
BEGIN
	SELECT course_number INTO nmb
	FROM course
	WHERE course_name=nm;
END;

show create procedure give_get_name_number;


call give_name_get_number('Database', @cname); -- Can never give constand to out/inout param

SHOW PROCEDURE STATUS;
SHOW PROCEDURE STATUS WHERE db=database_name;
SHOW PROCEDURE STATUS LIKE pattern;
SHOW CREATE PROCEDURE procedure_name;
DROP PROCEDURE procedure_name;

