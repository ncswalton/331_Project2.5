use PrestigeCars8

drop procedure if exists Udt.[usp_TrackWorkFlow]
go
create PROCEDURE Udt.[usp_TrackWorkFlow]
	-- Add the parameters for the stored procedure here
	@StartTime datetime2(7),
	@EndTime datetime2(7),
	@WorkFlowDescription nvarchar(100),
	@UserAuthorizationKey int,
	@WorkFlowStepTableRowCount int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	insert into Udt.WorkflowSteps
	(
	WorkFlowStepDescription,
	UserAuthorizationKey,
	StartingDateTime,
	EndingDateTime,
	WorkFlowStepTableRowCount
	)

	values
	(@WorkFlowDescription, 
	@UserAuthorizationKey, 
	@StartTime, 
	@EndTime,
	@WorkFlowStepTableRowCount);
END