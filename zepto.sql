																			-- CREATING A NEW DATABASE
CREATE DATABASE ZEPTO;

																			-- USING IT
USE ZEPTO;
SET SQL_SAFE_UPDATES=0;
-- COLUMN IN DATA SET
-- Category,name,mrp,discountPercent,availableQuantity,discountedSellingPrice,weightInGms,outOfStock,quantity

																			-- CREATING A TABLE 
CREATE TABLE Zepto
			(Id INT auto_increment primary key,
            Category VARCHAR(120),
            Name VARCHAR(150),
            Mrp DECIMAL(10,2),
            Discountpercent DECIMAL(10,2), 
            Availablequnatity INT,
            Disaccount_Selling_Price DECIMAL(10,2),
            Weight_GMS INT 
            );

																			  -- CHANGING COLUMN NAME & DATA TYPES
ALTER TABLE Zepto  CHANGE COLUMN outOfStock out_of_Stock BOOLEAN;
ALTER TABLE Zepto CHANGE COLUMN Discountpercent Discount_Percent DECIMAL(10,2);
ALTER TABLE Zepto CHANGE COLUMN Availablequnatity Available_Qunatity DECIMAL(10,2);

																			 -- ADDING A  COLUMNM 
ALTER TABLE Zepto  ADD COLUMN Quantity INT;

																			 -- EXPLOING A DATA IN THE TABLE 		



																			 -- CHECKING FOR A NULL VALUE 
SELECT
	SUM(ISNULL(Category)),SUM(ISNULL(name)),SUM(ISNULL(mrp)),SUM(ISNULL(Discount_Percent)),
    SUM(ISNULL(Available_Qunatity)),SUM(ISNULL(Disaccount_Selling_Price)),
    SUM(ISNULL(Weight_GMS)),SUM(ISNULL(Quantity)) 
FROM
	Zepto;
    
																			 -- UNIQUE CATEGORIES 
SELECT DISTINCT Category,COUNT(Category) FROM zepto GROUP BY Category;															

																			-- TOTAL STOCK &  OUT_OF STOCK  PRODUCTS

(SELECT CONCAT("IN STOCK - ", SUM(CASE WHEN out_of_Stock=1 THEN 1 ELSE 0 END) ) AS STATUS FROM  zepto	)	
UNION							
(SELECT CONCAT("OUT OF STOCK - ", SUM(CASE WHEN out_of_Stock=0 THEN 1 ELSE 0 END) ) AS STATUS FROM  zepto	);


																			-- PRODUCT & TOTAL COUNT
SELECT Name,COUNT(Name) FROM zepto GROUP BY Name ORDER BY COUNT(Name) DESC,Name;

																			-- DATA CLEANING

UPDATE Zepto SET Mrp=MRP/100, Disaccount_Selling_Price=Disaccount_Selling_Price/100 WHERE Mrp>1 ;


																		-- TOP 10 Discount_Percent Product
SELECT DISTINCT Name,Discount_Percent FROM zepto ORDER BY Discount_Percent DESC LIMIT 10;

																		-- TOP Mrp PRODUCT BUT out_of_Stock
SELECT Name,Mrp FROM zepto WHERE out_of_Stock=1 ORDER BY Mrp DESC LIMIT 30;

																		-- TOTAL REVENUE
SELECT Category,SUM(Disaccount_Selling_Price*Available_Qunatity) FROM zepto GROUP BY Category;	

																		-- Mrp greater than	500 & Discount_Percent LESS THAN 10

SELECT DISTINCT Id,Name FROM zepto WHERE Mrp>500 AND Discount_Percent<10 ORDER BY Mrp DESC;

																		-- TOP 5 BEST AVGERAGE DISCOUNT

SELECT Category,ROUND(AVG(Discount_Percent),2) FROM zepto GROUP BY Category ORDER BY AVG(Discount_Percent) DESC LIMIT 5;

																		-- PRICE PER GRAM

SELECT DISTINCT Name,Mrp,Weight_GMS,Weight_GMS/Mrp AS Price_Per_Gram FROM zepto ORDER BY Price_Per_Gram DESC;

																		-- Category Based on Weight

SELECT 
	ID,NAME,
    CASE
		WHEN Weight_GMS>1000 THEN "HIGH"
        WHEN Weight_GMS>500 AND Weight_GMS<1000 THEN "MEIDUM"
        ELSE "LOW"
	END AS Weight_Category
FROM
	zepto;
    
																		-- TOTAL WEIGHT PER Category
SELECT Category,ROUND(SUM(Weight_GMS*Available_Qunatity),2) FROM zepto GROUP BY Category ;

