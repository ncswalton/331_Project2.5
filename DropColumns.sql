use PrestigeCars6
/*
procedure to drop all columns
*/
drop procedure if exists DropColumns
go
create procedure DropColumns
as
begin
declare @start datetime2,
		@end datetime2
		
		select @start = sysdatetime();

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

select @end = sysdatetime();

   	    exec Udt.[usp_TrackWorkFlow]
			@StartTime = @start,
			@EndTime = @end,
			@WorkFlowDescription = 'Dropping unneeded columns',
			@UserAuthorizationKey = 0,
			@WorkFlowStepTableRowCount = null
end

