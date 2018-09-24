
--USE DATABASE
USE YogNatomy
GO

--CHECK TO SEE IF TABLES EXIST AND THEN DROP THEM
DROP TABLE IF EXISTS ClientRelationships;
GO

DROP TABLE IF EXISTS Pose;
GO

DROP TABLE IF EXISTS PoseClass;
GO

DROP TABLE IF EXISTS Muscle;
GO

DROP TABLE IF EXISTS MuscleGroups;
GO

DROP TABLE IF EXISTS Trainee;
GO

DROP TABLE IF EXISTS Trainer;
GO

--Populate tables with test data
INSERT INTO Trainer
	VALUES
		(1, 'Joe Schmoe')
	   ,(2, 'Paula Abdul')
GO

INSERT INTO Trainee
	VALUES 
		 (1, 'Kevin Abstract', 1, 69, 170, 26, 4)
		,(2, 'Ameer Van', 1, 72, 190, 30, 4)	
		,(3, 'Dom McLennon', 2, 66, NULL, 27, 2)
		,(4, 'Merlin Woods', 2, NULL, 158, 24, 5)
		,(5, 'Matt Champion', NULL, 69, 155, 23, 3)
GO

INSERT INTO MuscleGroups
	VALUES
		(1, 'Chest')
	   ,(2, 'Back')
	   ,(3, 'Legs')
	   ,(4, 'Shoulders')
	   ,(5, 'Abdominals')
GO

INSERT INTO Muscle
	VALUES
		(1, 'Pectoralis Major', 1)
	   ,(2, 'Latissimus Dorsi', 2)
	   ,(3, 'Rectus Abdominis', 5)
	   ,(4, 'Posterior Deltoids', 4)
	   ,(5, 'Quadriceps', 3)
GO

INSERT INTO PoseClass
	VALUES
		(1, 'Standing')
	   ,(2, 'Sitting')
	   ,(3, 'Kneeling')
	   ,(4, 'Prone')
GO

INSERT INTO Pose
	VALUES
		(1, 'Mountain Pose', 'Standing', 1, 'Quadriceps', NULL, 3, 1)
	   ,(2, 'Tree Pose', 'Standing', 1, 'Rectus Abdominis', 'Quadriceps', 5, 3)
	   ,(3, 'Eagle Pose', 'Standing', 1, 'Posterior Deltoids', 'Quadriceps', 4, 5)
	   ,(4, 'Half Lord of the Fishes Pose', 'Sitting', 2, 'Latissimus Dorsi', NULL, 2, 2)
	   ,(5, 'Cow-Faced Pose', 'Sitting', 2, 'Pectoralis Major', NULL, 1, 1)
	   ,(6, 'Boat Pose', 'Sitting', 2, 'Rectus Abdominis', NULL, 5, 4)
	   ,(7, 'Child Pose', 'Kneeling', 3, 'Latissimus Dorsi', 'Quadriceps', 2, 1)
	   ,(8, 'Camel Pose', 'Kneeling', 3, 'Rectus Abdominis', NULL, 5, 3)
	   ,(9, 'Cobra Pose', 'Prone', 4, 'Latissimus Dorsi', NULL, 2, 2)
	   ,(10, 'Bow Pose', 'Prone', 4, 'Pectoralis Major', 'Posterior Deltoids', 1, 4)
GO

INSERT INTO ClientRelationships
	VALUES
		(1, 1, 1, 'Mountain Pose', 10)
	   ,(2, 4, 2, 'Tree Pose', 4)
	   ,(3, 3, 2, 'Child Pose', 10)
	   ,(4, 2, 1, 'Bow Pose', 2)
GO

--RETURN TABLE CONTENTS

SELECT * FROM Trainer
GO

SELECT * FROM Trainee
GO

SELECT * FROM Muscle
GO

SELECT * FROM MuscleGroups
GO

SELECT * FROM PoseClass
GO

SELECT * FROM Pose
GO

SELECT * FROM ClientRelationships
GO

--TEST TABLES

SELECT recommendedpose
FROM ClientRelationships
WHERE traineeid = 1;
GO

SELECT posename 
FROM Pose
WHERE fitnesslevel < 3
GO

SELECT traineeid, traineename
FROM Trainee
WHERE trainerid IN
	(SELECT trainerid
	 FROM ClientRelationships
	 WHERE trainerid = 1)
GO

SELECT posename
FROM Pose
WHERE primarymuscles LIKE '%Dorsi'
GO

SELECT DISTINCT CR.recommendedpose, CR.trainerid, T.traineeid, t.traineename
FROM ClientRelationships AS CR
	INNER JOIN Trainee AS T
		ON CR.traineeid = T.traineeid
WHERE CR.trainerid = 1
ORDER BY T.traineeid
GO
