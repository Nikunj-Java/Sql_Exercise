CREATE DATABASE sports_joins;

USE sports_joins;

-- Create table 1
CREATE TABLE sports
(sport_id INT, sport VARCHAR(50), team_size INT);
INSERT INTO sports
(sport_id, sport, team_size)
VALUES
(1, 'Football', 11),
(2, 'Cricket', 11),
(3, 'Ice Hockey', 18),
(4, 'Tennis', 1),
(5, 'Netball', 7);


-- Create table 2
CREATE TABLE equipment
(item_id INT, item_name VARCHAR(50), sport_id INT);

INSERT INTO equipment
(item_id, item_name, sport_id)
VALUES
(1, 'Ball', 1),
(2, 'Racket', 4),
(3, 'Pommel Horse', 7),
(4, 'Puck', 3),
(5, 'Hockey stick', 3);


