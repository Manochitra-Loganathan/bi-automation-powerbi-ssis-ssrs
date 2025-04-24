
CREATE VIEW vw_sales_summary AS
SELECT 
  FORMAT(Date, 'yyyy-MM') AS SalesMonth,
  Region,
  Product,
  Channel,
  SalesRep,
  COUNT(*) AS SalesCount,
  SUM(Quantity) AS UnitsSold,
  ROUND(AVG(UnitPrice), 2) AS AvgUnitPrice,
  ROUND(AVG(DiscountRate), 2) AS AvgDiscountRate,
  SUM(Revenue) AS TotalRevenue
FROM sales_data
GROUP BY FORMAT(Date, 'yyyy-MM'), Region, Product, Channel, SalesRep;
