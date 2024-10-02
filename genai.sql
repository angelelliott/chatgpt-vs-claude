CREATE database genai;

USE genai;

SHOW tables;

SELECT USER();

SELECT NOW();

SELECT DATABASE();

CREATE TABLE stories (
	id TINYINT NOT NULL,
	text TEXT,
	PRIMARY KEY (id)
);

SELECT * FROM stories;

LOAD DATA INFILE "/usr/local/mysql/mysql-files/stories.csv" INTO TABLE stories
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SELECT * FROM stories;

CREATE TABLE features (
	text_id TINYINT NOT NULL,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	nationality VARCHAR(50),
	continent VARCHAR(20),
	migration_year YEAR,
	profession_before VARCHAR(50),
	profession_after VARCHAR(50),
	migration_country VARCHAR(50),
	gender VARCHAR(10),
	model VARCHAR(10),
	status VARCHAR(20),
	INDEX par_ind (text_id),
	FOREIGN KEY (texT_id)
		REFERENCES stories(id)
);


LOAD DATA INFILE "/usr/local/mysql/mysql-files/features.csv" INTO TABLE features
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

ALTER TABLE features MODIFY COLUMN migration_year SMALLINT;

SELECT * FROM features;

SELECT text FROM stories WHERE id > 20;

SELECT text, id, model FROM stories WHERE text LIKE '%coyote%';

SELECT text, id FROM stories WHERE text LIKE '%patriarch%';
SELECT text, id FROM stories WHERE text LIKE '%breadwinner%';


SELECT text, id, model FROM stories WHERE text LIKE '%better opportunities%';
SELECT text, id FROM stories WHERE text LIKE '%new beginning%';
SELECT text, id FROM stories WHERE text LIKE '%language%';
SELECT text, id FROM stories WHERE text LIKE '%apartment%';

SELECT text, id FROM stories WHERE text LIKE '%Josef%';

SELECT text, id FROM stories WHERE text LIKE '%Juan and Carolina Martinez%';
SELECT text_id, nationality FROM features WHERE text_id=1;
SELECT text, id, model FROM stories;


SELECT * FROM features;
SELECT text_id, continent, status, model FROM features WHERE (status LIKE 'undocumented') AND model LIKE 'Claude';


SELECT 12/20;

SELECT 4/20;

SELECT text, id FROM stories WHERE text LIKE '%matriarch%';

ALTER TABLE stories ADD COLUMN model VARCHAR(10);

UPDATE stories SET model='Claude'WHERE id < 21;
UPDATE stories SET model='ChatGPT'WHERE id > 20;


SELECT * FROM features WHERE profession_before LIKE 'seamstress';



