-- CHECK TABLE
select * from bank_account;

-- RESET ACCOUNT BALANCES
UPDATE bank_account
SET balance = 1000
WHERE account_no = 1;

CREATE TABLE order_record (
    order_id INT AUTO_INCREMENT PRIMARY KEY, 
    account_no INT, 
    amount INT, 
    order_type CHAR(10),
    order_posted TINYINT,
    FOREIGN KEY (account_no) REFERENCES bank_account(account_no) 
);

delimiter &&

CREATE PROCEDURE new_order (a INT, m INT, t char(10))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
		select "Error! Transaction rolled back." AS message;
    END;
    
    START TRANSACTION;
    
    IF t = 'debit' THEN 
		UPDATE bank_account
        SET balance = balance - m 
        WHERE account_no = a;
        
        INSERT INTO order_record (account_no, amount, order_type, order_posted)
        VALUES (a, m, 'debit', 1);
	
    ELSEIF t = 'credit' THEN 
		INSERT INTO order_record (account_no, amount, order_type, order_posted)
        VALUES (a, m, 'credit', 0);
        
	else
		SIGNAL SQLSTATE 'ERROR' SET MESSAGE_TEXT = "Transaction type must be debit or credit!";
	
    END IF;
    
    COMMIT;
    
        
END
&&
delimiter ;

-- bank_account & order_record tables
select * from bank_account;
select * from order_record;


-- Testing Procedure
call new_order(1, 500, 'debit'); 
call new_order(1, 800, 'debit');
call new_order(1, -800, 'debit');
call new_order(2, 200, 'credit');
call new_order(3, 200, 'credit');
call new_order(2, 200, 'order');

