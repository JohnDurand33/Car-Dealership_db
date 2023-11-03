-- Roles table data
INSERT INTO roles (role_name, role_description) VALUES
    ('Salesperson', 'Handles car sales'),
    ('Mechanic', 'Performs car repairs and services'),
    ('Manager', 'Manages dealership operations'),
    ('Custodian', 'Cleans and maintains facilities'),
    ('Receptionist', 'Assists with customer inquiries');

-- Customer table data
INSERT INTO customer (first_name, last_name, address1, address2, phone, email) VALUES
    ('John', 'Doe', '123 Main St', 'Apt 4B', '555-123-4567', 'johndoe@gmail.com'),
    ('Jane', 'Smith', '456 Elm St', NULL, '555-987-6543', 'janesmith@netzero.com'),
    ('Bob', 'Johnson', '789 Oak St', NULL, '555-555-5555', 'bobjohnson@aol.com');

-- Employee table data
INSERT INTO employee (first_name, last_name, hire_date, role_id, address1, address2, phone, email, active) VALUES
    ('Samantha', 'Wallace', '2023-01-15', 1, '321 Pine St', NULL, '555-111-1111', 'samantha@cardealership.com', true),
    ('Mike', 'Delaney', '2023-02-10', 2, '222 Spruce St', NULL, '555-222-2222', 'mike@cardealership.com', true),
    ('Emily', 'Evans', '2023-03-20', 2, '333 Cedar St', NULL, '555-333-3333', 'emily@cardealership.com', true),
    ('David', 'Nobles', '2022-12-01', 3, '444 Birch St', NULL, '555-444-4444', 'david@cardealership.com', true),
    ('Lisa', 'Kudrow', '2023-01-25', 4, '555 Oak St', NULL, '555-555-5555', 'lisa@cardealership.com', true),
    ('Rebecca', 'Paine', '2023-02-18', 5, '666 Willow St', NULL, '555-666-6666', 'rebecca@cardealership.com', true),
    ('Mark', 'Vervaet', '2023-03-15', 1, '777 Maple St', NULL, '555-777-7777', 'mark@cardealership.com', true);

-- Car table data
INSERT INTO car (VIN, make, model, auto_year, color, new_used, price, salesperson_id, customer_id) VALUES
    ('1HGCM82633A123456', 'Honda', 'Accord', 2023, 'Silver', 'new', 25000.00, 1, 1),
    ('1FAFP34P02W123789', 'Ford', 'Focus', 2022, 'Red', 'used', 15000.00, 7, 2),
    ('2GCEC19V641234567', 'Chevrolet', 'Silverado', 2023, 'Black', 'new', 35000.00, 1, 3);

-- Invoice tabledata
INSERT INTO invoice (invoice_date, total_amount, customer_id, car_VIN, salesperson_id) VALUES
    ('2023-01-20', 25000.00, 1, '1HGCM82633A123456', 1),
    ('2023-02-15', 15000.00, 2, '1FAFP34P02W123789', 7),
    ('2023-03-10', 35000.00, 3, '2GCEC19V641234567', 1);

-- ServiceTicket table data
INSERT INTO serviceticket (car_VIN, customer_id, cust_description, dropoff_date, pickup_date, amount_due, paid_status) VALUES
    ('1HGCM82633A123456', 1, 'Routine maintenance', '2023-01-25', '2023-01-27', 200.00, true),
    ('1FAFP34P02W123789', 2, 'Brake repair', '2023-02-20', '2023-02-22', 300.00, true),
    ('2GCEC19V641234567', 3, 'Oil change', '2023-03-15', '2023-03-16', 100.00, true);

-- ServiceHistory table data
INSERT INTO servicehistory (customer_id, VIN, service_description, primary_mechanic, service_date, charge) VALUES
    (1, '1HGCM82633A123456', 'Routine maintenance', 2, '2023-01-26', 200.00),
    (2, '1FAFP34P02W123789', 'Brake repair', 3, '2023-02-21', 300.00),
    (3, '2GCEC19V641234567', 'Oil change', 2, '2023-03-16', 100.00);

-- Parts table data
INSERT INTO parts (part_name, description, stock_quantity, part_cost, price) VALUES
    ('Brake Pads', 'Front brake pads for various models', 50, 20.00, 40.00),
    ('Oil Filter', 'Standard oil filter for most vehicles', 100, 5.00, 10.00),
    ('Spark Plugs', 'Spark plugs for gas-powered engines', 75, 2.00, 4.00),
    ('Air Filter', 'Air filter for engine air intake', 60, 10.00, 20.00),
    ('Transmission Fluid', 'Automatic transmission fluid', 30, 8.00, 16.00);

-- MechanicServiceLink table data
INSERT INTO mechanicservicelink (mechanic_id, service_id) VALUES
    (2, 1),
    (3, 2),
    (2, 3);

-- ServicePartsLink table data
INSERT INTO ServicePartsLink (service_id, part_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (3, 4);