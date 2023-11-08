CREATE OR REPLACE FUNCTION new_car_sale(
    p_customer_first_name VARCHAR(50),
    p_customer_last_name VARCHAR(50),
    p_customer_address1 VARCHAR(75),
    p_customer_address2 VARCHAR(50),
    p_customer_phone VARCHAR(20),
    p_customer_email VARCHAR(100),
    p_car_vin VARCHAR(17),
    p_car_make VARCHAR(50),
    p_car_model VARCHAR(100),
    p_car_auto_year VARCHAR(4),
    p_car_color VARCHAR(50),
    p_car_new_used VARCHAR(15),
    p_car_price DECIMAL(10,2),
    p_salesperson_id INT
)
RETURNS VOID AS $$
    DECLARE new_customer_id INT;
BEGIN
    --Insert Customer table data
    INSERT INTO Customer(first_name, last_name, address1, address2, phone, email)
    VALUES (p_customer_first_name, p_customer_last_name, p_customer_address1, p_customer_address2, p_customer_phone, p_customer_email)
    RETURNING customer_id INTO new_customer_id;

    --Insert Car table data
    INSERT INTO Car(vin, make, model, auto_year, color, new_used, price, salesperson_id, customer_id)
    VALUES (p_car_vin, p_car_make, p_car_model, p_car_auto_year, p_car_color, p_car_new_used, p_car_price, p_salesperson_id, new_customer_id);

    --Insert Invoice table data
    INSERT INTO Invoice(invoice_date, total_amount, customer_id, car_vin, salesperson_id)
    VALUES (CURRENT_DATE, p_car_price, new_customer_id, p_car_vin, p_salesperson_id);

END;
$$ LANGUAGE plpgsql;

SELECT new_car_sale(
    'Robert',
    'Frost',
    '123 Theoretical Physicist Avenue',
    NULL,
    '987-654-3210',
    'stephenhawk@quantum.com',
    '1HGCM834HIW9WQ125',
    'Audi',
    'Q6',
    '2023',
    'Silver',
    'new',
    55000.00,
    7
);

-- Error in function, needed to delete entries.  This is the first time documenting deletions, but will moving forward

DELETE FROM invoice 
WHERE car_vin = '1HGCM834HIW9WQ125';

DELETE FROM car 
WHERE vin = '1HGCM834HIW9WQ125';

DELETE FROM customer 
WHERE first_name = 'Robert';



