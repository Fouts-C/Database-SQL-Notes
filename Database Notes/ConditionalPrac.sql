-- Conditional Practice

select * from courseex;

INSERT INTO courseEX (course_no, course_number, course_name, credit_hours, instructor_no)
VALUES
    (5, 'MAT224', 'Linear Algebra', 3, 3);

desc courseex;
DELIMITER %%

CREATE PROCEDURE checkCS(IN courseName VARCHAR(20))
BEGIN
    DECLARE courseNum CHAR(8);

    SELECT course_number INTO courseNum
	FROM courseEx
	WHERE course_name = courseName;
    
    SET courseName = courseNum; -- changing courseName to num

    IF LEFT(courseName, 2) = 'CS' THEN
        SELECT CONCAT('The course "', courseName, '" with course number ', courseNum, ' is a Computer Science course.') AS conclusion;
    ELSE
        SELECT CONCAT('The course "', courseName, '" with course number ', courseNum, ' is NOT a Computer Science course.') AS conclusion;
    END IF;
END %%

DELIMITER ;

SET @csCheck = 'Linear Algebra';
CALL checkCS(@csCheck);