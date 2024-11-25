CREATE TABLE PLAYER (
    PlayerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Number INT,
    Contact VARCHAR(50),
    DOB DATE
);

CREATE TABLE TEAM (
    TeamID INT PRIMARY KEY,
    Name VARCHAR(50),
    Mascot VARCHAR(50)
);

CREATE TABLE COACH (
    CoachID INT PRIMARY KEY,
    Name VARCHAR(50),
    Contact VARCHAR(50)
);

-- Insert data into PLAYER table
INSERT INTO PLAYER (PlayerID, Name, Number, Contact, DOB) VALUES
(1, 'James Feng', 10, 'john.doe@appalachian.com', '2004-09-09'),
(2, 'Carson Smith', 22, 'carsonSmith@microsoft.com', '2008-10-22');

SELECT * FROM PLAYER;

-- Insert data into TEAM table
INSERT INTO TEAM (TeamID, Name, Mascot) VALUES
(1, 'Team A', 'WarEagle'),
(2, 'Team B', 'Tiger');

SELECT * FROM TEAM;

-- Insert data into COACH table
INSERT INTO COACH (CoachID, Name, Contact) VALUES
(1, 'Coach K', 'coach.k@soccerClub.com'),
(2, 'Coach Tash', 'TashCoach@soccer.com');

SELECT * FROM COACH;

