SELECT transaction_id, COUNT(*)
FROM transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;

SELECT *
FROM transactions
WHERE amount <= 0;