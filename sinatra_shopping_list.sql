CREATE DATABASE sinatra_shopping_list;
\c sinatra_shopping_list
CREATE TABLE users (id SERIAL PRIMARY KEY, user_name TEXT, password_hash TEXT);
CREATE TABLE items (id SERIAL PRIMARY KEY, item_name TEXT, is_purchased BOOLEAN);
