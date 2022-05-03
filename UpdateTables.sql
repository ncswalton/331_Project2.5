use PrestigeCars6

drop procedure if exists AddData
go
create procedure AddData
as
begin

declare @end datetime2,
		@start datetime2

select @start = sysdatetime();

-- Country table
update data.Country
set Data.Country.SalesRegionId = Data.SalesRegion.SalesRegionId
from Data.Country 
inner join Data.SalesRegion 
on Data.Country.SalesRegion = Data.SalesRegion.SalesRegion;

-- SalesDetails
Update [Data].[SalesDetails]
SET [Data].[SalesDetails].StockID = b.StockID
from  [Data].[SalesDetails] as a inner join [Data].[Stock] as b on  a.StockID = b.StockCode

-- Data.Make
-- had to edit the last line
update [data].Make
set [data].Make.CountryId = [data].Country.CountryId
from [data].Make
inner join [data].Country
on [data].Make.MakeCountry = [data].Country.CountryISO3

select @end = sysdatetime();

   	    exec Udt.[usp_TrackWorkFlow]
			@StartTime = @start,
			@EndTime = @end,
			@WorkFlowDescription = 'Updating tables with new data',
			@UserAuthorizationKey = 0,
			@WorkFlowStepTableRowCount = null

end

select * from [data].Country
select * from [data].make
select * from [data].Customer
select * from [data].Model
select * from [data].Stock
select * from [data].Sales
select * from [data].SalesDetails
select * from [data].SalesRegion
