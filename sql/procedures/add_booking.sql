USE LittleLemonDM;
DROP PROCEDURE IF EXISTS add_booking;
;

DELIMITER $$

USE LittleLemonDM$$
CREATE PROCEDURE add_booking(
	IN _date DATE,
    IN _num TINYINT,
    IN _person TINYINT,
    IN _id TINYINT
)
BEGIN
	DECLARE _bookingExists BOOLEAN DEFAULT FALSE;
    DECLARE _confirmation VARCHAR(18);
    SET _bookingExists = EXISTS (
		SELECT 1 
        FROM bookings 
        WHERE 
			table_number = _num
            AND booking_date = _date
    );
	START TRANSACTION;
    IF _bookingExists THEN
		ROLLBACK;
		SET _confirmation = 'Booking cancelled';
	ELSE
		INSERT INTO bookings VALUES (NULL, _person, _date, _num);
		COMMIT;
        SET _confirmation = 'New booking added';
	END IF;
    SELECT _confirmation 'Confirmation';
END$$

DELIMITER ;
;