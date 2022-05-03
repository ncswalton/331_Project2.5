drop procedure if EXISTS Udt.DeleteRows
go
Create procedure Udt.DeleteRows
as 
begin
declare @start datetime2,
		@end datetime2

		select @start = sysdatetime();
set NOCOUNT on

delete from [data].Stock where StockCode = '1A80A54C-D98D-41D6-87EE-8F67F3B06FA8'
delete from [data].Stock where StockCode = '38264675-F235-412B-9B67-8F8CD86CF40D'
delete from [data].Stock where StockCode = '2EE943CB-2473-4333-8626-FC94FCD0947E'
delete from data.Stock where ModelId is NULL
delete from data.SalesDetails where SalesDetailsID=180 
delete from data.SalesDetails where SalesDetailsID=181
delete from data.SalesDetails where SalesDetailsID=216

delete from data.SalesDetails where SalesID=166
delete from data.SalesDetails where SalesID=167
delete from data.SalesDetails where SalesID=197

select @end = sysdatetime();
   	    exec Udt.[usp_TrackWorkFlow]
			@StartTime = @start,
			@EndTime = @end,
			@WorkFlowDescription = 'deleting erroneous rows',
			@UserAuthorizationKey = 0,
			@WorkFlowStepTableRowCount = null


end 
go