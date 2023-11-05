Select *
From Orders
Where OrderDate =
	(
	Select max(OrderDate)
	From Orders
	)