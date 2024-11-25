

create table STUDENT (
	Name VARCHAR(20) NOT NULL,
	Student_number TINYINT PRIMARY KEY,
	Class TINYINT,
    Major VARCHAR(20)
);

DESC STUDENT;

create table COURSE (
	Course_name VARCHAR(50) UNIQUE,
    Course_number VARCHAR(20) PRIMARY KEY,
    Credit_hours TINYINT NOT NULL DEFAULT 4,
    Department VARCHAR(20) NOT NULL
);


DESC COURSE;

create table SECTION (
	Section_identifier INT PRIMARY KEY,
    Course_number VARCHAR(20),
    Semester VARCHAR(20) NOT NULL,
    Year VARCHAR(20) NOT NULL,
    Instructor VARCHAR(20),
    FOREIGN KEY (Course_number) REFERENCES COURSE (Course_number)
);

DESC SECTION;

create table GRADE_REPORT (
	Student_number TINYINT,
	Section_identifier INT,
    Grade VARCHAR(1),
    PRIMARY KEY (Student_number, Section_identifier),
    FOREIGN KEY (Student_number) REFERENCES STUDENT (Student_number),
    FOREIGN KEY (Section_identifier) REFERENCES SECTION (Section_identifier)
);

DESC GRADE_REPORT;

create table PREREQUISITE (
	Course_number VARCHAR(20),
	Prerequisite_number VARCHAR(20),
    PRIMARY KEY (Course_number, Prerequisite_number),
    FOREIGN KEY (Course_number) REFERENCES COURSE (Course_number),
    FOREIGN KEY (Prerequisite_number) REFERENCES COURSE (Course_number)
);

DESC PREREQUISITE;

INSERT INTO STUDENT (Name, Student_number, Class, Major) VALUES
    ('Smith', 17, 1, 'CS'),
    ('Brown', 8, 2, 'CS');

    
SELECT * FROM STUDENT;
    
INSERT INTO COURSE (Course_name, Course_number, Credit_hours, Department) VALUES
    ('Intro to Computer Science', 'CS1310', 4, 'CS'),
	('Data Structures', 'CS3320', 4, 'CS'),
    ('Discrete Mathematics', 'MATH2410', 3, 'MATH'),
    ('Database', 'CS3380', 3, 'CS');

SELECT * FROM COURSE;

INSERT INTO SECTION (Section_identifier, Course_number, Semester, Year, Instructor) VALUES
    (85, 'MATH2410', 'Fall', '07', 'King'),
	(92, 'CS1310', 'Fall', '07', 'Anderson'),
    (102, 'CS3320', 'Spring', '08', 'Knuth'),
    (112, 'MATH2410', 'Fall', '08', 'Chang'),
    (119, 'CS1310', 'Fall', '08', 'Anderson'),
    (135, 'CS3380', 'Fall', '08', 'Stone');

SELECT * FROM SECTION;


INSERT INTO GRADE_REPORT (Student_number, Section_identifier, Grade) VALUES
    (17, 112, 'B'),
    (17, 119, 'C'),
    (8, 85, 'A'),
    (8, 92, 'A'),
    (8, 102, 'B'),
    (8, 135, 'A');
    
SELECT * FROM GRADE_REPORT;

INSERT INTO PREREQUISITE (Course_number, Prerequisite_number) VALUES
    ('CS3380', 'CS3320'),
    ('CS3380', 'MATH2410'),
    ('CS3320', 'CS1310');
    
SELECT * FROM PREREQUISITE;
    
UPDATE STUDENT SET Class = 1 WHERE Name = 'Brown';

INSERT INTO COURSE (Course_name, Course_number, Credit_hours, Department) VALUES
    ('Knowledge Engineering', 'CS4390', 3, 'CS');


INSERT INTO STUDENT (Name, Student_number, Class, Major) VALUES
    ('JOHNSON', 25, 1, 'MATH');

INSERT INTO GRADE_REPORT (Student_number, Section_identifier, Grade) VALUES
    (25, 85, 'C'), 
    (25, 112, 'A'); 

SELECT * FROM GRADE_REPORT;

SELECT Name FROM STUDENT WHERE Major = 'CS';

SELECT Semester, Year, COUNT(*) AS NumSections FROM SECTION GROUP BY Semester, Year;

SELECT 
    C.Course_name,
    S.Course_number,
    S.Semester,
    S.Year,
    COUNT(G.Student_number) AS NumStudents
FROM 
    SECTION S
    JOIN COURSE C ON S.Course_number = C.Course_number
    LEFT JOIN GRADE_REPORT G ON S.Section_identifier = G.Section_identifier
WHERE 
    S.Instructor = 'Anderson'
GROUP BY 
    C.Course_name, S.Course_number, S.Semester, S.Year;
    
SELECT Student_number FROM GRADE_REPORT WHERE Section_identifier IN (102, 135) GROUP BY Student_number
HAVING COUNT(DISTINCT Section_identifier) = 2;

SELECT 
    C.Course_name, 
    C.Course_number, 
    C.Credit_hours, 
    S.Semester, 
    S.Year, 
    G.Grade
FROM 
    STUDENT ST
JOIN 
    GRADE_REPORT G ON ST.Student_number = G.Student_number
JOIN 
    SECTION S ON G.Section_identifier = S.Section_identifier
JOIN 
    COURSE C ON S.Course_number = C.Course_number
WHERE 
    ST.Name = 'Smith';



SELECT DISTINCT S.Name FROM STUDENT S
JOIN GRADE_REPORT GR ON S.Student_number = GR.Student_number
JOIN PREREQUISITE P ON GR.Section_identifier IN (
    SELECT Section_identifier
    FROM SECTION
    WHERE Course_number = P.Prerequisite_number
)
WHERE P.Course_number = 'CS3380'
AND S.Student_number NOT IN (
    SELECT Student_number
    FROM GRADE_REPORT
    JOIN SECTION ON GRADE_REPORT.Section_identifier = SECTION.Section_identifier
    WHERE SECTION.Course_number = 'CS3380'
);





