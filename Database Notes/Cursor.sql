-- Cursor -- 
-- A cursor is a construct that allows you to iterate/traverse the result table of a query.
-- By using a cursor, we can step through the results of a query 
-- and perform certain operations on each row. (Read-Only & nonscrollable)

-- Declare a cursor
DECLARE cursor_name CURSOR FOR select_statement;
-- Open a cursor
OPEN cursor_name;
-- Extract data
FETCH cursor_name INTO variable[, variable2…];
-- Close a cursor
CLOSE cursor_name;


-- Grade Example
select * from gradeex;
ALTER TABLE gradeex ADD final INT;

INSERT INTO gradeex VALUES
(1, 95, 85, 0),
(2, 87,94, 0), 
(3, 92, NULL, 0), 
(4, NULL, 90, 0);

-- Choose higher (quiz/exam) grade as final grade
delimiter &&

create PROCEDURE final_proc()
BEGIN
	-- Declare local variables
    declare nm varchar(20);
    declare ex int;
    declare qz int;
    declare end_marker tinyint default 0;
    
    -- Declare cursors
    declare csr cursor for select student, quiz, exam from gradeex;
    
    -- Declare handler
    declare continue handler for not found set end_marker = 1;
    
    -- Open cursor
    open csr;
    
    -- Iterate cursor
    while end_marker <> 1 do
		fetch csr into nm, qz, ex;
		if ex > qz or qz is null then 
			update gradeex set final = ex where student = nm;
		else
			update gradeex set final = qz where student = nm;
		end if;
	end while;
	
    -- Close csr
    close csr;

END&&

delimiter ;

select * from gradeex;
CALL final_proc();