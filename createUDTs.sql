use PrestigeCars6
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO 
CREATE SCHEMA Project2_5
GO
create schema Udt
go

CREATE PROCEDURE Project2_5.CreateUdts

AS
BEGIN
declare @start datetime2,
		@end datetime2
		select @start = sysdatetime();
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    --GO 
    --CREATE SCHEMA Udt;
    --GO

	CREATE TYPE Udt.PrestigeInt
	FROM int

	CREATE TYPE Udt.PrestigeSmallInt
	FROM smallint

	CREATE TYPE Udt.StringUdt
	FROM nvarchar(25)
	
	CREATE TYPE Udt.LongStringUdt
	FROM nvarchar(4000)

	CREATE TYPE Udt.PrestigeDateTime
	FROM datetime 

	CREATE TYPE Udt.PrestigeTinyInt
	FROM tinyint 

	CREATE TYPE Udt.PrestigeMoney
	FROM money

	CREATE TYPE Udt.PrestigeBit
	FROM bit NULL

	CREATE TYPE Udt.PrestigeNumeric
	FROM Numeric(18,2) NULL

	select @end = sysdatetime();
			select @end = sysdatetime();
	   	    exec Udt.[usp_TrackWorkFlow]
			@StartTime = @start,
			@EndTime = @end,
			@WorkFlowDescription = 'Creating UDTs',
			@UserAuthorizationKey = 0,
			@WorkFlowStepTableRowCount = null

END
GO

