DROP TABLE IF EXISTS combined_government_audit_data;

CREATE TABLE combined_government_audit_data AS 
SELECT 
    g.transaction_id, 
    g.agency, 
    g.transaction_type, 
    g.vendor_or_employee, 
    g.amount, 
    g.transaction_date, 
    g.status,

    -- Status classification
    CASE
        WHEN g.status = 'Pending' THEN 'gov_audit_is_pending'
        WHEN g.status = 'Rejected' THEN 'gov_audit_is_rejected'
        ELSE 'gov_audit_is_approved'
    END AS gov_audit_status,

 
    --  Row number (unique order)
    ROW_NUMBER() OVER (ORDER BY g.transaction_date) AS row_num,

    --  Rank by amount (highest first)
    RANK() OVER (ORDER BY g.amount DESC) AS spending_rank,

    --  Running total of ALL spending
    SUM(g.amount) OVER (ORDER BY g.transaction_date) AS running_total_spend,

    --  Overall average transaction amount
    AVG(g.amount) OVER () AS overall_avg_amount,

    -- Difference from overall average
    g.amount - AVG(g.amount) OVER () AS difference_from_avg,

    -- 6. Percent of total spending
    g.amount * 100.0 / SUM(g.amount) OVER () AS percent_of_total_spend,



    COALESCE(a.anomalies_data_agency, 'No Match') AS anomalies_data_agency,
    COALESCE(a.anomalies_data_transaction_type, 'No Match') AS anomalies_data_transaction_type,
    COALESCE(a.anomalies_data_vendor_or_employee, 'No Match') AS anomalies_data_vendor_or_employee,
    COALESCE(a.anomalies_data_amount, 0) AS anomalies_data_amount,
    COALESCE(a.anomalies_data_transaction_date, g.transaction_date) AS anomalies_data_transaction_date,
    COALESCE(a.anomalies_data_status, 'No Match') AS anomalies_data_status,
    COALESCE(a.anomalies_data_error_flag, FALSE) AS anomalies_data_error_flag,
    COALESCE(a.anomalies_data_anomaly, 0) AS anomalies_data_anomaly

FROM government_audit g
LEFT JOIN gov_anomalies_data a
ON g.transaction_id = a.transaction_id;

SELECT * FROM combined_government_audit_data;