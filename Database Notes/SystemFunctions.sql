-- System Function

-- Numeric
CEIL(number) -- rounds up to nearest number
FLOOR(number) -- rounds down to nearest number
ROUND(number) -- Basic rounding logic
ROUND(number, digits) -- keeps digits after decimal | Can be negative ex: 349, -2 = 300
SELECT TRUNCATE(3.14159, 0);  -- Result: 3 -- simply cuts off digits after the specified decimal place without rounding.
RAND()
truncate (rand()*20 + 10);

-- String
LENGTH(string)
CHAR_LENGTH(string)
CONCAT(string1, string2,...)

LTRIM(string) -- Trims left side
RTRIM(string) -- Trims right side
TRIM('   Hello World   ');  -- Result: 'Hello World'
TRIM(BOTH 'x' FROM 'xxxHello Worldxxx');  -- Result: 'Hello World'



LEFT(string, length) -- extracts first 'length' characters
RIGHT(string, length) -- extracts last 'length' characters
SUBSTRING(string, start, length) -- Typical substring function

-- Time function
select now();
NOW([0<=n<=6])
CURDATE()
CURTIME()

YEAR(time)
MONTH(time)
DAYOFMONTH(time)
WEEKDAY(time)
HOUR(time)
MINUTE(time)
SECOND(time)
MICROSECOND(time);


-- Changing time zones
CONVERT_TZ(time, current_timezone, target_timezone)
CONVERT_TZ(NOW(), 'UTC', 'America/New_York')

-- Conditional 
IF(condition, value1, value2)
select if (1 > 2, 'yes', 'no');

IFNULL(value1, value2)
	-- If value1 is null, then return value2, else return value1.