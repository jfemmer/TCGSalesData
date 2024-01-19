--Total Number of Card Sales
SELECT SUM(Quantity_Ordered) AS CARD_SALES
FROM TCGorderList

--Average Number of Cards Ordered
SELECT SUM(Quantity_Ordered) / COUNT(Quantity_Ordered) AS Average_Cards
FROM TCGorderList

--Total Number of Orders Per Day
SELECT COUNT(Order_Date) As Num_Sales, Order_Date As Date
FROM TCGorderList
GROUP BY Order_Date
ORDER BY Num_Sales DESC

--Total Sales
SELECT SUM(Product_Amt) AS Total_Sales
FROM TCGorderList

--Delete Null Column
ALTER TABLE TCGorderList
DROP COlUMN	F14

--Most Card Orders Per State
SELECT State As State, COUNT(State) As State_Orders
FROM TCGorderList
GROUP BY State
ORDER BY State_Orders DESC

--Per Capita of orders Per State
SELECT TCGorderList.State, COUNT(TCGorderList.State) / State_Pop.Population As Per_Capita
FROM TCGorderList, State_Pop
WHERE TCGorderList.State = State_Pop.State
GROUP By TCGorderList.State,State_Pop.State, State_Pop.Population
ORDER By Per_Capita DESC

--What Cities in California have the most sales
SELECT COUNT(OrderNum) AS Order_Count, City AS California_City
FROM TCGorderList
WHERE State = 'CA'
GROUP BY City
ORDER BY COUNT(City) DESC











