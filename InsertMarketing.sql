Create procedure InsertMarketingCategories
as BEGIN
set nocount on
INSERT Test.MarketingCategories
    ( [MarketingID], [MakeID], [MarketingType])
VALUES
    (1, 1, N'Ferrari', N'Sports'),
    (2, 2, N'Porsche', N'Sports'),
    (3, 2, N'Porsche', N'Tourer'),
    (4, 3, N'Lamborghini', N'Sports'),
    (5, 4, N'Aston Martin', N'Sports'),
    (6, 4, N'Aston Martin', N'Tourer'),
    (7, 5, N'Bentley', N'Tourer') ,
    (8, 5, N'Bentley', N'Chauffer'),
    (9, 5, N'Bentley', N'Prestige'),
    (10, 6, N'Rolls Royce', N'Chauffer'),
    (11, 6, N'Rolls Royce', N'Prestige'),
    (12, 7, N'Maybach', N'Chauffer'),
    (13, 7, N'Maybach', N'Prestige'),
    (14, 8, N'Mercedes', N'Tourer'),
    (15, 8, N'Mercedes', N'Sports'),
    (16, 9, N'Alfa Romeo', N'Sports'),
    (17, 10, N'Austin', N'Relic'),
    (18, 11, N'BMW', N'Sports'),
    (19, 11, N'BMW', N'Tourer'),
    (20, 12, N'Bugatti', N'Sports'),
    (21, 13, N'Citroen', N'Family'),
    (22, 14, N'Delahaye', N'Family'),
    (23, 15, N'Delorean', N'Sports'),
    (24, 15, N'Delorean', N'Family'),
    (25, 16, N'Jaguar', N'Sports'),
    (26, 16, N'Jaguar', N'Family'),
    (27, 17, N'Lagonda', N'Sports')
,
    (28, 18, N'McLaren', N'Sports')
,
    (29, 19, N'Morgan', N'Sports')
,
    (30, 20, N'Noble', N'Sports')
,
    (31, 21, N'Triumph', N'Sports')
,
    (32, 22, N'Trabant', N'Family')
,
    (33, 23, N'Peugeot', N'Family')
,
    (34, 24, N'Reliant', N'Family')
,
    (35, 25, N'Riley', N'Family')
,
    (36, 26, N'Cadillac', N'Family')

END

