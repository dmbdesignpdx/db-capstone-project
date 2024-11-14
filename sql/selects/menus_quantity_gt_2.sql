SELECT menu_name
FROM LittleLemonDM.menus
WHERE menu_id = ANY (
	SELECT menu_id
	FROM LittleLemonDM.orders
	WHERE quantity > 2
);
