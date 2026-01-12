-- Duplicate transactions


SELECT transaction_id , COUNT(*) 
FROM transactions 
GROUP BY transaction_id
HAVING COUNT (*) > 1;



-- Invalid payments
SELECT * 
FROM transactions
WHERE amount <= 0;