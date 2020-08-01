/* 1. View Menu Item List Admin (TYUC001)*/
	
    /* 1.a. Frame insert scripts to add data into menu_item table. Refer View Menu Item List Admin screen below for sample data.*/
    
    insert into menu_items
	values(1, 'Sandwich', 99.00, 'Yes',  '2017-03-15', 'Main Course', 'Yes'),
	(2, 'Burger', 129.00, 'Yes',  '2017-12-23', 'Main Course', 'No'),
	(3, 'Pizza', 149.00, 'Yes',  '2017-08-21', 'Main Course', 'No'),
	(4, 'French Fries', 57.00, 'No',  '2017-07-02', 'Starters', 'Yes'),
	(5, 'Chocolate Brownie', 32.00, 'Yes',  '2022-11-02', 'Dessert', 'Yes');
	
    /* 1.b. Frame SQL query to get all menu items */
	
    select * from menu_items;

/* 2. View Menu Item List Customer (TYUC002)*/

	/* 2.a. Frame SQL query to get all menu items which after launch date and is active.*/
    
	select * from menu_items
	where menu_Active="Yes" AND menu_date<= trunc(current_date);

/* 3. Edit Menu Item (TYUC003) */
	
    /* 3.a. Frame SQL query to get a menu items based on Menu Item Id */
    
    select * from menu_items 
	where menu_id = "1";

	/* 3.b. Frame update SQL menu_items table to update all the columns values based on Menu Item Id */
    
	update menu_item 
	set menu_name='Samosa',
	menu_price=10.0,me_category='Starters'
	where menu_id=2;


/* 4. Add to Cart (TYUC004) */
	
    /* 4.a. Frame insert scripts for adding data into user and cart tables.In user table create two users. Once user will not have any entries in cart, while the other will have at least 3 items in the cart. */
    
    insert into user
	values
	(1, 'Rishabh Sharma'),
	(2, 'Aman Jalan');

	insert into cart
	values (1,1),
	(1,2),(1,3);


/* 5. View Cart (TYUC005) */
	
    /* 5.a. Frame SQL query to get all menu items in a particular user’s cart */
    
	select m.menu_name, m.menu_free_delivery, m.menu_price, m.menu_category
	from menu_item m
	inner join cart c on m.menu_id = c.menu_id
	where c.user_id = 1; 

	/* 5.b. Frame SQL query to get the total price of all menu items in a particular user’s cart */
    
	select sum(m.menu_price) as Total from menu_item m
	inner join cart c on m.menu_id = c.menu_id
	where c.user_id = 1; 

 /* 6. Remove Item from Cart (TYUC006) */
	
    /* 6.a. Frame SQL query to remove a menu items from Cart based on User Id and Menu Item Id */
	
    delete from cart where user_id=1 and menu_id=2; 



