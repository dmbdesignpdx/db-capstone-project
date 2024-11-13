DELIMITER $$

CREATE PROCEDURE LittleLemonDM.get_max_quantity()
BEGIN
	SELECT MAX(quantity) 'Max Quantity in Order'
    FROM LittleLemonDM.orders;
END$$

DELIMITER ;
