create or alter PROCEDURE Udt.[CreateConstraints] @UserAuthorizationKey int
AS
BEGIN

set nocount on
    declare @start as datetime
    declare @end as datetime
    select @start = SYSDATETIME();

	--Constraints for Data.Customer
	ALTER TABLE [Data].Customer
    with check ADD CONSTRAINT PK_Stock PRIMARY KEY ([CustomerID])
	

	--Constraints for Data.Country
	alter table [data].Country
	with check add constraint [fk_SalesRegionId]
	foreign key([SalesRegionId])
	references [data].SalesRegion([SalesRegionId])

	alter table [data].Country
	with check add constraint [ck_CountryCode]
	check (len([CountryCode])=(2))

	alter table [data].Country
	with check add constraint [ck_CountryName]
	check (len([CountryName]) in (3, 15))



	--Constraints for Data.Make
	--Make Primary
	ALTER TABLE [Data].Make
    with check ADD CONSTRAINT PK_Stock PRIMARY KEY (MakeID)


	

	--Constraints for Data.Stock
	--Make Primary Key

	ALTER TABLE [Data].Stock
    with check ADD CONSTRAINT PK_Stock PRIMARY KEY (StockID)

	ALTER TABLE Data.Stock
	ADD CHECK (TransportInCost > 0)


	--Constraints for Data.Model
	Alter TABLE Data.Model ADD  CONSTRAINT [PK_Model] PRIMARY KEY (ModelID),
	CONSTRAINT FK_MakeID FOREIGN KEY (MakeID) REFERENCES Data.Make

	alter TABLE Data.model
	with check add constraint ck_ModelName
	CHECK (ModelName LIKE '%[^ -~A-Z0-9]%') ;
	end

	--Constraints for Data.Pivot
	--

	--Constraints for Data.SalesRegion
	alter table [data].SalesRegion
	with check add constraint [ck_SalesRegion]
	check (len([SalesRegion]) in (2, 15))


	--Constraints for Sales.Details
	alter table [Data].[SalesDetails]
	with check add constraint PK_SalesDetailsID
	Primary Key(SalesDetailsID)

	alter table [Data].[SalesDetails]
	with check add constraint [fk_SalesId]
	foreign key([SalesID])
	references [Data].[Sales]([SalesID])

	alter table [Data].[SalesDetails]
	with check add constraint [fk_StockID]
	foreign key(StockID)
	references [Data].[Stock](StockID)


	--Constraints for Data.Sales
	ALTER TABLE [Data].[Sales]
    with check ADD CONSTRAINT PK_Sales PRIMARY KEY (SalesID),
    CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES [Data].[Customer]

	--Constraints for Data.MarketingCategory
	ALTER TABLE [Data].[MarketingCategories]
    ADD CONSTRAINT PK_MarketingID PRIMARY KEY (MarketingID);

