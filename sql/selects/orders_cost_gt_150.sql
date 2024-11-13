SELECT 
	c.customer_id,
    c.full_name,
    o.order_id,
    o.total_cost,
    o.menu_id,
    m.menu_name,
    i.course_name
FROM LittleLemonDM.orders o
INNER JOIN LittleLemonDM.customers c USING (customer_id)
INNER JOIN LittleLemonDM.menus m USING (menu_id)
INNER JOIN LittleLemonDM.menu_items i USING (menu_item_id)
WHERE o.total_cost > 150
ORDER BY o.total_cost;
