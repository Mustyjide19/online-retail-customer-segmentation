
-- Total revenue, orders and customers
SELECT
    ROUND(SUM(Revenue), 2) AS total_revenue,
    COUNT(DISTINCT Invoice) AS total_orders,
    COUNT(DISTINCT "Customer ID") AS total_customers
FROM retail_transactions;

-- Monthly revenue
SELECT
    substr(InvoiceDate, 1, 7) AS month,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_transactions
GROUP BY month
ORDER BY month;

-- Top 10 countries by revenue
SELECT
    Country,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_transactions
GROUP BY Country
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 10 products by revenue
SELECT
    Description,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_transactions
GROUP BY Description
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 10 customers by revenue
SELECT
    "Customer ID",
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_transactions
GROUP BY "Customer ID"
ORDER BY total_revenue DESC
LIMIT 10;

-- Customer segment summary
SELECT
    Segment,
    COUNT("Customer ID") AS customer_count,
    ROUND(AVG(Recency), 2) AS avg_recency,
    ROUND(AVG(Frequency), 2) AS avg_frequency,
    ROUND(AVG(Monetary), 2) AS avg_monetary
FROM customer_segments
GROUP BY Segment
ORDER BY customer_count DESC;

-- Revenue by customer segment
SELECT
    Segment,
    ROUND(SUM(Monetary), 2) AS segment_revenue
FROM customer_segments
GROUP BY Segment
ORDER BY segment_revenue DESC;

-- Product ABC summary
SELECT
    ABC_Category,
    COUNT(Description) AS product_count,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM product_abc
GROUP BY ABC_Category
ORDER BY total_revenue DESC;
