-- Transaction
-- Consider money transfer

-- Bank example
CREATE TABLE bank_account(
    account_no INT PRIMARY KEY AUTO_INCREMENT,
    account_name CHAR(20) NOT NULL,
    balance INT UNSIGNED
);

INSERT INTO bank_account VALUES
	(1, 'Tom', 1000),
	(2, 'Jerry', 1000);
    
    
delimiter &&

CREATE PROCEDURE transfer (IN from_account INT, IN to_account INT, IN money INT)
BEGIN
	UPDATE bank_account SET balance = balance + money
	WHERE account_no = to_account;
	UPDATE bank_account SET balance = balance - money
	WHERE account_no = from_account;
END;
&&
delimiter ;

select * from bank_account;

-- Will take 800 out of tom's account and put it into jerry's
CALL transfer(1, 2, 800);
-- If called again, error will occur because balance can't be negative BUT
-- 800 will still be added to Jerry
select * from bank_account;

-- Transaction: A sequential group of statements, queries, or operations to 
-- perform as a single work unit.

-- AUTOCOMMIT is on by default
show variables like 'AUTOCOMMIT';
-- Turn off autocommit
SET AUTOCOMMIT = 0;

-- When AUTOCOMMIT is off, users can recall the update operation:
	ROLLBACK;

-- Users can manually commit changes:
	COMMIT;
-- Implicitly COMMIT:
SET AUTOCOMMIT = 1; 
BEGIN
TRUNCATE table
ALTER table
end;

-- START TRANSACTION
-- When in a PROCEDURE
START TRANSACTION;
-- Implicitly turn off AUTOCOMMIT

DELIMITER &&

CREATE PROCEDURE transfer (IN from_account INT, IN to_account INT, IN money INT)
BEGIN
	delcare exit handler for 1690 rollback; -- multiple statements needs begin & end
    START TRANSACTION;
    UPDATE bank_account SET balance = balance + money WHERE account_no = to_account;
    UPDATE bank_account SET balance = balance - money WHERE account_no = from_account;
    COMMIT;
END;
&&
DELIMITER ;

-- Rollback to savepoint
SAVEPOINT save_point_name;

ROLLBACK TO SAVEPOINT save_point_name;

	-- Handler -- 
-- Handling ERROR -- Try/catch block java -- IN SQL:
DECLARE <CONTINUE/EXIT> HANDLER FOR error;

-- Error codes: https://mariadb.com/kb/en/mariadb-error-code-reference/

-- Syntax
DECLARE action HANDLER FOR condition_value statement;
-- action
	-- CONTINUE
	-- EXIT
-- condition_value
	-- Predefined condition: SQLWARNING, NOT FOUND, SQLEXCEPTION
	-- Error code
	-- Named condition

-- Example: find balance based on name
select * from bank_account;

select balance from bank_account where account_name;

DELIMITER &&

CREATE PROCEDURE find_balance (nm char(20), out blc int)
BEGIN
	declare exit handler for not found
    begin -- Need this to do multiple statements in handler
		insert into bank_account values (null, nm, 0);
		select concat('There is no record for ', nm, '!') message;
	end;
	select balance into blc from bank_account where account_name=nm;
END;
&&
DELIMITER ;

-- Named Condition
-- Before the error handler, define a customized condition
DECLARE error_name CONDITION FOR error_code;
-- Set up the error handler using this named condition
DECLARE <CONTINUE/EXIT> HANDLER FOR error_name;

-- Multi-Error Handler
DECLARE <CONTINUE/EXIT> HANDLER FOR error1 statements;
DECLARE <CONTINUE/EXIT> HANDLER FOR error2 statements;

-- ACID (Atomicity, Consistency, Isolation, Durability)
-- Set of properties that guarantee database transactions are processed reliably

-- Isolation Levels:

SHOW VARIABLES WHERE VARIABLE_NAME = 'transaction_isolation’; 

SET transaction_isolation=SERIALIZABLE;
