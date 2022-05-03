use PrestigeCars8

drop procedure if exists CreateSalesRegionTable
go
create procedure CreateSalesRegionTable
as
begin
declare @start datetime2,
		@end datetime2
		select @start = sysdatetime();

drop table if exists [data].SalesRegion

create table [data].SalesRegion (SalesRegion Udt.StringUdt)

--3
alter table [data].SalesRegion
add SalesRegionId Udt.PrestigeSmallInt primary key identity(1,1)

--4
insert into [data].SalesRegion (SalesRegion)
select distinct SalesRegion
from [data].Country

--5
alter table [data].SalesRegion
with check add constraint [ck_SalesRegion2]
check (len([SalesRegion]) > 1 and len([SalesRegion]) < 25)

	select @end = sysdatetime();
	   	    exec Udt.[usp_TrackWorkFlow]
			@StartTime = @start,
			@EndTime = @end,
			@WorkFlowDescription = 'Creating SalesRegion table',
			@UserAuthorizationKey = 0,
			@WorkFlowStepTableRowCount = null

end