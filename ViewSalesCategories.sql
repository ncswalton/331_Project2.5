Create View ViewSalesCategory

as
select distinct
sd.Salesid, 
mo.ModelID,

case when sd.saleprice > 1 and sd.saleprice <=25000 then 'Very Low'
when sd.SalePrice > 25001 and sd.saleprice < 50001 then 'Low'
when sd.SalePrice > 50001 and sd.SalePrice < 75000 then 'Medium'
When sd.SalePrice > 75001 and sd.SalePrice < 100000 then 'High'
when sd.SalePrice > 100001 and sd.SalePrice <150000 then 'Very High'
when sd.SalePrice > 150001 and sd.SalePrice <400000 then 'Exceptional' end as CategoryDescription

from data.stock as st
inner join data.SalesDetails as sd
on st.StockCode = sd.StockID
inner join data.Sales as sa
on sd.SalesID = sa.SalesID
inner join data.Model as mo
on st.ModelID = mo.ModelID