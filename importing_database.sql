DROP VIEW IF EXISTS Gold_medal_winners;
DROP TABLE IF EXISTS "athletes";
	CREATE TABLE athletes(
	 	"id" int,
		name VARCHAR(255),
		gender VARCHAR(8),
		age int,
		height int,
		weight int);
		
DROP TABLE IF EXISTS "games";
	CREATE TABLE games(
	 	sport VARCHAR(255),
		event VARCHAR(255),
		year int,
		athlete_id int,
		country_id int,
		medal VARCHAR(6));

DROP TABLE IF EXISTS "countries";
	CREATE TABLE countries(
	 	"id" int,
		country VARCHAR(255),
		region varchar(50));

COPY athletes
	FROM 'C:\Users\Minasyan\Desktop\DATA\Olympic_games\athletes.csv' (DELIMITER ',', FORMAT CSV, HEADER);

COPY countries
	FROM 'C:\Users\Minasyan\Desktop\DATA\Olympic_games\countries.csv' (DELIMITER ',', FORMAT CSV, HEADER);

COPY games
	FROM 'C:\Users\Minasyan\Desktop\DATA\Olympic_games\games.csv' (DELIMITER ',', FORMAT CSV, HEADER);