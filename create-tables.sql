-- Customer Table
CREATE TABLE Customer (
    customer_id SERIAL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address1 VARCHAR(75),
    address2 VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    PRIMARY KEY (customer_id)
);

-- Roles table
CREATE TABLE Roles (
    role_id SERIAL,
    role_name VARCHAR(50),
    role_description VARCHAR(500),
    PRIMARY KEY (role_id)
);

-- Employee table
CREATE TABLE Employee (
    employee_id SERIAL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    role_id INT NOT NULL,
    address1 VARCHAR(75),
    address2 VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    active BOOLEAN NOT NULL,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

-- Car Table
CREATE TABLE Car (
    VIN VARCHAR(17),
    make VARCHAR(50) NOT NULL,
    model VARCHAR(100) NOT NULL,
    auto_year VARCHAR(4) NOT NULL,
    color VARCHAR(50) NOT NULL,
    new_used VARCHAR(15) CHECK (new_used IN ('new', 'used')) NOT NULL,
    price DECIMAL(10,2),
    salesperson_id INT,
    customer_id INT,
    PRIMARY KEY (VIN),
    FOREIGN KEY (salesperson_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Invoice Table
CREATE TABLE Invoice (
    invoice_id SERIAL,
    invoice_date DATE,
    total_amount DECIMAL(10,2) NOT NULL,
    customer_id INT,
    car_VIN VARCHAR(17),
    salesperson_id INT,
    PRIMARY KEY (invoice_id),
    FOREIGN KEY (car_VIN) REFERENCES Car(VIN),
    FOREIGN KEY (salesperson_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- ServiceTicket / Invoice Table (customer facing)
CREATE TABLE ServiceTicket (
    ticket_id SERIAL,
    car_VIN VARCHAR(17),
    customer_id INT,
    cust_description VARCHAR(250) NOT NULL,
    dropoff_date DATE NOT NULL,
    pickup_date DATE,
    amount_due DECIMAL(10,2),
    paid_status BOOLEAN,
    PRIMARY KEY (ticket_id),
    FOREIGN KEY (car_VIN) REFERENCES Car(VIN),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- ServiceHistory Table (dealership facing)
CREATE TABLE ServiceHistory (
    service_id SERIAL,
    customer_id INT,
    VIN VARCHAR(17),
    service_description VARCHAR(250),
    primary_mechanic INT NOT NULL,
    service_date DATE NOT NULL,
    charge DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (service_id),
    FOREIGN KEY (VIN) REFERENCES Car(VIN),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (primary_mechanic) REFERENCES Employee(employee_id)
);

-- MechanicServiceLink Table
CREATE TABLE MechanicServiceLink (
    mechanic_id INT,
    service_id INT,
    PRIMARY KEY (mechanic_id, service_id),
    FOREIGN KEY (mechanic_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (service_id) REFERENCES ServiceHistory(service_id)
);

-- Parts Table
CREATE TABLE Parts (
    part_id SERIAL,
    part_name VARCHAR(100) NOT NULL,
    description VARCHAR(250),
    stock_quantity INT,
    part_cost DECIMAL(10,2) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (part_id)
);

-- ServicePartsLink Table
CREATE TABLE ServicePartsLink (
    service_id INT,
    part_id INT,
    PRIMARY KEY (service_id, part_id),
    FOREIGN KEY (service_id) REFERENCES ServiceHistory(service_id),
    FOREIGN KEY (part_id) REFERENCES Parts(part_id)
);