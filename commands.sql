-- create database ;
    CREATE DATABASE portfolio;

-- connect to database
    \c portfolio;

-- create table for Admin
    CREATE TABLE users (
        id SERIAL PRIMARY KEY,
        first_name VARCHAR(255) NOT NULL,
        last_name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL,
        role VARCHAR(255) NOT NULL,
        token VARCHAR(255),
        activated BOOLEAN DEFAULT false,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- CREATE TABLES FOR THE SELLERS
    CREATE TABLE sellers (
        id SERIAL PRIMARY KEY,
        first_name VARCHAR(255) NOT NULL,
        last_name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL,
        company_name VARCHAR(255) NOT NULL,
        country VARCHAR(255) NOT NULL,
        contact VARCHAR(255) NOT NULL,
        business_category VARCHAR(255) NOT NULL,
        token VARCHAR(255),
        activated BOOLEAN DEFAULT false,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- CREATE TABLES FOR THE SHOPPERS
    CREATE TABLE shoppers (
        id SERIAL PRIMARY KEY,
        email VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL,
        token VARCHAR(255),
        activated BOOLEAN DEFAULT false,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    );

-- CREATE TABLES FOR THE PRODUCTS
    CREATE TABLE products (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(255) NOT NULL,
        price VARCHAR(255) NOT NULL,
        quantity VARCHAR(255) NOT NULL,
        image VARCHAR(255) NOT NULL,
        category VARCHAR(255) NOT NULL,
        seller_id INTEGER REFERENCES sellers(id),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- CREATE TABLES FOR THE industries
    CREATE TABLE industries (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(255) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- CREATE TABLES FOR THE categories
    CREATE TABLE categories (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(255) NOT NULL,
        industry_id INTEGER REFERENCES industries(id),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- CREATE TABLES FOR THE ORDERS
    CREATE TABLE orders (
        id SERIAL PRIMARY KEY,
        product_id INTEGER REFERENCES products(id),
        shopper_id INTEGER REFERENCES shoppers(id),
        quantity VARCHAR(255) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- CREATE TABLES FOR THE CARTS
    CREATE TABLE carts (
        id SERIAL PRIMARY KEY,
        product_id INTEGER REFERENCES products(id),
        shopper_id INTEGER REFERENCES shoppers(id),
        quantity VARCHAR(255) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- CREATE TABLES FOR THE REVIEWS
    CREATE TABLE reviews (
        id SERIAL PRIMARY KEY,
        product_id INTEGER REFERENCES products(id),
        shopper_id INTEGER REFERENCES shoppers(id),
        review VARCHAR(255) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    
       

-- drop TABLES
    DROP TABLE IF EXISTS users;

-- INSERT DATA
    INSERT INTO users (first_name,last_name, email, password,role) VALUES ('John','Doe' 'flexywork327@gmail.com', '123456','admin');

-- SELECT DATA
    SELECT * FROM users;

-- Delete DATA
    DELETE FROM users WHERE id = 1;

-- Show items in table
    SELECT * FROM users;

-- update items in table
    UPDATE users SET first_name = 'John' WHERE id = 1;    