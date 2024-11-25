-- Trigger Practice
delimiter &&
create trigger preventDeleteCS before delete on courseex for each row
begin
	if left(old.course_number, 2) = 'CS' then
		signal sqlstate 'ERROR' set message_text = 'Do not delete CS course!!!';
    end if;
end
&&
delimiter ;

delete from courseex where course_number = 'CS2440';