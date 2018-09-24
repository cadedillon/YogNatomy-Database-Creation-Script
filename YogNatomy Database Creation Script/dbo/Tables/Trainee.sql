CREATE TABLE Trainee
( 
	traineeid			INT				NOT NULL,
	traineename			VARCHAR(40)		NOT NULL,
	trainerid			INT				NULL,
	traineeheight		INT				NULL,
	traineeweight		INT  			NULL,
	traineeage			INT				NULL,
	fitnesslevel		INT				NOT NULL,
	CONSTRAINT PK_Trainee PRIMARY KEY(traineeid),
	CONSTRAINT CHK_fitnesslevel CHECK(fitnesslevel BETWEEN  0 AND 6),
	CONSTRAINT FK_TrainerID FOREIGN KEY(trainerid)
		References Trainer(trainerid)
);