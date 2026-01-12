import pandas as pd

# Load anomaly data
df = pd.read_csv("data/processed/anomalies.csv")

# Total number of suspicious transactions
total_anomalies = len(df)

# Total dollar amount at risk
total_risk = df["amount"].sum()

# Average suspicious transaction
average_risk = df["amount"].mean()

print("------ Financial Impact Summary ------")
print(f"Total Suspicious Transactions: {total_anomalies}")
print(f"Total Estimated Financial Risk: ${total_risk:,.2f}")
print(f"Average Suspicious Transaction: ${average_risk:,.2f}")