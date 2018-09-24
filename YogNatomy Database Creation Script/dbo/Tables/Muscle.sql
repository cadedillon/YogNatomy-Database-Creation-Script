CREATE TABLE Muscle
(
	muscleid			INT				NOT NULL,
	musclename			VARCHAR(40)		NOT NULL UNIQUE,
	musclegroupid		INT				NOT NULL,
	CONSTRAINT PK_Muscle PRIMARY KEY(muscleid),
	CONSTRAINT FK_MuscleGroupID FOREIGN KEY (musclegroupid)
		REFERENCES MuscleGroups(groupid)
);