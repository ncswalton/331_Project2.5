use QueensClassSchedule;
go
Create PROCEDURE [Project3].[CheckConstraints]
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;
    declare @start as datetime2, @end as datetime2;
    set @start = SYSDATETIME()
    alter table Project3.Department
    with check add constraint [ck_DepartmentCode]
    check (len([DepartmentCode])<=7);

    Alter table Project3.BuildingLocation
    with check add constraint [ck_BuildingAcronyms]
	check (BuildingAcronyms like '[A-Z]{3}');
    
    alter table Project3.RoomLocation
    with check add constraint [ck_RoomNumber]
    CHECK (RoomNumber not LIKE '%[^ -~A-Z0-9]');

    select RoomNumber from Project3.RoomLocation
    where Roomnumber not LIKE '%[^ -~A-Z0-9]%'

    alter table Project3.Instructor
    with check add constraint [ck_FullName]
    check (FirstName not like '%[^ -~A-Z]'),  
    check (LastName not like '%[^ -~A-Z]');


    Alter table Project3.ModeofInstruction
    with check add constraint [ck_ModeofInstruction]
    check (ModeofInstruction not like '%[^ -~A-Z]' )


    Alter table Project3.Courses
   -- drop CONSTRAINT CK__Courses__Hours__30242045
  --  CK__Courses__CourseD__25A691D2
    with check add CONSTRAINT [ck_Courses]
    check (CourseNumber not like '%[^ -~A-Z0-9]'),  
    check (Credits like '[0-9]'),
    check ([Hours] like '[0-9]');,
    check (CourseDescription not like '%[^ -~A-Z0-9]');

    Alter table Project3.Class
    with check add constraint [ck_Class]
    check (enrolled like '[0-9]{3}'),
    check (Code  like '[0-9]{5}'),
    check (Day1 like '[A-Z]{3}'),
    check (Day2 like '[A-Z]{4}'),
    check (Day3 like '[A-Z]{8}');


   end;
   go