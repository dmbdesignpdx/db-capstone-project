-- Note: This stored procedure was never actually introduced in the course. Yay.


USE LittleLemonDM;
DROP PROCEDURE IF EXISTS manage_booking;
;

DELIMITER $$

USE LittleLemonDM$$

CREATE PROCEDURE manage_booking(IN _date DATE, IN _num TINYINT)
BEGIN
	DECLARE _bookingExists BOOLEAN;
    SET _bookingExists = EXISTS (
		SELECT booking_date 
        FROM bookings 
        WHERE 
			table_number = _num
            AND booking_date = _date
	);
    IF _bookingExists THEN
		SELECT concat('Table ', _num, ' is already booked') 'Booking status';
    ELSE
		SELECT concat('Table ', _num, ' is not booked') 'Booking status';
    END IF;
END$$

DELIMITER ;
;
