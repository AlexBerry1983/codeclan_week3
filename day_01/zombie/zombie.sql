DROP TABLE bites;
DROP TABLE victims;
DROP TABLE zombies;

CREATE TABLE victims (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  fav_weapon VARCHAR(255),
  speed INT2
);

CREATE TABLE zombies (
  id SERIAL8 PRIMARY KEY,
  ex_name VARCHAR(255),
  type VARCHAR(255)
);

CREATE TABLE bites (
  id SERIAL4 PRIMARY KEY,
  zombie_id INT8 REFERENCES zombies(id),
  victim_id INT8 REFERENCES victims(id),
  infected_on DATE NOT NULL
);

INSERT INTO victims (
  name,
  fav_weapon,
  speed
) VALUES (
  'John',
  'Chainsaw',
  5
);

INSERT INTO victims(
  name,
  fav_weapon,
  speed
) VALUES (
  'Mark',
  'sword',
  7
);

INSERT INTO victims(
  name,
  fav_weapon,
  speed
) VALUES (
  'Mari',
  'knife',
  12
);

INSERT INTO victims (
  name,
  fav_weapon,
  speed
) VALUES (
  'Thomas',
  'javlin',
  10
);

INSERT INTO zombies(
  ex_name,
  type
) VALUES (
  'Mungo',
  'crawller'
);

INSERT INTO zombies (
  ex_name,
  type
) VALUES (
  'Billy-bob',
  'feeder'
);

INSERT INTO zombies (
  ex_name,
  type
) VALUES (
  'Jane',
  'crawller'
);

INSERT INTO zombies (
  ex_name,
  type
) VALUES (
  'Peter',
  'Scavanger'
);

INSERT INTO bites (
  zombie_id,
  victim_id,
  infected_on
) VALUES (
  1,
  1,
  '17/03/17'
);

INSERT INTO bites (
  zombie_id,
  victim_id,
  infected_on
) VALUES (
  2,
  3,
  '23/02/17'
);

INSERT INTO bites (
  zombie_id,
  victim_id,
  infected_on
) VALUES (
  2,
  4,
  '01/04/17'
);

SELECT * FROM victims;
SELECT * FROM zombies;
SELECT * FROM bites;
