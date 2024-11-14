USE `LittleLemonDM`;
DROP procedure IF EXISTS `add_valid_booking`;
;

DELIMITER $$
USE `LittleLemonDM`$$
CREATE PROCEDURE `add_valid_booking`(IN _date DATE, IN _num TINYINT)
BEGIN
	DECLARE _bookingExists BOOLEAN DEFAULT FALSE;
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
        SELECT concat('Table ', _num, ' is already booked -- booking cancelled') 'Booking status';
	ELSE
		INSERT INTO bookings
        VALUES (NULL, 0, _date, _num);
		COMMIT;
        SELECT concat('Table ', _num, ' is available -- booking successful') 'Booking status';
	END IF;
END$$

DELIMITER ;
;

