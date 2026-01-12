-- Create database table for government transactions

CREATE TABLE IF NOT EXISTS transactions (
    transaction_id INTEGER PRIMARY KEY,
    agency VARCHAR(100),
    transaction_type VARCHAR(50),
    vendor_or_employee VARCHAR(255),
    amount DECIMAL(12,2),
    transaction_date DATE,
    status VARCHAR(50)
);