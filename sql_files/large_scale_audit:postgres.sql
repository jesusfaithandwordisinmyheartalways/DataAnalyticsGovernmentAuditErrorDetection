
DROP TABLE IF EXISTS government_audit;
DROP TABLE IF EXISTS gov_anomalies_data;



CREATE TABLE government_audit(
	id SERIAL PRIMARY KEY,
	transaction_id INT,
	agency VARCHAR(50),
	transaction_type VARCHAR(50),
	vendor_or_employee VARCHAR(50),
	amount DECIMAL(10,2),
	transaction_date DATE,
	status VARCHAR(50)
);

INSERT INTO government_audit
(transaction_id, agency, transaction_type, vendor_or_employee, amount, transaction_date, status)
VALUES
(1, 'Health', 'Payroll', 'Andrews PLC', 442869.78, '2025-10-11', 'Pending'),
(2, 'Transportation', 'Benefits', 'Robinson-Bowers', 395509.48, '2025-04-06', 'Approved'),
(3, 'Transportation', 'Inspection', 'Kelly-Williams', 88776.16, '2025-08-03', 'Pending'),
(4, 'Defense', 'Inspection', 'Hill-Krause', 70917.10, '2024-05-23', 'Approved'),
(5, 'Transportation', 'Inspection', 'Vance, Frazier and Giles', 223751.91, '2025-02-22', 'Pending'),
(6, 'Defense', 'Inspection', 'Spencer-Cooper', 416038.87, '2025-02-03', 'Pending'),
(7, 'Education', 'Benefits', 'Bryant-Anderson', 362649.15, '2024-05-29', 'Approved'),
(8, 'Defense', 'Inspection', 'Castaneda-Brown', 109972.88, '2026-01-28', 'Pending'),
(9, 'Health', 'Payroll', 'Smith, Allen and Young', 224928.62, '2025-10-14', 'Approved'),
(10, 'Defense', 'Payroll', 'Hudson, Greene and Freeman', 447789.24, '2025-02-14', 'Pending'),
(11, 'Education', 'Benefits', 'Thompson, Porter and Mcintosh', 406287.29, '2024-09-18', 'Approved'),
(12, 'Transportation', 'Benefits', 'Hughes, Marsh and Coffey', 485596.15, '2026-01-20', 'Rejected'),
(13, 'Health', 'Procurement', 'Soto-Lee', 40334.39, '2025-10-05', 'Approved'),
(14, 'Education', 'Inspection', 'Pratt, Lopez and Ryan', 18710.34, '2024-10-13', 'Approved'),
(15, 'Defense', 'Inspection', 'Henry, Brown and Ramirez', 81671.51, '2025-03-04', 'Rejected'),
(16, 'Health', 'Inspection', 'Moore LLC', 219053.16, '2024-08-07', 'Rejected'),
(17, 'Health', 'Payroll', 'Woods, Freeman and Harper', 293495.83, '2024-10-20', 'Approved'),
(18, 'Health', 'Inspection', 'Cross Group', 219684.01, '2025-08-18', 'Pending'),
(19, 'Education', 'Benefits', 'Clarke-Salinas', 360272.55, '2025-09-06', 'Rejected'),
(20, 'Transportation', 'Procurement', 'Harris-Riddle', 93080.64, '2024-04-06', 'Pending'),
(21, 'Health', 'Benefits', 'Torres, Hopkins and Jensen', 134422.11, '2024-07-28', 'Rejected'),
(22, 'Transportation', 'Procurement', 'Coffey Inc', 478808.30, '2025-04-21', 'Rejected'),
(23, 'Education', 'Inspection', 'Rhodes Ltd', 18447.97, '2025-11-08', 'Approved');




CREATE TABLE gov_anomalies_data (
	id SERIAL PRIMARY KEY,
    transaction_id INT,
    anomalies_data_agency VARCHAR(50),
    anomalies_data_transaction_type VARCHAR(50),
    anomalies_data_vendor_or_employee VARCHAR(100),
    anomalies_data_amount NUMERIC(10,2),
    anomalies_data_transaction_date DATE,
    anomalies_data_status VARCHAR(50),
    anomalies_data_error_flag BOOLEAN,
    anomalies_data_anomaly INT
);


INSERT INTO gov_anomalies_data
(transaction_id,anomalies_data_agency, anomalies_data_transaction_type,anomalies_data_vendor_or_employee,anomalies_data_amount,
anomalies_data_transaction_date, anomalies_data_status, anomalies_data_error_flag, anomalies_data_anomaly) 
VALUES
(300, 'Health', 'Inspection', 'Ruiz and Sons', 1660.53, '2025-04-30', 'Approved', FALSE, -1),
(424, 'Defense', 'Procurement', 'King LLC', 981.00, '2025-07-29', 'Rejected', FALSE, -1),
(499, 'Defense', 'Inspection', 'Roberts-Wells', 1435.50, '2025-10-09', 'Approved', FALSE, -1),
(541, 'Defense', 'Inspection', 'Garcia PLC', 1605.64, '2024-09-15', 'Rejected', FALSE, -1),
(588, 'Defense', 'Benefits', 'Palmer Ltd', 273.36, '2024-09-07', 'Pending', FALSE, -1),
(829, 'Education', 'Inspection', 'Rhodes-Perry', 137.43, '2024-11-28', 'Approved', FALSE, -1),
(1090, 'Defense', 'Benefits', 'Griffin Ltd', 498754.04, '2024-10-15', 'Approved', FALSE, -1),
(1181, 'Defense', 'Payroll', 'Spencer, Sullivan and Dunn', 499474.32, '2024-12-09', 'Pending', FALSE, -1),
(1236, 'Transportation', 'Benefits', 'Perez-Rodriguez', 2135.96, '2025-09-10', 'Pending', FALSE, -1),
(1239, 'Defense', 'Inspection', 'Phelps LLC', 1062.09, '2024-11-09', 'Pending', FALSE, -1),
(1321, 'Transportation', 'Payroll', 'Love-Cox', 499180.61, '2024-03-04', 'Approved', FALSE, -1),
(1445, 'Defense', 'Benefits', 'Jensen Group', 2489.51, '2025-12-08', 'Rejected', FALSE, -1),
(1480, 'Health', 'Procurement', 'Fleming-Hoover', 2634.00, '2025-02-24', 'Pending', FALSE, -1),
(1512, 'Defense', 'Benefits', 'Obrien-Brandt', 1798.80, '2025-09-04', 'Approved', FALSE, -1);

