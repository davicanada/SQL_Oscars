-- Step 1: Create the Database

CREATE DATABASE Oscars;
USE Oscars;

-- Step 2: Create the tables

-- ## Actor Table
CREATE TABLE Actor(
	Actor_ID INT,
	Actor_Name VARCHAR(50) NOT NULL,
	Actor_City VARCHAR(50) NOT NULL,
	Actor_Country VARCHAR(10) NOT NULL,
	Actor_Gender VARCHAR(1) NOT NULL,
	PRIMARY KEY(Actor_ID)
);

-- ## Director Table
CREATE TABLE Director(
	Director_ID INT,
	Director_Name VARCHAR(50) NOT NULL,
	Director_City VARCHAR(50) NOT NULL,
	Director_Country VARCHAR(10) NOT NULL,
	PRIMARY KEY(Director_ID)
);

-- ## Movie Table
CREATE TABLE Movie(
	Movie_ID INT,
	Title VARCHAR(50) NOT NULL,
	Director_ID INT NOT NULL,
	PRIMARY KEY(Movie_ID),
	FOREIGN KEY(Director_ID) REFERENCES Director(Director_ID)
);

-- ## Award Table
CREATE TABLE Award(
	Award_ID INT,
	Award_Description VARCHAR(50) NOT NULL,
	PRIMARY KEY(Award_ID)
);

-- ## Participation Table
CREATE TABLE Participation(
	P_Actor_ID INT,
	P_Movie_ID INT,
	PRIMARY KEY(P_Actor_ID, P_Movie_ID),
	FOREIGN KEY(P_Actor_ID) REFERENCES Actor(Actor_ID),
	FOREIGN KEY(P_Movie_ID) REFERENCES Movie(Movie_ID)
);

-- ## Award Ceremony Table
CREATE TABLE Award_Ceremony(
	R_Movie_ID INT,
	R_Award_ID INT,
	Year INT NOT NULL,
	PRIMARY KEY(R_Movie_ID, R_Award_ID),
	FOREIGN KEY(R_Movie_ID) REFERENCES Movie(Movie_ID),
	FOREIGN KEY(R_Award_ID) REFERENCES Award(Award_ID)
);


-- Step 3: Insert values in the tables

-- ## Actor Table
INSERT INTO Actor(Actor_ID, Actor_Name, Actor_City, Actor_Country, Actor_Gender) VALUES
(1, 'Alan Arkin', 'New York', 'USA', 'M'),
(2, 'Alec Baldwin', 'New York', 'USA', 'M'),
(3, 'Ben Affleck', 'California', 'USA', 'M'),
(4, 'Bérénice Bejo', 'Buenos Aires', 'ARG', 'F'),
(5, 'Bradley Cooper', 'Pennsylvania', 'USA', 'M'),
(6, 'Brian May', 'Hampton', 'GBR', 'M'),
(7, 'Brie Larson', 'California', 'USA', 'F'),
(8, 'Casey Affleck', 'Massachusetts', 'USA', 'M'),
(9, 'Cate Blanchett', 'Ivanhoe', 'AUS', 'F'),
(10, 'Chiwetel Ejiofor', 'London', 'GBR', 'M'),
(11, 'Colin Firth', 'Grayshott', 'GBR', 'M'),
(12, 'Daniel Day-Lewis', 'London', 'GBR', 'M'),
(13, 'Doug Jones', 'Indiana', 'USA', 'M'),
(14, 'Eddie Redmayne', 'London', 'GBR', 'M'),
(15, 'Edward Norton', 'Massachusetts', 'USA', 'M'),
(16, 'Emma Stone', 'Arizona', 'USA', 'F'),
(17, 'Felicity Jones', 'Birmingham', 'GBR', 'F'),
(18, 'Finn Wittrock', 'Massachusetts', 'USA', 'M'),
(19, 'Frances McDormand', 'Illinois', 'USA', 'F'),
(20, 'Gary Oldman', 'London', 'GBR', 'M'),
(21, 'Geoffrey Rush', 'Toowoomba', 'AUS', 'M'),
(22, 'George Clooney', 'Kentucky', 'USA', 'M'),
(23, 'Irrfan Khan', 'Tonk', 'IND', 'M'),
(24, 'Jacob Tremblay', 'Vancouver', 'CAN', 'M'),
(25, 'Jean Dujardin', 'Rueil-Malmaison', 'FRA', 'M'),
(26, 'Jennifer Garner', 'Texas', 'USA', 'F'),
(27, 'Jennifer Lawrence', 'Kentucky', 'USA', 'F'),
(28, 'Jim Broadbent', 'Holton cum Beckering', 'GBR', 'M'),
(29, 'Joaquin Phoenix', 'Rio Piedras', 'PUR', 'M'),
(30, 'Julianne Moore', 'North Carolina', 'USA', 'F'),
(31, 'Kristen Stewart', 'California', 'USA', 'F'),
(32, 'Leonardo DiCaprio', 'California', 'USA', 'M'),
(33, 'Lily James', 'Esher', 'GBR', 'F'),
(34, 'Lucas Hedges', 'New York', 'USA', 'M'),
(35, 'Mahershala Ali', 'California', 'USA', 'M'),
(36, 'Marcus Ornellas', 'Rio Grande do Sul', 'BRA', 'M'),
(37, 'Marina de Tavira', 'Mexico City', 'MEX', 'F'),
(38, 'Mark Ruffalo', 'Wisconsin', 'USA', 'M'),
(39, 'Matthew McConaughey', 'Texas', 'USA', 'M'),
(40, 'Meryl Streep', 'New Jersey', 'USA', 'F'),
(41, 'Michael Fassbender', 'Heidelberg', 'GER', 'M'),
(42, 'Michael Keaton', 'Pennsylvania', 'USA', 'M'),
(43, 'Mila Kunis', 'Chernivtsi', 'UKR', 'F'),
(44, 'Natalie Portman', 'Jerusalem', 'ISR', 'F'),
(45, 'Olivia Colman', 'Norwich', 'GBR', 'F'),
(46, 'Park Seo-joon', 'Seoul', 'KOR', 'M'),
(47, 'Rachel Weisz', 'London', 'GBR', 'F'),
(48, 'Rami Malek', 'California', 'USA', 'M'),
(49, 'Renée Zellweger', 'Texas', 'USA', 'F'),
(50, 'Robert De Niro', 'New York', 'USA', 'M'),
(51, 'Ryan Gosling', 'London', 'CAN', 'M'),
(52, 'Sally Field', 'California', 'USA', 'F'),
(53, 'Sally Hawkins', 'London', 'GBR', 'F'),
(54, 'Sandra Bullock', 'Virginia', 'USA', 'F'),
(55, 'Song Kang-ho', 'Gimhae', 'KOR', 'M'),
(56, 'Suraj Sharma', 'New Delhi', 'IND', 'M'),
(57, 'Tom Hardy', 'London', 'GBR', 'M'),
(58, 'Trevante Rhodes', 'Louisiana', 'USA', 'M'),
(59, 'Viggo Mortensen', 'New York', 'USA', 'M'),
(60, 'Woody Harrelson', 'Texas', 'USA', 'M'),
(61, 'Yalitza Aparicio', 'Tlaxiaco', 'MEX', 'F');

