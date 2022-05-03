use PrestigeCars8
--GO
--CREATE SCHEMA Udt
GO
-----------this code creates a human resources table that holds data to make a view from the refrence.staff table-----

--------------creating unique data types for each column--------



DROP TABLE IF EXISTS Data.HumanResources
CREATE TABLE  Data.HumanResources(
StaffID Udt.PrestigeINT NOT NULL,
HierarcyReference Udt.LongStringUdt NOT NULL,
StaffName Udt.LongStringUdt NOT NULL,
ManagerID Udt.PrestigeINT NULL,
Department Udt.LongStringUdt NULL,
 
);

ALTER TABLE Data.HumanResources
ADD PRIMARY KEY (StaffID);

INSERT INTO Data.HumanResources
SELECT StaffID, HierarchyReference.ToString() AS HierarcyReference, StaffName, ManagerID, Department
FROM Reference.StaffHierarchy

-------------Creating Reference.StaffView------------------------------
DROP VIEW IF EXISTS Reference.StaffView
GO
CREATE VIEW Reference.StaffView
AS
SELECT StaffID, Staffname, ManagerID, Department
FROM Data.HumanResources
GO

-----------------Creating Refrence.StaffHierarchyView

DROP VIEW IF EXISTS Reference.StaffHierarchyView
GO
CREATE VIEW Reference.StaffHierarchyView
AS
SELECT StaffID, Staffname, ManagerID, Department, HierarcyReference
FROM Data.HumanResources

   --	    exec Udt.[usp_TrackWorkFlow]
			--@StartTime = @start,
			--@EndTime = @end,
			--@WorkFlowDescription = 'Executing LoadStarSchemaData',
			--@UserAuthorizationKey = 0,
			--@WorkFlowStepTableRowCount = null
GO

