USE LittleLemonDM;
DROP PROCEDURE IF EXISTS update_booking;
;

DELIMITER $$

USE LittleLemonDM$$
CREATE PROCEDURE update_booking(IN _id TINYINT, IN _date DATE)
BEGIN
	DECLARE _bookingExists BOOLEAN DEFAULT FALSE;
    DECLARE _confirmation VARCHAR(20);
    SET _bookingExists = EXISTS (
		SELECT 1 
        FROM bookings 
        WHERE booking_id = _id
    );
	START TRANSACTION;
    IF _bookingExists THEN
		UPDATE bookings
		SET booking_date = _date
		WHERE booking_id = _id;
		COMMIT;
        SET _confirmation = 'updated';
	ELSE
		ROLLBACK;
        SET _confirmation = 'does not exist';
	END IF;
    SELECT concat('Booking ', _id, ' ', _confirmation) 'Confirmation';
END$$

DELIMITER ;
;