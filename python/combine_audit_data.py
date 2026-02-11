import pandas as pd
import numpy as np

# Load cleaned and anomalies data
cleaned_df = pd.read_csv("data/processed/cleaned_transactions.csv")
anomalies_df = pd.read_csv("data/processed/anomalies.csv")

# Add anomaly flag
cleaned_df["is_anomaly"] = 0
anomalies_df["is_anomaly"] = 1

# Combine datasets
combined_df = pd.concat([cleaned_df, anomalies_df], ignore_index=True)

# Add approved budget & budget vs actual mismatch
np.random.seed(42)
combined_df["approved_budget"] = combined_df["amount"] * np.random.uniform(0.85, 1.15, size=len(combined_df))
combined_df["budget_vs_actual_mismatch"] = combined_df["amount"] - combined_df["approved_budget"]
combined_df["budget_mismatch_flag"] = abs(combined_df["budget_vs_actual_mismatch"]) > (0.20 * combined_df["approved_budget"])

# Add transaction_year column for Tableau
combined_df["transaction_date"] = pd.to_datetime(combined_df["transaction_date"], errors="coerce")
combined_df["transaction_year"] = combined_df["transaction_date"].dt.year

# Filter to years 2021–2025
combined_df = combined_df[(combined_df["transaction_year"] >= 2021) & (combined_df["transaction_year"] <= 2025)]

# Add project-specific KPI columns (override totals with your numbers)
combined_df["total_suspicious_transactions_kpi"] = 4976
combined_df["total_estimated_financial_risk_kpi"] = 1031550789.66
combined_df["average_suspicious_transaction_kpi"] = 207305.22

# Reduce rows for project purposes
combined_df = combined_df.sample(n=110, random_state=42)

# Save CSV & Excel
combined_df.to_csv("data/processed/combined_government_audit_data.csv", index=False)
combined_df.to_excel("data/processed/combined_government_audit_data.xlsx", index=False)

print("Combined government audit dataset created with KPIs and transaction_year filter (2021–2025).")