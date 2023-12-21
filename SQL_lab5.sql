use sakila;

-- 1. Drop column picture from staff.
ALTER TABLE staff DROP COLUMN picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO customer (store_id, first_name, last_name, email, address_id)
VALUES ('1', 'TAMMY', 'SANDERS', 'TAMMY.SANDERS@sakilacustomer.com','1');

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1
INSERT INTO rental (rental_date, inventory_id, customer_id, return_date, staff_id)
VALUES (CURDATE(), (SELECT inventory_id 
                     FROM inventory 
                     WHERE film_id = (SELECT film_id 
                                      FROM film 
                                      WHERE title = 'Academy Dinosaur' 
                                      LIMIT 1) 
                     LIMIT 1), 5, NULL, 1);
                     
 -- 4. 
 -- 4.1
SELECT customer_id, email
FROM customer
WHERE status = 'inactive';

-- 4.2
CREATE TABLE deleted_users (
    customer_id INT,
    email VARCHAR(255),
    deletion_date DATE
);

-- 4.3
INSERT INTO deleted_users (customer_id, email, deletion_date)
VALUES (customer_id_value, 'email_value', CURDATE());

-- 4.4
DELETE FROM customer
WHERE status = 'inactive';