

-- Unusually high payments
SELECT * 
FROM transactions
WHERE amount > 200000
ORDER BY amount DESC;


