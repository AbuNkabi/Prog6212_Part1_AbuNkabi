CREATE DATABASE RaceDay;
GO

USE RaceDay;
GO

CREATE TABLE Userss
(
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(20) NOT NULL,

    CONSTRAINT CK_Users_Role
        CHECK (Role IN ('Organiser', 'Participant'))
);
GO

CREATE TABLE Events
(
    EventId INT IDENTITY(1,1) PRIMARY KEY,
    OrganiserId INT NOT NULL,
    EventName NVARCHAR(150) NOT NULL,
    Description NVARCHAR(500),
    EventDate DATE NOT NULL,
    Location NVARCHAR(200) NOT NULL,

    CONSTRAINT FK_Events_Users
        FOREIGN KEY (OrganiserId)
        REFERENCES Userss(UserId)
);
GO

CREATE TABLE Categories
(
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(300)
);
GO

CREATE TABLE EventCategories
(
    EventCategoryId INT IDENTITY(1,1) PRIMARY KEY,
    EventId INT NOT NULL,
    CategoryId INT NOT NULL,
    EntryFee DECIMAL(10,2) NOT NULL DEFAULT 0,
    MaximumParticipants INT NOT NULL,

    CONSTRAINT FK_EventCategories_Events
        FOREIGN KEY (EventId)
        REFERENCES Events(EventId),

    CONSTRAINT FK_EventCategories_Categories
        FOREIGN KEY (CategoryId)
        REFERENCES Categories(CategoryId),

    CONSTRAINT UQ_Event_Category
        UNIQUE (EventId, CategoryId),

    CONSTRAINT CK_EventCategories_EntryFee
        CHECK (EntryFee >= 0),

    CONSTRAINT CK_EventCategories_MaxParticipants
        CHECK (MaximumParticipants > 0)
);
GO

CREATE TABLE Enrolments
(
    EnrolmentId INT IDENTITY(1,1) PRIMARY KEY,
    ParticipantId INT NOT NULL,
    EventCategoryId INT NOT NULL,
    EnrolmentDate DATETIME2 NOT NULL DEFAULT GETDATE(),
    Status NVARCHAR(20) NOT NULL DEFAULT 'Active',

    CONSTRAINT FK_Enrolments_Participants
        FOREIGN KEY (ParticipantId)
        REFERENCES Userss(UserId),

    CONSTRAINT FK_Enrolments_EventCategories
        FOREIGN KEY (EventCategoryId)
        REFERENCES EventCategories(EventCategoryId),

    CONSTRAINT UQ_Participant_EventCategory
        UNIQUE (ParticipantId, EventCategoryId),

    CONSTRAINT CK_Enrolments_Status
        CHECK (Status IN ('Active', 'Cancelled'))
);
GO

CREATE TABLE Results
(
    ResultId INT IDENTITY(1,1) PRIMARY KEY,
    EnrolmentId INT NOT NULL,
    FinishTime TIME NULL,
    Position INT NULL,
    ResultStatus NVARCHAR(20) NOT NULL DEFAULT 'Completed',

    CONSTRAINT FK_Results_Enrolments
        FOREIGN KEY (EnrolmentId)
        REFERENCES Enrolments(EnrolmentId),

    CONSTRAINT UQ_Result_Enrolment
        UNIQUE (EnrolmentId),

    CONSTRAINT CK_Results_Position
        CHECK (Position IS NULL OR Position > 0),

    CONSTRAINT CK_Results_Status
        CHECK (ResultStatus IN ('Completed', 'Did Not Finish', 'Disqualified'))
);
GO

INSERT INTO Userss
    (FullName, Email, PasswordHash, Role)
VALUES
    ('John Smith', 'john@raceday.com', 'hashed_password_1', 'Organiser'),
    ('Sarah Williams', 'sarah@raceday.com', 'hashed_password_2', 'Organiser'),
    ('Michael Brown', 'michael@email.com', 'hashed_password_3', 'Participant'),
    ('Emily Jones', 'emily@email.com', 'hashed_password_4', 'Participant');
GO

INSERT INTO Events
    (OrganiserId, EventName, Description, EventDate, Location)
VALUES
    (1, 'Cape Town Marathon',
     'Annual city marathon event',
     '2026-10-10',
     'Cape Town'),

    (1, 'Johannesburg Fun Run',
     'Community fun running event',
     '2026-11-15',
     'Johannesburg'),

    (2, 'Durban Beach Run',
     'Beach running competition',
     '2026-12-05',
     'Durban');
GO

INSERT INTO Categories
    (CategoryName, Description)
VALUES
    ('5 KM Run', 'Short distance running event'),
    ('10 KM Run', 'Medium distance running event'),
    ('21 KM Half Marathon', 'Half marathon running event'),
    ('42 KM Marathon', 'Full marathon running event');
GO

INSERT INTO EventCategories
    (EventId, CategoryId, EntryFee, MaximumParticipants)
VALUES
    (1, 3, 250.00, 500),
    (1, 4, 400.00, 1000),
    (2, 1, 100.00, 300),
    (2, 2, 150.00, 400),
    (3, 1, 80.00, 250),
    (3, 2, 120.00, 350);
GO

INSERT INTO Enrolments
    (ParticipantId, EventCategoryId, Status)
VALUES
    (3, 1, 'Active'),
    (3, 3, 'Active'),
    (4, 2, 'Active'),
    (4, 5, 'Active');
GO

INSERT INTO Results
    (EnrolmentId, FinishTime, Position, ResultStatus)
VALUES
    (1, '00:28:35', 12, 'Completed'),
    (2, '01:05:20', 25, 'Completed'),
    (3, '00:55:10', 18, 'Completed');
GO


SELECT * FROM Userss;
SELECT * FROM Events;
SELECT * FROM Categories;
SELECT * FROM EventCategories;
SELECT * FROM Enrolments;
SELECT * FROM Results;
GO