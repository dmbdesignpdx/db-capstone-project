PREPARE get_order_detail 
FROM 'SELECT order_id, quantity, total_cost FROM orders WHERE order_id = ?';

SET @id2 = 6;

EXECUTE get_order_detail USING @id2;
