--CREATE TABLES
CREATE TABLE Trainer 
(
	trainerid			INT				NOT NULL,
	trainername			VARCHAR(40)		NOT NULL,
	CONSTRAINT PK_Trainer PRIMARY KEY(trainerid),
);