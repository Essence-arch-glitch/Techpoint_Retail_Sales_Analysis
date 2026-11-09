create database techpoint_retail;
Use techpoint_retail;
Show Tables;
Select * from sales;
SELECT * FROM PRODUCT;
SELECT * FROM CUSTOMERS;
SELECT count(*) AS total_sales FROM sales;
SELECT count(*) AS totla_products FROM product;
SELECT count(*) AS total_customers FROM customers;
SELECT
	`product`, SUM(`Net Sales (NGN)`) AS Total_Revenue From sales
    WHERE `Order Status` ='Delivered' GROUP BY product ORDER BY Total_Revenue DESC;
    SELECT
			Region,
            SUM(`Net Sales (NGN)`) AS Total_Revenue
	FROM sales WHERE `Order Status` = 'Delivered' GROUP BY Region 
    ORDER BY Total_Revenue Desc;
    SELECT
		`Customer Segment`, SUM(`Net Sales (NGN)`) AS Total_Revenue
        FROM sales WHERE `Order Status` = 'Delivered' GROUP BY `Customer Segment` 
        ORDER BY Total_Revenue Desc;
        SELECT
    MONTHNAME(`Order Date`) AS Sales_Month,
    SUM(`Net Sales (NGN)`) AS Total_Revenue
FROM sales
WHERE `Order Status` = 'Delivered'
GROUP BY MONTH(`Order Date`), MONTHNAME(`Order Date`)
ORDER BY MONTH(`Order Date`);
Describe sales;
SELECT `Order Date` FROM sales LIMIT 5;
ALTER TABLE sales ADD COLUMN Order_Date_Corrected Date;
UPDATE sales SET Order_Date_Corrected = str_to_date(TRIM(`Order Date`), '%c/%e/%Y');
SELECT
	`Order Date`, str_to_date(`Order Date`, '%c/%e/%Y') AS Converted_Date
    FROM sales LIMIT 10;
     
SELECT
    MONTHNAME(STR_TO_DATE(`Order Date`, '%c/%e/%Y')) AS Sales_Month,
    SUM(`Net Sales (NGN)`) AS Total_Revenue
FROM sales
WHERE `Order Status` = 'Delivered'
GROUP BY
    MONTH(STR_TO_DATE(`Order Date`, '%c/%e/%Y')),
    MONTHNAME(STR_TO_DATE(`Order Date`, '%c/%e/%Y'))
ORDER BY
    MONTH(STR_TO_DATE(`Order Date`, '%c/%e/%Y'));
    SELECT
		`Payment Method`, SUM(`Net Sales (NGN)`) AS Total_Revenue, Count(*) AS Total_Transactions FROM sales
        WHERE `Order Status` ='Delivered'
        GROUP BY `Payment Method` ORDER BY Total_Revenue Desc;
SELECT
	`Sales Channel`,
    SUM(`Net Sales (NGN)`) AS Total_Revenue,
    COUNT(*) AS Total_Transactions From sales WHERE `Order Status` = 'Delivered' GROUP BY `Sales Channel`
    ORDER BY Total_Revenue DESC;
SELECT
`Sales Channel`, SUM(`Net Sales (NGN)`) AS Total_Revenue, COUNT(*) AS Total_Transactions, ROUND(SUM(`Net Sales (NGN)`) / COUNT(*),
2) AS Average_order_Value FROM sales
	WHERE `Order Status` = 'Delivered'
	Group By `Sales Channel` 
	Order by Average_Order_Value DESC;
SELECT
	`Sales Representative`,SUM(`Net sales (NGN)`) AS Total_Revenue,
    count(*) AS Total_Transactions, ROUND(avg(`Net Sales (NGN)`),2)
    AS Average_Order_Value
    FROM sales
    WHERE `Order Status` = 'Delivered' GROUP BY `Sales Representative`
    ORDER BY Total_Revenue DESC;
SELECT
	Category, SUM(`Net Sales (NGN)`)AS Total_Revenue, Count(*) AS Total_Transaction, SUM(Quantity) AS Units_Sold
    FROM sales WHERE `Order Status` ='Delivered'
    Group By Category
    Order By Total_Revenue DESC;
SELECT 
	`Order Status`,
    count(*) As Total_Orders, Round
    (Count(*) * 100.0/ (SELECT COUNT(*) FROM sales),
    2) AS Percentage 
    From sales
    Group By `Order Status` ORDER BY Total_Orders DESC;
SELECT 
	Product,
    ROUND(AVG(`Discount %`),2) AS Average_Discount,
    SUM(`Discount Amount (NGN)`) AS Total_Discount,
    SUM(`Net sales (NGN)`) As Net_Revenue
    FROM sales 
    WHERE `Order Status` = 'Delivered'
    GROUP BY Product
    ORDER BY Total_Discount DESC;
SELECT
	`Customer Name`, `Customer Segment`,
    COUNT(*) AS Total_orders,
    SUM(`Net Sales (NGN)`) AS Total_Revenue,
    ROUND(AVG(`Net Sales (NGN)`),2)
    AS Average_Order_Value FROM sales 
    WHERE `Order Status` = 'Delivered'
    GROUP BY `Customer Name`,
			`Customer Segment`
	Order By Total_Revenue Desc
    LIMIT 10;
    
    
    
    
    
    
    