-- ## Director Table
INSERT INTO Director(Director_ID, Director_Name, Director_City, Director_Country) VALUES
(1, 'Alejandro González', 'Mexico City', 'MEX'),
(2, 'Alfonso Cuarón', 'Mexico City', 'MEX'),
(3, 'Ang Lee', 'Pingtung', 'CHN'),
(4, 'Barry Jenkins', 'Florida', 'USA'),
(5, 'Ben Affleck', 'California', 'USA'),
(6, 'Bong Joon-ho', 'Daegu', 'KOR'),
(7, 'Bryan Singer', 'New York', 'USA'),
(8, 'Damien Chazelle', 'Rhode Island', 'USA'),
(9, 'Darren Aronofsky', 'New York', 'USA'),
(10, 'David O. Russell', 'New York', 'USA'),
(11, 'Guillermo del Toro', 'Guadalajara', 'MEX'),
(12, 'James Marsh', 'Truro', 'GBR'),
(13, 'Jean-Marc Vallée', 'Montreal', 'CAN'),
(14, 'Joe Wright', 'London', 'GBR'),
(15, 'Kenneth Lonergan', 'New York', 'USA'),
(16, 'Lenny Abrahamson', 'Dublin', 'IRL'),
(17, 'Martin McDonagh', 'London', 'GBR'),
(18, 'Michel Hazanavicius', 'Paris', 'FRA'),
(19, 'Peter Farrelly', 'Pennsylvania', 'USA'),
(20, 'Phyllida Lloyd', 'Bristol', 'GBR'),
(21, 'Rupert Goold', 'London', 'GBR'),
(22, 'Steve McQueen', 'London', 'USA'),
(23, 'Steven Spielberg', 'Ohio', 'USA'),
(24, 'Todd Phillips', 'New York', 'USA'),
(25, 'Tom Hopper', 'Coalville', 'GBR'),
(26, 'Tom McCarthy', 'New Jersey', 'USA'),
(27, 'Wash Westmoreland', 'Leeds', 'GBR'),
(28, 'Woody Allen', 'Bronx', 'USA'),
(29, 'Yorgos Lanthimos', 'Athens', 'GRE')



