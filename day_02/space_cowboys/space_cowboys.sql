DROP TABLE IF EXISTS space_cowboys;

CREATE TABLE space_cowboys(
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  danger_value VARCHAR(255),
  bounty_value INT2,
  favourite_weapon VARCHAR (255)
)
