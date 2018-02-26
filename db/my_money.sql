DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;

CREATE TABLE merchants (
  id SERIAL4 PRIMARY KEY,
  merchant_name VARCHAR(255) NOT NULL
);

CREATE TABLE tags (
  id SERIAL4 PRIMARY KEY,
  tag_name VARCHAR(255) NOT NULL
);

CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  amount NUMERIC,
  merchant_id INT4 REFERENCES merchants,
  tag_id INT4 REFERENCES tags,
  trans_date DATE
);
