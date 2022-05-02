SUSE PrestigeCars

GO
CREATE SCHEMA Udt
GO
-----------this code creates a human resources table that holds data to make a view from the refrence.staff table-----

--------------creating unique data types for each column--------
CREATE TYPE Udt.PrestigeINT
FROM INT NOT NULL;

CREATE TYPE Udt.HierarchyReference 
FROM nvarchar(4000) NOT NULL; 

CREATE TYPE Udt.StaffName
FROM NVARCHAR(50) NOT NULL;

CREATE TYPE Udt.Department
FROM NVARCHAR(50) NOT NULL;


DROP TABLE IF EXISTS Data.HumanResources
CREATE TABLE  Data.HumanResources(
StaffID Udt.PrestigeINT NOT NULL,
HierarcyReference Udt.HierarchyReference NOT NULL,
StaffName Udt.Staffname NOT NULL,
ManagerID Udt.PrestigeINT NULL,
Department Udt.Department NULL,
 
);

ALTER TABLE Data.HumanResources
ADD PRIMARY KEY (StaffID);

INSERT INTO Data.HumanResources
SELECT StaffID, HierarchyReference.ToString() AS HierarcyReference, StaffName, ManagerID, Department
FROM Reference.StaffHierarchy


DROP VIEW IF EXISTS Reference.StaffView
GO
CREATE VIEW Reference.StaffView
AS
SELECT StaffID, Staffname, ManagerID, Department
FROM Data.HumanResources
GO



