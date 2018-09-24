CREATE TABLE MuscleGroups
(
	groupid				INT				NOT NULL,
	groupname			VARCHAR(40)		NOT NULL UNIQUE,
	CONSTRAINT PK_MuscleGroups PRIMARY KEY(groupid),
);