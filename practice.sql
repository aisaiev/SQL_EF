-- Stored Procedures
-- Task_1
CREATE PROCEDURE GetAllEventsInAugust
AS
SELECT *
FROM tblEvent
WHERE MONTH(EventDate) = 8

-- Task_2
CREATE PROCEDURE GetAllCountries
AS
SELECT CountryName
FROM tblCountry
WHERE ContinentID = 1
ORDER BY CountryName

-- Task_3
CREATE PROCEDURE GetEpisodesWithDoctorMattSmith
AS
SELECT e.Title
FROM tblEpisode e
INNER JOIN tblDoctor d ON e.DoctorId = d.DoctorId
WHERE d.DoctorName = 'Matt Smith'

-- Task_4
CREATE PROCEDURE GetEpisodesWithDoctor (@doctorName NVARCHAR(50))
AS
SELECT e.Title
FROM tblEpisode e
INNER JOIN tblDoctor d ON e.DoctorId = d.DoctorId
WHERE d.DoctorName = @doctorName

-- Task_5
CREATE PROCEDURE GetTopThreePlayedCompanions
AS
SELECT c.CompanionId,
	c.CompanionName,
	c.WhoPlayed
FROM tblCompanion c
INNER JOIN (
	SELECT TOP 3 CompanionId,
		COUNT(CompanionId) AS EpisodeCount
	FROM tblEpisodeCompanion
	GROUP BY CompanionId
	ORDER BY EpisodeCount DESC
	) comp ON c.CompanionId = comp.CompanionId

-- Triggers
-- Task_1
--Create Table for country audit
CREATE TABLE tblCountry_audit (
	change_id INT IDENTITY PRIMARY KEY,
	CountryID INT,
	OldCountryName NVARCHAR(255),
	CurrentCountryName NVARCHAR(255),
	ContinentID INT FOREIGN KEY REFERENCES tblContinent(ContinentID),
	UpdatedAt DATETIME,
	Operation CHAR(3)
	)

--Create Trigger for country audit
CREATE TRIGGER trg_tblCountry_audit ON tblCountry
INSTEAD OF UPDATE
AS
IF 
	UPDATE (CountryName)

BEGIN
	DECLARE @OldCountryName NVARCHAR(255)
	DECLARE @CurrentCountryName NVARCHAR(255)
	DECLARE @countryId INT

	SELECT @CurrentCountryName = i.CountryName,
		@countryId = i.CountryID
	FROM inserted i

	IF (
			@CurrentCountryName = ''
			OR @CurrentCountryName IS NULL
			)
	BEGIN
		SELECT @OldCountryName = c.CountryName
		FROM tblCountry c
		INNER JOIN inserted i ON c.CountryID = i.CountryId

		INSERT INTO tblCountry_audit (
			CountryID,
			OldCountryName,
			CurrentCountryName,
			ContinentID,
			UpdatedAt,
			Operation
			)
		SELECT i.CountryID,
			@OldCountryName,
			@OldCountryName,
			i.ContinentID,
			GETDATE(),
			'UPD'
		FROM inserted i
	END
	ELSE
	BEGIN
		SELECT @OldCountryName = c.CountryName
		FROM tblCountry c
		INNER JOIN inserted i ON c.CountryID = i.CountryId

		INSERT INTO tblCountry_audit (
			CountryID,
			OldCountryName,
			CurrentCountryName,
			ContinentID,
			UpdatedAt,
			Operation
			)
		SELECT i.CountryID,
			@OldCountryName,
			@CurrentCountryName,
			i.ContinentID,
			GETDATE(),
			'UPD'
		FROM inserted i

		UPDATE tblCountry
		SET CountryName = @CurrentCountryName
		WHERE CountryID = @countryId
	END
END

-- Task_2
USE WorldEvents;
GO

IF NOT EXISTS (
		SELECT *
		FROM sysobjects
		WHERE name = 'world_events_log'
			AND xtype = 'U'
		)
	CREATE TABLE world_events_log (
		EventType NVARCHAR(200),
		PostTime DATETIME,
		ObjectName SYSNAME,
		CommandText NVARCHAR(max)
		);
GO

CREATE TRIGGER world_events_log ON DATABASE
FOR DDL_DATABASE_LEVEL_EVENTS AS

DECLARE @data XML

SET @data = EVENTDATA()

INSERT world_events_log (
	EventType,
	PostTime,
	ObjectName,
	CommandText
	)
VALUES (
	@data.value('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar(200)'),
	GETDATE(),
	@data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname'),
	@data.value('(/EVENT_INSTANCE/CommandText)[1]', 'nvarchar(max)')
	);
GO


