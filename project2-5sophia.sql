---------------------REMOVE COLUMNS AND CREATE UDT FOR STOCK.DATA-------------------------------------
USE PrestigeCars
GO
CREATE SCHEMA Udt;
GO

ALTER TABLE Data.Stock
DROP COLUMN BuyerComments -- i chose to delete this bc most custoomers haven't left comments so it's not a very useful column

ALTER TABLE Data.Stock
DROP COLUMN TimeBought -- every row has the same time this is very unlikely and seems like an anomoly 

ALTER TABLE Data.Stock
ADD StockID smallint NOT NULL IDENTITY(1,1)

ALTER TABLE Data.Stock
ADD PRIMARY KEY(StockID);

---- creating a UDT to represet money ------
CREATE TYPE Udt.PrestigeMoney
FROM money NULL; -- wanted to make this not null but when i did it didn't allow me to change the data type of the Cost column
---- changing all money types to Udt.Prestige Money----
ALTER TABLE Data.Stock
ALTER COLUMN Cost Udt.PrestigeMoney;

ALTER TABLE Data.Stock
ALTER COLUMN RepairsCost Udt.PrestigeMoney

ALTER TABLE Data.Stock
ALTER COLUMN PartsCost Udt.PrestigeMoney;

ALTER TABLE Data.Stock
ALTER COLUMN TransportInCost Udt.PrestigeMoney;

---------creating Udt.Color and changing data type of the Color column-----------------
CREATE TYPE Udt.Color
FROM nvarchar(20) NULL

ALTER TABLE Data.Stock
ALTER COLUMN Color Udt.Color

---------creating Udt.StockCode and changing data type of the StockCode column-----------------

CREATE TYPE Udt.StockCode
FROM nvarchar(50) NULL

ALTER TABLE Data.Stock
ALTER COLUMN StockCode Udt.StockCode

---------creating Udt.IsRHD and changing data type of the IsRHD column-----------------

CREATE TYPE Udt.IsRHD
FROM bit NULL

ALTER TABLE Data.Stock
ALTER COLUMN IsRHD Udt.IsRHD
---------creating Udt.DateBought and changing data type of the DateBought column-----------------

CREATE TYPE Udt.DateBought
FROM date NULL

ALTER TABLE Data.Stock
ALTER COLUMN DateBought Udt.DateBought

-----------creating small int Udt and changing data type of ModelID and StockID----------------

CREATE TYPE Udt.PrestigeSmallInt
FROM smallint NULL

ALTER TABLE Data.Stock
ALTER COLUMN ModelID Udt.PrestigeSmallInt

ALTER TABLE Data.Stock
ALTER COLUMN StockID Udt.PrestigeSmallInt


-----------------adding check contraints to the monetary values. cost, repair cost and parts cost already had contraints--------------

ALTER TABLE Data.Stock
ADD CHECK (TransportInCost > 0)

--Reference.SalesCategory may just be removed --
DROP TABLE IF EXISTS Reference.SalesCatgory 

DROP VIEW IF EXISTS
Reference.SalesCategoryView
GO
CREATE VIEW Reference.SalesCategoryView(LowerThreshold, UpperThreshold, CategoryDescription)
AS
SELECT 
10000, 25000, 'VeryLow'
UNION
SELECT
25001, 50000, 'Low'
UNION
SELECT
50001, 75001, 'Medium'
UNION
SELECT
75001, 100000, 'High'
UNION 
SELECT
100001, 150000, 'Very High'
UNION
SELECT
150001, 250000, 'Exceptional'
GO


