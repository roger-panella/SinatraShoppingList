CREATE DATABASE shopping_items;
\c shopping_items;
CREATE TABLE items(id SERIAL PRIMARY KEY, name VARCHAR(255), quantity INTEGER);
