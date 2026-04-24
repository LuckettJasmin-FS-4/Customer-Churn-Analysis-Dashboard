-- Total customers
SELECT COUNT(*) AS total_customers
FROM cleaned_churn;

-- Churn count
SELECT churn, COUNT(*) AS total
FROM cleaned_churn
GROUP BY churn;

-- Churn by contract type
SELECT contract_type, churn, COUNT(*) AS total
FROM cleaned_churn
GROUP BY contract_type, churn
ORDER BY contract_type;

-- Churn by payment method
SELECT payment_method, churn, COUNT(*) AS total
FROM cleaned_churn
GROUP BY payment_method, churn
ORDER BY payment_method;

-- Average monthly charges by churn
SELECT churn, AVG(monthly_charges) AS avg_monthly_charges
FROM cleaned_churn
GROUP BY churn;

-- High risk customers (example)
SELECT *
FROM cleaned_churn
WHERE churn = 'Yes'
AND contract_type = 'Month-to-Month';