-- Homework 8 -- 
DELIMITER &&

CREATE PROCEDURE getWeekday (IN dateIN DATE)
	BEGIN
		DECLARE weekdayInt INT;
        
        set weekdayInt = WEEKDAY (dateIn);
        
		CASE weekdayInt
			WHEN 0 THEN SELECT 'Monday' AS Weekday;
			WHEN 1 THEN SELECT 'Tuesday' AS Weekday;
			WHEN 2 THEN SELECT 'Wednesday' AS Weekday;
			WHEN 3 THEN SELECT 'Thursday' AS Weekday;
			WHEN 4 THEN SELECT 'Friday' AS Weekday;
			WHEN 5 THEN SELECT 'Saturday' AS Weekday;
			WHEN 6 THEN SELECT 'Sunday' AS Weekday;
		END CASE;
	END &&
DELIMITER ;

SET @dateTest = '2024-11-20';
CALL getWeekday(@dateTest);


DELIMITER &&

CREATE PROCEDURE getSum (IN intN INT, OUT returnSum INT)
BEGIN
	DECLARE i INT DEFAULT 1;

	IF inTN <= 1 THEN
        SELECT 'Number must be greater than 1' AS ErrorMessage;
        SET returnSum = NULL;
    ELSE
        SET returnSum = 0;
        
        WHILE i <= intN DO
			SET returnSum = returnSum + i;
            SET i = i + 1;
		END WHILE;
	END IF;
END &&

DELIMITER ;

CALL getSum (6, @sumReturn); 
SELECT @sumReturn;



CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(20),
    author VARCHAR(20),
    price DECIMAL(10, 2),
    stock INT
);

CREATE TABLE inventoryBooks (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    stock INT,
    FOREIGN KEY (book_id) REFERENCES books(book_id) 
);

delimiter &&

create trigger newBook after insert on books for each row
begin
	INSERT INTO inventoryBooks (book_id, stock) VALUES (NEW.book_id, NEW.stock);
end&&
delimiter ;


DELIMITER &&

CREATE TRIGGER deleteBook AFTER DELETE ON books FOR EACH ROW
BEGIN
    DELETE FROM inventory WHERE book_id = OLD.book_id;
END&&

DELIMITER ;

INSERT INTO books (title, author, price, stock) VALUES ('First Book', 'Bob', 20.99, 10);
INSERT INTO books (title, author, price, stock) VALUES ('Second Book','John', 15.99, 5);


