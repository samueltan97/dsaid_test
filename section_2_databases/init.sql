\c car_db;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;
CREATE TABLE public.manufacturers (
    manufacturer_id uuid PRIMARY KEY,
    manufacturer_name varchar(255),
    manufacturer_phone_number varchar(255)
);
CREATE TABLE public.customers (
    customer_id uuid PRIMARY KEY,
    customer_name varchar(255),
    customer_phone_number varchar(255)
);
CREATE TABLE public.salespersons (
    salesperson_id uuid PRIMARY KEY,
    salesperson_name varchar(255),
    salesperson_phone_number varchar(255)
);
CREATE TABLE public.cars (
    car_id uuid PRIMARY KEY,
	manufacturer_id uuid NOT NULL,
	is_used boolean NOT NULL,
    model_name varchar(255) NOT NULL,
    model_variant varchar(255) NOT NULL,
	weight float NOT NULL,
	engine_cubic_capacity float NOT NULL,
	price float NOT NULL,
	FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);
CREATE TABLE public.transactions (
    transactionid uuid PRIMARY KEY,
    customer_id uuid NOT NULL,
    salesperson_id uuid NOT NULL,
	car_id uuid NOT NULL,
	transaction_date timestamp NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY (salesperson_id) REFERENCES salespersons(salesperson_id),
	FOREIGN KEY (car_id) REFERENCES cars(car_id)
);