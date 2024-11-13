DELIMITER $$

CREATE PROCEDURE cancel_order(IN _id INT)
BEGIN
	SELECT CONCAT('Order ', _id, ' is cancelled') confirmation;
END$$

DELIMITER ;
