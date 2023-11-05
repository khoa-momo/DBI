--Q4 
Select p.ProductID, p.Name as [ProductName], p.Color, m.ModelID, m.Name as [ModelName], pp.StartDate, pp.EndDate, pp.Price as [HistoryPrice]
From ProductModel m full join Product p
On m.ModelID = p.ModelID full join ProductPriceHistory pp
On p.ProductID = pp.ProductID
Where p.Color = 'Black' and p.Name like 'HL%' 