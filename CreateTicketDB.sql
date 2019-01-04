--DB should be created with name TicketingAgentDB.db. Any name can be used just set conn string properly in the application config file.
--These Scripts are for the SQLITE Engine.


BEGIN TRANSACTION;


CREATE TABLE "Users" (
	`ID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`UserID`	TEXT NOT NULL UNIQUE,
	`IsAdmin`	TEXT NOT NULL,
	`FirstName`	TEXT NOT NULL,
	`LastName`	TEXT NOT NULL,
	`Extension`	INTEGER,
	`Department`	TEXT,
	`Email`	TEXT UNIQUE
);


CREATE TABLE "Tickets" (
	`TicketID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`UserID`	TEXT NOT NULL,
	`Department`	INTEGER NOT NULL,
	`ProductOrService`	TEXT,
	`Severity`	INTEGER NOT NULL,
	`Urgency`	TEXT NOT NULL,
	`Description`	TEXT NOT NULL,
	`DateOpened`	TEXT NOT NULL,
	`DateClosed`	TEXT,
	`TicketStatus`	TEXT NOT NULL,
	`SupportUID`	TEXT,
	`SupportNotes`	TEXT,
	`DateLastModified`	TEXT,
	`LastModBy`	TEXT,
	`DateSupLastModified`	TEXT
);


CREATE TABLE `TicketStatus` (
	`StatusID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`StatusName`	TEXT,
	`StatusCode`	TEXT,
	`StatusDesc`	TEXT
);


CREATE TABLE `ProgramList` (
	`ID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`ProgramName`	TEXT,
	`NumErrors`	INTEGER
);


CREATE TABLE "Maintenance" (
	`ID`	TEXT NOT NULL UNIQUE,
	`MaintenanceDate`	TEXT,
	`ShutDownTime`	TEXT,
	`ExpectedDownTime`	TEXT,
	`RestartTime`	TEXT,
	`Details`	TEXT,
	`CreatedBy`	TEXT,
	PRIMARY KEY(ID)
);


CREATE TABLE `InstanceLog` (
	`UID`	TEXT NOT NULL UNIQUE,
	`IsActive`	TEXT,
	`SPID`	INTEGER,
	`LastLogon`	TEXT,
	PRIMARY KEY(UID)
);


CREATE TABLE "ErrorLog" (
	`ErrorID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`ErrorDate`	TEXT,
	`HResult`	TEXT,
	`Message`	TEXT,
	`Source`	TEXT,
	`TargetSite`	TEXT,
	`StackTrace`	TEXT,
	`InnerException`	TEXT,
	`State`	TEXT
);


CREATE TABLE "Departments" (
	`DeptID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`DeptName`	TEXT,
	`DeptShortName`	TEXT
);


CREATE TABLE "Config" (
	`ConfigID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`ConfigName`	TEXT,
	`ConfigValue`	TEXT,
	`ConfigDescription`	TEXT
);


COMMIT;
