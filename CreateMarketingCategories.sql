SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter PROCEDURE [dbo].[createmarketingcategories]
as
drop table if exists Data.MarketingCategories 
create TABLE Data.MarketingCategories(
    MarketingID int not null,
    MakeID int not null,
	[MarketingType] [nvarchar](20) NULL
) ON [PRIMARY]
ALTER TABLE [Data].[MarketingCategories]
    ADD CONSTRAINT PK_MarketingID PRIMARY KEY (MarketingID);
    alter table data.marketingcategories
    create type Udt.MarketingID
    from int 
GO
