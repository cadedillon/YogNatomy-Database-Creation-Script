CREATE TABLE ClientRelationships
(
	relationshipid		INT				NOT NULL,
	traineeid			INT				NOT NULL,
	trainerid			INT				NOT NUll,
	recommendedpose		VARCHAR(40)		NOT NULL,
	durationinminutes   INT				NULL
	CONSTRAINT PK_relationshipID PRIMARY KEY(relationshipid),
	CONSTRAINT FK_TrainerID2 FOREIGN KEY(trainerid)
		REFERENCES Trainer(trainerid),
	CONSTRAINT FK_TraineeID FOREIGN KEY(traineeid)
		REFERENCES Trainee(traineeid)
);