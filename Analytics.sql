Use creditrisk;

-- which onboarding method commit most fraud like transactions 
SELECT c.onboard_method,
       COUNT(*) AS total_txns,
       SUM(t.is_fraud) AS fraud_txns,
       ROUND(SUM(t.is_fraud)/COUNT(*)*100,2) AS fraud_rate_pct
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.onboard_method
ORDER BY fraud_rate_pct DESC;

SELECT c.customer_id,
       c.business_name,
       SUM(t.amount) AS total_spend
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE t.is_fraud = 0
GROUP BY c.customer_id, c.business_name
ORDER BY total_spend DESC
LIMIT 10;

SELECT d.device_os,
       d.device_type,
       COUNT(t.transaction_id) AS total_txns,
       SUM(t.is_fraud) AS fraud_txns,
       ROUND(SUM(t.is_fraud)/COUNT(*)*100,2) AS fraud_rate_pct
FROM transactions t
JOIN devices d ON t.device_id = d.device_id
GROUP BY d.device_os, d.device_type
ORDER BY fraud_rate_pct DESC;

SELECT YEARWEEK(timestamp) AS year_week,
       COUNT(*) AS total_txns,
       SUM(is_fraud) AS fraud_txns,
       ROUND(SUM(is_fraud)/COUNT(*)*100,2) AS fraud_rate_pct
FROM transactions
GROUP BY YEARWEEK(timestamp)
ORDER BY year_week;