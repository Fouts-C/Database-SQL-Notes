-- Trigger --
-- Is an automatic action that the database system will perform when certain 
-- events and conditions occur.
-- Used to monitor table

CREATE TRIGGER trigger_name <BEFORE/AFTER> <event>
ON table_name FOR EACH ROW
BEGIN
    <trigger_body>
END;

-- NEW & OLD
-- NEW.field refers to new value (insert & update)
-- OLD.field refers to old value (update & delete)

-- Signal
SIGNAL SQLSTATE 'ERROR' SET MESSAGE_TEXT = 'the error message';

-- Example: restrict course to only accept CS courses

delimiter &&
delimiter &&
create trigger check_insert_course before insert on courseex for each row
begin
	if left(new.course_number, 2) <> 'CS' then
		signal sqlstate 'ERROR' set message_text = 'Do not insert a non-CS course!!!';
    
    end if;
end
&&
delimiter ;

INSERT INTO course VALUES (…) -- WIll get custom error
-- However you can still update values to non-CS courses

CREATE TRIGGER check_course_number_before_update_trigger
BEFORE UPDATE
ON course FOR EACH ROW
BEGIN
IF LEFT(NEW.course_number, 2) <> 'CS' THEN
	SET NEW.course_number = OLD.course_number;
END IF;
END;

-- Triggers Management
SHOW TRIGGERS;
SHOW TRIGGERS LIKE pattern;
SHOW CREATE TRIGGER trigger_name;
DROP TRIGGER trigger_name;
