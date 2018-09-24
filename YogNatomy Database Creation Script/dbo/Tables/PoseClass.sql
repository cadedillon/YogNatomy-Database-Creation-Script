CREATE TABLE PoseClass
(
	classid				INT				NOT NULL,
	classname			VARCHAR(40)		NOT NULL UNIQUE,
	CONSTRAINT PK_PoseClass PRIMARY KEY(classid)
);