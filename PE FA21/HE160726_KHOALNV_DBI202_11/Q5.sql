--Q5
Select pin.LocationID, l.Name as [LocationName], count(pin.LocationID) as NumberOfProducts
From ProductInventory pin join Location l
On pin.LocationID = l.LocationID
Group by pin.LocationID, l.Name, pin.LocationID
Order by count(pin.LocationID) desc

