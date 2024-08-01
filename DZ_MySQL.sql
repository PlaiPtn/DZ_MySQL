USE lesson_1;


DELIMITER $$
CREATE FUNCTION time_interval(n INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE day INT DEFAULT 0;
	DECLARE hour INT DEFAULT 0;
	DECLARE minute INT DEFAULT 0;
	DECLARE second INT DEFAULT 0;
	DECLARE result VARCHAR(100);
    
    SET second = n % 60;
    SET minute = (n DIV 60) % 60;
    SET hour = n DIV (60 * 60) % 24;
    SET day = n DIV (60 * 60 * 24);
    
    SET result = CONCAT(day , ' days ' , hour , ' hours ' , minute , ' minutes ' , second, ' seconds ');
    RETURN result;

END $$
DELIMITER ;
SELECT time_interval(123456);


DELIMITER $$
CREATE PROCEDURE even(n INT)
BEGIN
    DECLARE result VARCHAR(200) DEFAULT '';
    IF n % 2 != 0 THEN
        SET n = n - 1;
    END IF;

    SET result = n;

	WHILE n > 2 DO
		SET n = n - 2;
		SET result = CONCAT(n, ',', result);
	END WHILE;
    
    SELECT result;
END $$
DELIMITER ;

CALL even(7);
