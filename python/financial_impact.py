import pandas as pd

df = pd.read_csv("data/processed/anomalies.csv")

total_anomalies = len(df)
total_risk = df["amount"].sum()
average_risk = df["amount"].mean()

print("------ Financial Impact Summary ------")
print(f"Total Suspicious Transactions: {total_anomalies}")
print(f"Total Estimated Financial Risk: ${total_risk:,.2f}")
print(f"Average Suspicious Transaction: ${average_risk:,.2f}")