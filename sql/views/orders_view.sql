CREATE VIEW orders_view
AS SELECT 
    `orders`.`order_id` AS `order_id`,
    `orders`.`quantity` AS `quantity`,
    `orders`.`total_cost` AS `total_cost`
FROM
    `orders`
WHERE
    (`orders`.`quantity` > 2)