-- ## Movie Table
INSERT INTO Movie(Movie_ID, Title, Director_ID) VALUES
(1, 'The King`s Speech', 25),
(2, 'Black Swan', 9),
(3, 'The Artist', 18),
(4, 'The Iron Lady', 20),
(5, 'Argo', 5),
(6, 'Life of Pi', 3),
(7, 'Lincoln', 23),
(8, 'Silver Linings Playbook', 10),
(9, '12 Years a Slave', 22),
(10, 'Gravity', 2),
(11, 'Dallas Buyers Club', 13),
(12, 'Blue Jasmine', 28),
(13, 'Birdman', 1),
(14, 'The Theory of Everything', 12),
(15, 'Still Alice', 27),
(16, 'Spotlight', 26),
(17, 'The Revenant', 1),
(18, 'Room', 16),
(19, 'Moonlight', 4),
(20, 'La La Land', 8),
(21, 'Manchester by the Sea', 15),
(22, 'The Shape of Water', 11),
(23, 'Darkest Hour', 14),
(24, 'Three Billboards Outside Ebbing, Missouri', 17),
(25, 'Green Book', 19),
(26, 'Roma', 2),
(27, 'Bohemian Rhapsody', 7),
(28, 'The Favourite', 29),
(29, 'Parasite', 6),
(30, 'Joker', 24),
(31, 'Judy', 21);

-- ## Award Table
INSERT INTO Award(Award_ID, Award_Description) VALUES
(1, 'Best Picture'),
(2, 'Best Director'),
(3, 'Best Actor'),
(4, 'Best Actress');

-- ## Participation Table
INSERT INTO Participation(P_Actor_ID, P_Movie_ID) VALUES
(7, 18),
(11, 1),
(40, 4),
(9, 12),
(45, 28),
(44, 2),
(39, 11),
(48, 27),
(12, 7),
(16, 20),
(27, 8),
(49, 31),
(14, 14),
(29, 30),
(19, 24),
(30, 15),
(20, 23),
(25, 3),
(8, 21),
(32, 17),
(21, 1),
(43, 2),
(4, 3),
(28, 4),
(3, 5),
(1, 5),
(56, 6),
(23, 6),
(52, 7),
(5, 8),
(10, 9),
(41, 9),
(54, 10),
(22, 10),
(26, 11),
(2, 12),
(42, 13),
(15, 13),
(17, 14),
(31, 15),
(38, 16),
(57, 17),
(24, 18),
(35, 19),
(58, 19),
(51, 20),
(34, 21),
(53, 22),
(13, 22),
(33, 23),
(60, 24),
(59, 25),
(35, 25),
(61, 26),
(37, 26),
(6, 27),
(47, 28),
(55, 29),
(46, 29),
(50, 30),
(18, 31),
(42, 16);

-- ## Award_Cerimony Table
INSERT INTO Award_Ceremony(R_Movie_ID, R_Award_ID, Year) VALUES
(1, 1, 2011),
(1, 2, 2011),
(1, 3, 2011),
(2, 4, 2011),
(3, 1, 2012),
(3, 2, 2012),
(3, 3, 2012),
(4, 4, 2012),
(5, 1, 2013),
(6, 2, 2013),
(7, 3, 2013),
(8, 4, 2013),
(9, 1, 2014),
(10, 2, 2014),
(11, 3, 2014),
(12, 4, 2014),
(13, 1, 2015),
(13, 2, 2015),
(14, 3, 2015),
(15, 4, 2015),
(16, 1, 2016),
(17, 2, 2016),
(17, 3, 2016),
(18, 4, 2016),
(19, 1, 2017),
(20, 2, 2017),
(21, 3, 2017),
(20, 4, 2017),
(22, 1, 2018),
(22, 2, 2018),
(23, 3, 2018),
(24, 4, 2018),
(25, 1, 2019),
(26, 2, 2019),
(27, 3, 2019),
(28, 4, 2019),
(29, 1, 2020),
(29, 2, 2020),
(30, 3, 2020),
(31, 4, 2020);


-- Final Tests:

-- 1) Checking the Referential Integrity Constraint for the tables:

-- a) Participation

INSERT INTO Participation VALUES
(100, 1);

-- b) Award Cerimony

SELECT * FROM Award_Ceremony
SELECT * FROM Award

INSERT INTO Award_Ceremony VALUES
(6, 8, 2022);


-- 2) Verificar uma Restrição de Domínio qualquer
INSERT INTO Award VALUES
('COD123', 'Melhor Roteiro');

-- 3) Verificar uma Restrição de Vazio qualquer

INSERT INTO Actor VALUES
(101, 'Lazaro Ramos', 'Salvador', NULL, 'M');

-- 4) Verificar a Restrição de Chave nas tabelas:

-- a) Award

INSERT INTO Award VALUES
(1, 'Melhor Actor Coadjuvante');

-- b) Award_Cerimony

INSERT INTO Award_Ceremony VALUES
(1, 1, 2022);

-- 5) Checking the Integrity Constraint in the Actor table:

INSERT INTO Actor VALUES
(NULL, 'Fabio Porchat', 'Rio de Janeiro', 'BRA', 'M');
