--- ZAGI Retail Company Sales Department Database

--- Display the ProductID, ProductName, ProductPrice for all products with a price of $100 or higher
SELECT ProductID, ProductName, ProductPrice
FROM zagi.product
WHERE ProductPrice >= 100
GROUP BY ProductID, ProductName, ProductPrice
ORDER BY ProductPrice DESC;

--- Display the ProductID, ProductName, ProductPrice and VendorName for all products
--- Sort the results by ProductID in ascending order

SELECT ProductID, ProductName, ProductPrice, VendorName
FROM zagi.product p, zagi.vendor v 
WHERE p.VendorID = v.VendorID
GROUP BY ProductID, ProductName, ProductPrice, VendorName
ORDER BY ProductID ASC;

--- Display the ProductID, ProductName, ProductPrice, VendorName, CategoryName for all products
---Sort the results by ProductID in ascending order

SELECT ProductID, ProductName, ProductPrice, VendorName, CategoryName
FROM zagi.product p , zagi.category c, zagi.vendor v 
WHERE p.categoryid = c.categoryid
AND p.VendorID = v.VendorID
GROUP BY ProductID, ProductName, VendorName, CategoryName, ProductPrice
ORDER BY ProductID ASC;

--- Display the ProductID, ProductName, ProductPrice for all products belonging to the category whose CategoryName is 'Camping' 
--- Sort the results by ProductID in ascending order
SELECT ProductID, ProductName, ProductPrice
FROM (
SELECT ProductID, ProductName, ProductPrice, CategoryName
FROM zagi.product p, zagi.category c 
WHERE p.categoryid = c.categoryid
)
WHERE CategoryName = 'Camping'
GROUP BY ProductID, ProductName, ProductPrice
ORDER BY ProductID ASC;

--- Display the TID, CustomerName, TDate for all sales transactions involving the purchase of a product whose ProductName is 'Dura Boot'
SELECT DISTINCT s.TID, cus.CustomerName, s.TDate
FROM zagi.salestransaction s
JOIN zagi.customer cus
ON cus.CustomerID = s.CustomerID
JOIN zagi.soldvia sv
ON s.TID = sv.TID
JOIN zagi.product p
ON sv.ProductID = p.ProductID
WHERE p.ProductName = 'Dura Boot';

--- Display the RegionID, RegionName and the number of stores located in each region. Include all regions
SELECT r.RegionID, r.RegionName, COUNT(st.StoreID) AS number_of_store
FROM zagi.region r
LEFT JOIN zagi.store st
ON r.RegionID = st.RegionID
GROUP BY r.RegionID, r.RegionName;

--- Display the CategoryID, CategoryName and average product price for each product category
--- Include all product categories
SELECT c.CategoryID,c.CategoryName, AVG(p.ProductPrice) AS average_product_price
FROM zagi.category c
LEFT JOIN zagi.product p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;

--- Display the CategoryID and the total number of items purchased in each product category
--- Include all product categories

SELECT c.CategoryID, SUM(sv.noofitems) AS total_items_purchased
FROM zagi.category c
LEFT JOIN zagi.product p
ON c.CategoryID = p.CategoryID
LEFT JOIN zagi.soldvia sv
ON p.ProductID = sv.ProductID
GROUP BY c.CategoryID
ORDER BY c.CategoryID;




