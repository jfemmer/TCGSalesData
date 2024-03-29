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

--Break Down of What zip codes in San Fran have the most orders.
SELECT Zip, COUNT(Zip)
FROM TCGorderList
WHERE City = 'San Francisco' AND State = 'CA'
GROUP BY Zip, City
ORDER BY COUNT(City) DESC

--November Daily Sales
SELECT CAST(Order_Date AS date) AS Date, SUM(Product_Amt) AS Sales, COUNT(Order_Date) AS Order_Count
FROM TCGorderList
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30'
GROUP BY Order_Date
ORDER BY Order_Date

--November Monthly Sales
SELECT SUM(Product_Amt) AS Sales
FROM TCGorderList
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30'

--December Daily Sales
SELECT CAST(Order_Date AS date) AS Date, SUM(Product_Amt) AS Sales, COUNT(Order_Date) AS Order_Count
FROM TCGorderList
WHERE Order_Date BETWEEN '2023-12-01' AND '2023-12-31'
GROUP BY Order_Date
ORDER BY Order_Date

--December Monthly Sales
SELECT SUM(Product_Amt) AS Sales
FROM TCGorderList
WHERE Order_Date BETWEEN '2023-12-01' AND '2023-12-31'

--January Daily Sales
SELECT CAST(Order_Date AS date) AS Date, SUM(Product_Amt) AS Sales, COUNT(Order_Date) AS Order_Count
FROM TCGorderList
WHERE Order_Date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY Order_Date
ORDER BY Order_Date

--January Monthly Sales
SELECT SUM(Product_Amt) AS Sales
FROM TCGorderList
WHERE Order_Date BETWEEN '2024-01-01' AND '2024-01-31'


--February Daily Sales
SELECT CAST(Order_Date AS date) AS Date, SUM(Product_Amt) AS Sales, COUNT(Order_Date) AS Order_Count
FROM TCGorderList
WHERE Order_Date BETWEEN '2024-02-01' AND '2024-02-28'
GROUP BY Order_Date
ORDER BY Order_Date

--February Monthly Sales
SELECT SUM(Product_Amt) AS Sales
FROM TCGorderList
WHERE Order_Date BETWEEN '2024-02-01' AND '2024-02-28'


--Find What highest Product Cost will give a loss
SELECT *
FROM TCGorderList
WHERE Net_Profit < 0
ORDER BY Product_Amt DESC

--Total Loss on orders
SELECT SUM(Net_Profit) AS Loss
FROM TCGorderList
WHERE Net_Profit < 0

SELECT *
FROM TCGorderList









