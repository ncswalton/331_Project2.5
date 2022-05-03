use PrestigeCars6

-- procedure to drop all columns
/*

*/
drop procedure if exists DropColumns
go
create procedure DropColumns
as
begin

-- Make table
alter table [data].Make
drop column MakeCountry

-- Country table
alter table [data].Country
drop column CountryISO3

alter table [data].Country
drop column CountryFlag

alter table [data].Country
drop column FlagFileName

alter table [data].Country
drop column FlagFileType

alter table [data].Country
drop column SalesRegion

--- Sales table

alter table [data].Sales
drop column ID

-- Model table
alter table [data].Model
drop column YearFirstProduced

alter table [data].Model
drop column YearLastProduced

alter table [data].Model
drop column ModelVariant

alter table [data].Customer
drop column Address2

end

