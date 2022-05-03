Create procedure [dbo].[InsertMarketingCategories]
as BEGIN
set nocount on
INSERT Test.MarketingCategories
    ( [MarketingID], [MakeID], [MarketingType])
VALUES
    (1, 1,  N'Sports')
,
    (2, 2,  N'Sports'),
    (3, 2,  N'Tourer'),
    (4, 3,  N'Sports'),
    (5, 4,  N'Sports')
,
    (6, 4, N'Aston Martin', N'Tourer'),
    (7, 5,  N'Tourer') ,
    (8, 5,  N'Chauffer'),
    (9, 5,  N'Prestige')
,
    (10, 6,  N'Chauffer'),
    (11, 6,  N'Prestige'),
    (12, 7, N'Chauffer')
,
    (13, 7, N'Prestige')
,
    (14, 8, N'Tourer')
,
    (15, 8, N'Sports')
 ,
    (16, 9,  N'Sports')

,
    (17, 10,  N'Relic')
,
    (18, 11,  N'Sports')
,
    (19, 11,  N'Tourer')
,
    (20, 12,  N'Sports')
,
    (21, 13,  N'Family')
,
    (22, 14, N'Family')
,
    (23, 15,  N'Sports')
,
    (24, 15, N'Family')
,
    (25, 16,  N'Sports')
,
    (26, 16,  N'Family')
,
    (27, 17,  N'Sports')
,
    (28, 18, N'Sports')
,
    (29, 19,  N'Sports')
,
    (30, 20,  N'Sports')
,
    (31, 21,  N'Sports')
,
    (32, 22,  N'Family')
,
    (33, 23,  N'Family')
,
    (34, 24,  N'Family')
,
    (35, 25,  N'Family')
,
    (36, 26, N'Family')

END

GO
