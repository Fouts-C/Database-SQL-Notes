-- Create the REPORT table
CREATE TABLE REPORT (
    student VARCHAR(50),
    course VARCHAR(50),
    grade INT
);

-- Insert data into the REPORT table
INSERT INTO REPORT (student, course, grade) VALUES
('Tom', 'Java', 75),
('Tom', 'Database', 89),
('Jerry', 'Database', 64),
('Jerry', 'Machine Learning', 83),
('Jerry', 'Neural Network', 53),
('Mickey', 'Java', 95),
('Mickey', 'Database', 89),
('Mickey', 'Machine Learning', 91),
('Mickey', 'Algorithm', 83);


SELECT student, course FROM REPORT WHERE grade < 60;

SELECT course, AVG(grade) AS avgGrade FROM REPORT GROUP BY course;

SELECT course, student, grade FROM REPORT check1 WHERE grade = (SELECT MAX(grade) FROM REPORT check2 WHERE check2.course = check1.course);


SELECT student FROM REPORT WHERE course IN ('Java', 'Database') GROUP BY student HAVING COUNT(DISTINCT course) = 2;

SELECT student, course, grade AS gradeAbvAvg FROM REPORT WHERE grade > (SELECT AVG(grade) FROM REPORT);









