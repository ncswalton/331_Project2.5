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


-- SalesDetails table - delete erroneous rows

Delete from [Data].[SalesDetails] where SalesDetailsID = 180 and SalesDetailsID = 181 and SalesDetailsID = 216
--todo: delete the rest of the data

-- Stock - add StockID

end

--stock IDs: 205 206 244

--sales IDs: 166 167 197

--sales details ID: 180 181 216
