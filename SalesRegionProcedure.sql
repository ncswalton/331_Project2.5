use PrestigeCars6

drop procedure if exists CreateSalesRegionTable
go
create procedure CreateSalesRegionTable
as
begin
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
check (len([SalesRegion]) in (1, 25))

end