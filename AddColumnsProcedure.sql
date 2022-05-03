use PrestigeCars6

-- procedure to add all needed columns
-- also handle populating the columns here?

go
drop procedure if exists AddColumns
go
create procedure AddColumns
as
begin

-- drop customerId now to avoid issues later
exec Udt.dropCustomerId
---- renaming
exec sp_rename '[Data].Country.CountryISO2', 'CountryCode', 'COLUMN';
exec sp_rename '[Data].Customer.Town', 'City', 'COLUMN';
exec sp_rename '[Data].Customer.Country', 'CountryCode', 'COLUMN';

-- create PKs
-- have to drop the CustomerID column first
--

alter table data.country
add CountryId Udt.PrestigeSmallInt identity(1,1)

alter table [data].country
add primary key([CountryId])

alter table [data].Make
add CountryId Udt.PrestigeSmallInt not null default(0)

-- commenting out customerId
-- alter table [data].customer
-- add CustomerId Udt.PrestigeSmallInt identity(1,1);

--alter table [data].customer
--add primary key([CustomerId])

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


-- Delete erroneous rows from SalesDetail and 1 erroneous row from Stock

-- Delete from [Data].[SalesDetails] where StockID = 205 or StockID = 206 or StockID = 244

Delete from [Data].[Stock] where StockID = 395

delete from [data].Stock where StockCode = '1A80A54C-D98D-41D6-87EE-8F67F3B06FA8'
delete from [data].Stock where StockCode = '38264675-F235-412B-9B67-8F8CD86CF40D'
delete from [data].Stock where StockCode = '2EE943CB-2473-4333-8626-FC94FCD0947E'

-- Delete from [data].[Stock] where StockID = 205 and StockID = 206 and StockID = 244
-- doing this above with StockCode

--todo: delete the rest of the data

-- Stock - add StockID

end

--stock IDs: 205 206 244

--sales IDs: 166 167 197

--sales details ID: 180 181 216
select * from [data].SalesDetails
where StockId = 205
or StockID = 206 
or StockID
