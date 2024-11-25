-- In class Excercise: 

DELIMITER %%

CREATE PROCEDURE given_name_get_number (INOUT nameIn CHAR(20))
	BEGIN
		DECLARE courseNum CHAR(8);
        
		SELECT course_number INTO courseNum
		FROM course
		WHERE course_name = nameIN;
        
        SET nameIn = courseNum;
	END %%
DELIMITER ;

SET @ClassNameToNum = 'Database';
CALL given_name_get_number(@ClassNameToNum);
SELECT @ClassNameToNum;