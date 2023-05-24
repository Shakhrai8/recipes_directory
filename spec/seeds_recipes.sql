TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, average_time, rating) VALUES ('Pizza', 20, 4.5);
INSERT INTO recipes (name, average_time, rating) VALUES ('Salad', 5, 3.7);