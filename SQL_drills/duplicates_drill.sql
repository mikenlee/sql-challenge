DROP TABLE IF EXISTS vendor_table;

CREATE TABLE vendor_table (
	id SERIAL PRIMARY KEY,
	yarn_name VARCHAR(30) NOT NULL,
	yarn_type VARCHAR(30) NOT NULL,
	grams INT NOT NULL,
	color INT NOT NULL,
	lot INT NOT NULL,
	qty INT NOT NULL,
	vendor_id INT NOT NULL
);
-- Insert data
INSERT INTO vendor_table (yarn_name, yarn_type, grams, color, lot, qty, vendor_id )
VALUES
  ('Merino Supreme', 'Worsted', 50, 8, 76123, 1, 1),
  ('Cartwheel', 'Bulky', 200, 2, 1801, 2, 2),
  ('Paloma Tweed', 'Super Bulky', 50, 42513, 63978, 2, 3),
  ('Heritage', 'Sock', 100, 5640, 1707058, 1, 3),
  ('Heritage', 'Sock', 100, 5640, 1707058, 2, 3)
;

SELECT 
    grams, yarn_name, count(*)
FROM 
    vendor_table
GROUP BY 
    grams, yarn_name
HAVING count(*) > 1;
