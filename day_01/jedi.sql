-- Delete table if already exists
DROP TABLE lightsabers;
DROP TABLE jedi;
-- Create TABLE
CREATE TABLE jedi (
  name VARCHAR(255),
  age INT2,
  darkside BOOLEAN,
  id SERIAL4 PRIMARY KEY
);

CREATE TABLE lightsabers (
  hilt_metal VARCHAR(255) NOT NULL,
  colour VARCHAR(255) NOT NULL,
  owner_id INT4 REFERENCES jedi(id),
  id SERIAL4 PRIMARY KEY
);

-- Should thrown a error due to the NOT NULL
-- INSERT INTO lightsabers (
--   colour
-- ) VALUES (
--   'red'
-- );

-- Add some data to the table with INSERT INTO () VALUES ()
INSERT INTO jedi (
  name,
  age,
  darkside
) VALUES (
  'Mace Windu',
  56,
  false
);

INSERT INTO jedi (
  name,
  age
) VALUES (
  'Darth Vader',
  102
);

INSERT INTO jedi (
  name,
  age,
  darkside
) VALUES (
  'Anakin',
  12,
  false
);

INSERT INTO jedi(
  name,
  age,
  darkside
) VALUES (
  'Obiwan',
  32,
  false
);

INSERT INTO jedi (
  name,
  age,
  darkside
) VALUES (
  'Quigon Jin',
  80,
  false
);

INSERT INTO jedi (
  name,
  age,
  darkside
) VALUES (
  'Obiwan',
  67,
  false
);

INSERT INTO jedi (
  name
) VALUES (
  'MR POOPY BUTT'
);

INSERT INTO lightsabers (
  hilt_metal,
  colour,
  owner_id
) VALUES (
  'palladium',
  'green',
  5
);

INSERT INTO lightsabers (
  hilt_metal,
  colour,
  owner_id
) VALUES (
  'silver',
  'blue',
  7
);

-- Update tablename set attr = new_value
UPDATE jedi SET darkside = false;

-- Can specify with WHERE
-- Using AND keyword matches both
UPDATE jedi SET darkside = true
WHERE name = 'Darth Vader' AND age = 102;


-- Can set multiple attrs in a single UPDATE
UPDATE jedi SET darkside=true, age=22
WHERE name='Anakin';

UPDATE jedi SET age=33
WHERE name='Obiwan' AND age=32;

DELETE FROM jedi WHERE name = 'MR POOPY BUTT';


SELECT * FROM jedi;
SELECT * FROM lightsabers;
-- SELECT name FROM jedi;
-- SELECT COUNT(*) FROM jedi;
