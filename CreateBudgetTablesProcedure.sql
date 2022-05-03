
drop procedure if exists Udt.CreateBudgetTablesProcedure
go
create procedure Udt.CreateBudgetTablesProcedure
as
begin
declare @start datetime2,
		@end datetime2

		select @start = sysdatetime();
SELECT * INTO [Udt].[Sales] FROM [Reference].Budget WHERE BudgetElement = N'Sales';

SELECT * INTO [Udt].[Color] FROM [Reference].Budget WHERE BudgetElement = N'Color';

SELECT * INTO [Udt].[Country] FROM [Reference].Budget WHERE BudgetElement = N'Country';

ALTER TABLE [Udt].[Sales]
DROP COLUMN BudgetElement;

ALTER TABLE [Udt].[Color]
DROP COLUMN Month, BudgetElement;

ALTER TABLE [Udt].[Country]
DROP COLUMN BudgetElement;

select @end = sysdatetime();
   	    exec Udt.[usp_TrackWorkFlow]
			@StartTime = @start,
			@EndTime = @end,
			@WorkFlowDescription = 'Creating the new budget tables',
			@UserAuthorizationKey = 0,
			@WorkFlowStepTableRowCount = null
end