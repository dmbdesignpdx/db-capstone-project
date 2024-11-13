DELIMITER $$

CREATE PROCEDURE check_booking(IN _date DATE, IN _num TINYINT)
BEGIN
	DECLARE _check BOOLEAN;
    SET _check = EXISTS (
		SELECT booking_date 
        FROM bookings 
        WHERE 
			table_number = _num
            AND booking_date = _date
	);
    IF _check THEN
		SELECT concat('Table ', _num, ' is already booked') 'Booking status';
    ELSE
		SELECT concat('Table ', _num, ' is not booked') 'Booking status';
    END IF;
END$$

DELIMITER ;
