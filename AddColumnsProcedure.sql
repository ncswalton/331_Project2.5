use PrestigeCars8
go
drop procedure if exists AddColumns
go
create procedure AddColumns
as
begin
declare @start datetime2,
		@end datetime2

		select @start = sysdatetime();
---- renaming
exec sp_rename '[Data].Country.CountryISO2', 'CountryCode', 'COLUMN';
exec sp_rename '[Data].Customer.Town', 'City', 'COLUMN';
exec sp_rename '[Data].Customer.Country', 'CountryCode', 'COLUMN';

alter table data.country
add CountryId Udt.PrestigeSmallInt identity(1,1)

alter table [data].country
add primary key([CountryId])

alter table [data].Make
add CountryId Udt.PrestigeSmallInt not null default(0)

alter table data.country
add SalesRegionId Udt.PrestigeSmallInt not null
default (0);

ALTER TABLE Data.Stock
ADD StockID Udt.PrestigeSmallInt NOT NULL IDENTITY(1,1)

alter table [data].stock
add primary key([StockID])

-- rename GER to DEU in Make table
update [data].Make
set [MakeCountry] = replace([MakeCountry], 'GER', 'DEU')

select @end = sysdatetime();

	   	    exec Udt.[usp_TrackWorkFlow]
			@StartTime = @start,
			@EndTime = @end,
			@WorkFlowDescription = 'Adding and renaming some columns',
			@UserAuthorizationKey = 0,
			@WorkFlowStepTableRowCount = null

end


-- Delete erroneous rows from SalesDetail and 1 erroneous row from Stock

--Delete from [Data].[Stock] where StockID = 395

---- Delete from [Data].[SalesDetails] where StockID = 205 or StockID = 206 or StockID = 244
--delete from [data].Stock where StockCode = '1A80A54C-D98D-41D6-87EE-8F67F3B06FA8'
--delete from [data].Stock where StockCode = '38264675-F235-412B-9B67-8F8CD86CF40D'
--delete from [data].Stock where StockCode = '2EE943CB-2473-4333-8626-FC94FCD0947E'

----todo: delete the rest of the data



--stock IDs: 205 206 244

--sales IDs: 166 167 197

--sales details ID: 180 181 216
select * from [data].SalesDetails
where SalesID = 166 or SalesID = 167 or SalesID = 216