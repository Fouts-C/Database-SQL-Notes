-- Homework 7 -- 

select * from courseEx;

drop function if exists getCourse;

DELIMITER %%

CREATE FUNCTION getCourse(course_num CHAR(6))
RETURNS CHAR(20)
BEGIN
    DECLARE courseName CHAR(20);

    SELECT course_name
    INTO courseName
    FROM courseEx
    WHERE course_number = course_num;

    RETURN courseName;
END %%
DELIMITER ;

SELECT getCourse('CS3430');

-- Create the Grade table
CREATE TABLE GradeEx (
    student VARCHAR(20) PRIMARY KEY,
    quiz INT,
    exam INT
);

-- Insert the data into the Grade table
INSERT INTO GradeEx (student, quiz, exam) VALUES 
('Tom', 95, 85),
('Jerry', 87, 93),
('Mickey', NULL, 88),
('Minnie', 91, NULL);

DELIMITER %%

CREATE FUNCTION getFinalGrade(studentName CHAR(10))
RETURNS INT
BEGIN
    DECLARE finalGrade INT;

    SELECT ROUND(IFNULL(quiz, 0) * 0.3 + IFNULL(exam,0) * 0.7)
    INTO finalGrade
    FROM GradeEx
    WHERE student = studentName;

    RETURN finalGrade;
END %%
DELIMITER ;

SELECT getFinalGrade('Mickey');

select * from report;

DELIMITER %%

CREATE FUNCTION getCourseAvgGrade(courseName CHAR(20))
RETURNS INT
BEGIN
    DECLARE avgGrade INT;

    SELECT ROUND(AVG(grade))
    INTO avgGrade
    FROM report
    WHERE course = courseName;

    RETURN avgGrade;
END %%
DELIMITER ;

SELECT student, course, grade
FROM report
WHERE grade > getCourseAvgGrade('Database');




