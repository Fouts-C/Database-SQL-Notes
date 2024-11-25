-- DATA MANIPULATION LANGUAGE (DML)--

-- INSERT --
-- INSERT INTO table_name [fields list] VALUES (values list);

-- use varchar for part and name and use string for cell (part = parent)

CREATE TABLE PARTS (
	id INT PRIMARY KEY AUTO_INCREMENT,
    part VARCHAR(20)
);

CREATE TABLE STUDENTS (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    cell VARCHAR(10),
    part_id INT,
    FOREIGN KEY (part_id) REFERENCES PARTS(id)
);

INSERT INTO PARTS (part) VALUES 
	('Soprano'),
    ('Alto'),
    ('Tenor'),
    ('Bass');

INSERT INTO STUDENTS (name, cell, part_id) VALUES
	('Tom', '1112223333', 4),
    ('Jerry', '8884447777', 3),
    ('Mickey', '2225556666', 3),
    ('Minnie', '6663332222', 1),
    ('Goofy', '7776669999', 4);
 
select*from parts;
select*from students;


INSERT INTO students1 SELECT * FROM students;

select*from students1;

drop table if exists students;
drop table if exists parts;
    
    