
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Project2_5.AlterDataTypes 
	
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	------data.customer-----------
	ALTER TABLE Data.Customer
	ALTER COLUMN CustomerName Udt.StringUdt

	ALTER TABLE Data.Customer
	ALTER COLUMN Address1 Udt.StringUdt

	ALTER TABLE Data.Customer
	ALTER COLUMN Address2 Udt.StringUdt

	ALTER TABLE Data.Customer
	ALTER COLUMN City Udt.StringUdt

	ALTER TABLE Data.Customer
	ALTER COLUMN PostCode Udt.StringUdt

	ALTER TABLE Data.Customer
	ALTER COLUMN Country Udt.StringUdt

	ALTER TABLE Data.Customer
	ALTER COLUMN IsReseller Udt.PrestigeBit

	ALTER TABLE Data.Customer
	ALTER COLUMN IsCredRisk Udt.PrestigeBit

	ALTER TABLE Data.Customer
	ALTER COLUMN CustomerID Udt.PrestigeSmallInt

	-----------Data.Country------------ 
	ALTER TABLE Data.Country
	ALTER COLUMN  CountryName Udt.StringUdt

	ALTER TABLE Data.Country
	ALTER COLUMN  CountryCod Udt.StringUdt

	ALTER TABLE Data.Country
	ALTER COLUMN  SalesRegionID Udt.PrestigeSmallInt

	----------Data.Make------------
	ALTER TABLE Data.Make
	ALTER COLUMN MakeId UdtPrestigeSmallINT

	ALTER TABLE Data.Make
	ALTER COLUMN  MakeName Udt.StringUdt

	ALTER TABLE Data.Make
	ALTER COLUMN  CountryID Udt.PrestigeSmallInt


	-------------------Data.Stock----------

	ALTER TABLE Data.Stock
	ALTER COLUMN ModelID Udt.PrestigeSmallInt

	ALTER TABLE Data.Stock
	ALTER COLUMN Cost Udt.PrestigeMoney

	ALTER TABLE	 Data.Stock
	ALTER COLUMN RepairsCost Udt.PrestigeMoney

	ALTER TABLE Data.Stock
	ALTER COLUMN PartsCost Udt.PrestigeMoney

	ALTER TABLE Data.Stock
	ALTER COLUMN TransportInCost Udt.PrestigeMoney

	ALTER TABLE Data.Stock
	ALTER COLUMN IsRHD Udt.PrestigeBit

	ALTER TABLE Data.Stock
	ALTER COLUMN Color Udt.StringUdt

	ALTER TABLE Data.Stock
	ALTER COLUMN DateBought Udt.PrestigeDateTime

	ALTER TABLE Data.Stock
	ALTER COLUMN StockID Udt.PrestigeSmallInt

	---------------Data.Model------------------
	ALTER TABLE Data.Model
	ALTER COLUMN Model Udt.PrestigeSmallInt

	ALTER TABLE Data.Model
	ALTER COLUMN MakeID Udt.PrestigeSmallInt

	ALTER TABLE Data.Model
	ALTER COLUMN ModelName Udt.StringUdt

	---------------Data.Pivot-----------------

	-----------------Data.SalesRegion--------------

	ALTER TABLE Data.SalesRegion
	ALTER COLUMN SalesRegion Udt.StringUdt

	ALTER TABLE Data. SalesRegion
	ALTER COLUMN SalesRegionId Udt.PrestigeSmallInt

 ----------------Data.Sales-----------------
	ALTER TABLE Data.Sales
	ALTER COLUMN SalesId Udt.PrestigeSmallInt

	ALTER TABLE Data.Sales
	ALTER COLUMN CustomerId Udt.PrestigeSmallInt

	ALTER TABLE Data.Sales
	ALTER COLUMN InvoiceNumber Udt.StringUdt

	ALTER TABLE Data.Sales
	ALTER COLUMN TotalSalePrice Udt.PrestigeMoney

	ALTER TABLE Data.Sales
	ALTER COLUMN SaleDate Udt.PrestigeDateTime

	-------------Data.SalesDetails--------

	ALTER TABLE Data.SalesDetails
	ALTER COLUMN SalesDetailID Udt.PrestigeSmallInt

	ALTER TABLE Data.SalesDetails
	ALTER COLUMN SalesId Udt.PrestigeSmallInt

	ALTER TABLE Data.SalesDetails
	ALTER COLUMN LineItemNumber Udt.PrestigeTinyInt

	ALTER TABLE Data.SalesDetails
	ALTER COLUMN StockID Udt.PrestigeSmallInt

	ALTER TABLE Data.SalesDetails
	ALTER COLUMN SalesPrice Udt.PrestigeMoney

	ALTER TABLE Data.SalesDetails
	ALTER COLUMN LineItemDiscount Udt.PrestigeMoney

	-----------------Data.MarketingCategories--------
	ALTER TABLE Data.MarketingCategories
	ALTER COLUMN MarketingID Udt.PrestigeSmallInt

	ALTER TABLE Data.MarketingCategoriesz
	ALTER COLUMN MakeId Udt.PrestigeSmallInt

	ALTER TABLE Data.MarketingCategories
	ALTER COLUMN MarketingType Udt.StringUdt

	-------------SourceData.SalesInPounds-------

	ALTER TABLE SourceData.SalesInPounds
	ALTER COLUMN MakeName Udt.LongStringUdt

	ALTER TABLE SourceData.SalesInPounds
	ALTER COLUMN ModelName Udt.LongStringUdt

	ALTER TABLE SourceData.SalesInPounds
	ALTER COLUMN VehicleCost Udt.LongStringUdt

	---------------Reference.YearlySales--------------
	ALTER TABLE Reference.YearlySales
	ALTER COLUMN MakeName Udt.LongStringUdt

	ALTER TABLE Reference.YearlySales
	ALTER COLUMN ModelName Udt.LongStringUdt

	ALTER TABLE Reference.YearlySales
	ALTER COLUMN CustomerName Udt.LongStringUdt

	ALTER TABLE Reference.YearlySales
	ALTER COLUMN CountryName Udt.LongStringUdt

	ALTER TABLE Reference.YearlySales
	ALTER COLUMN Cost Udt.PrestigeMoney

	ALTER TABLE Reference.YearlySales
	ALTER COLUMN RepairsCost Udt.PrestigeMoney

	ALTER TABLE Reference.YearlySales
	ALTER COLUMN PartsCost Udt.PrestigeMoney

	ALTER TABLE Reference.YearlySales
	ALTER COLUMN TransportInCost Udt.PrestigeMoney

	ALTER TABLE Reference.YearlySales
	ALTER COLUMN SalePrice Udt.PrestigeNumeric

	ALTER TABLE Reference.YearlySales
	ALTER COLUMN SalesDate Udt.PrestigeDateTime

	--------------Reference.SalesBudgets---------------
	ALTER TABLE Reference.SalesBudget
	ALTER COLUMN BudgetArea Udt.LongPrestigeString --- change this o a varchar 35

	ALTER TABLE Reference.SalesBudget
	ALTER COLUMN BudgetAmount Udt.PrestigeMoney

	ALTER TABLE Reference.SalesBudget
	ALTER COLUMN BudgetYear Udt.PrestigeInt

	ALTER TABLE Reference.SalesBudget
	ALTER COLUMN DateUpdated Udt.PrestigeDateTime

	ALTER TABLE Reference.SalesBudget
	ALTER COLUMN Comments Udt.LongStringUdt

	ALTER TABLE Reference.SalesBudget
	ALTER COLUMN BudgetMonth Udy.PrestigeTinyInt

	--------------SourceData.SalesText-----------------
	ALTER TABLE SourceData.SalesText
	ALTER COLUMN CountryName Udt.LongStringUdt

	ALTER TABLE SourceData.SalesText
	ALTER COLUMN MakeName Udt.LongStringUdt

	ALTER TABLE SourceData.SalesText
	ALTER COLUMN Cost Udt.StringUdt

	ALTER TABLE SourceData.SalesText
	ALTER COLUMN SalePrice Udt.StringUdt
	-------------Output.StockPrices----------------------
	ALTER TABLE Output.StockPrices
	ALTER COLUMN MakeName Udt.LongStringUdt

	ALTER TABLE Output.StockPrices
	ALTER COLUMN ModelName Udt.LongStringUdt
	------------Refrence.SalesCategory-------------------
		ALTER TABLE Reference.SalesCategory
		ALTER COLUMN LowerThreshold Udt.PrestigeInt

		ALTER TABLE SourceData.SalesText
		ALTER COLUMN UpperThreshold Udt.PrestigeInt

		ALTER TABLE SourceData.SalesText
		ALTER COLUMN CategoryDescription Udt.LongStringUdt

END
GO
