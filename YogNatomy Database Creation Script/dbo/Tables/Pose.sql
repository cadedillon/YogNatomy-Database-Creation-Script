CREATE TABLE Pose
(
	poseid				INT				NOT NULL,
	posename			VARCHAR(40)		NOT NULL UNIQUE,
	poseclass			VARCHAR(40)		NOT NULL,
	classid				INT				NOT NULL,
	primarymuscles		VARCHAR(40)		NOT NULL,
	secondarymuscles	VARCHAR(40)		NULL,
	musclegroupid		INT				NOT NULL,
	fitnesslevel        INT				NOT NULL
	CONSTRAINT PK_Pose PRIMARY KEY(poseid),
	CONSTRAINT FK_PrimaryMuscle FOREIGN KEY(primarymuscles)
		REFERENCES Muscle(musclename),
	CONSTRAINT FK_PoseMuscleGroupID FOREIGN KEY(musclegroupid)
		REFERENCES MuscleGroups(groupid),
	CONSTRAINT FK_PoseClass FOREIGN KEY(poseclass)
		REFERENCES PoseClass(classname),
	CONSTRAINT FK_ClassID FOREIGN KEY(classid)
		REFERENCES PoseClass(classid)
);