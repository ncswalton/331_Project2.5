SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create or Alter PROCEDURE Udt.[createmarketingcategories]
as
declare @start datetime2,
		@end datetime2

		select @start = sysdatetime();

drop table if exists Data.MarketingCategories 
create TABLE Data.MarketingCategories(
    MarketingID int not null,
    MakeID int not null,
	[MarketingType] [nvarchar](20) NULL
) ON [PRIMARY]

ALTER TABLE [Data].[MarketingCategories]
    ADD CONSTRAINT PK_MarketingID PRIMARY KEY (MarketingID);

		select @end = sysdatetime();
	   	    exec Udt.[usp_TrackWorkFlow]
			@StartTime = @start,
			@EndTime = @end,
			@WorkFlowDescription = 'Creating Marketing Categories',
			@UserAuthorizationKey = 0,
			@WorkFlowStepTableRowCount = null
GO
