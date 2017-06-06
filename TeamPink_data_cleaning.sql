-- Table: is_retweet

CREATE TABLE is_retweet (
  retweet_count  INTEGER NOT NULL DEFAULT 0, 
  favorite_count INTEGER NOT NULL DEFAULT 0,
  original_author VARCHAR(64),
  time DATE,
  ID_text INTEGER NOT NULL DEFAULT 0
  CONSTRAINT is_retweet_pkey PRIMARY KEY (id_text)

);

COPY is_retweet FROM '/home/michelle/Databsesystem/Project/Table_is_retweet.csv' DELIMITER ',' CSV HEADER ENCODING 'windows-1251';




-- Table: text

CREATE TABLE text (
  retweet_count  INTEGER NOT NULL DEFAULT 0, 
  favorite_count INTEGER NOT NULL DEFAULT 0,
  time DATE,
  ID_text INTEGER NOT NULL DEFAULT 0,
  CONSTRAINT text_pkey PRIMARY KEY (id_text)
);

COPY text FROM '/home/michelle/Databsesystem/Project/Table_text.csv' DELIMITER ',' CSV HEADER ENCODING 'windows-1251';
