-- Create a function SafeDiv that divides two numbers
-- and returns 0 if the divisor is 0.
DELIMITER //

CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
    IF b = 0 THEN
        RETURN 0;
    END IF;
    RETURN a / b;
END //

DELIMITER ;
