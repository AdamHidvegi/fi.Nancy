DROP TABLE transactions;
DROP TABLE users;
DROP TABLE merchants;
DROP TABLE categories;

CREATE TABLE users
(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  wallet FLOAT8,
  email VARCHAR(255)
);

CREATE TABLE merchants
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE categories
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions
(
  id SERIAL8 PRIMARY KEY,
  today_date DATE,
  price FLOAT8,
  user_id INT8 REFERENCES users(id) ON DELETE CASCADE,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  category_id INT8 REFERENCES categories(id) ON DELETE CASCADE
);
