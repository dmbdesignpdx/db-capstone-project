USE LittleLemonDM;
DROP PROCEDURE IF EXISTS cancel_booking;
;

DELIMITER $$

USE LittleLemonDM$$
CREATE PROCEDURE cancel_booking(IN _id TINYINT)
BEGIN
	DECLARE _bookingExists BOOLEAN DEFAULT FALSE;
    DECLARE _confirmation VARCHAR(15);
    SET _bookingExists = EXISTS (
		SELECT 1 
        FROM bookings 
        WHERE booking_id = _id
    );
    START TRANSACTION;
    IF _bookingExists THEN
		DELETE FROM bookings
		WHERE booking_id = _id;
		COMMIT;
        SET _confirmation = 'cancelled';
    ELSE
		ROLLBACK;
        SET _confirmation = 'does not exist';
    END IF;
    SELECT concat('Booking ', _id, ' ', _confirmation) 'Confirmation';
END$$

DELIMITER ;
;
