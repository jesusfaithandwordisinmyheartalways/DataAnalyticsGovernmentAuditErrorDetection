import pandas as pd

df = pd.read_csv("data/raw/government_transactions.csv")
df.to_excel("data/raw/government_transactions.xlsx", index=False)

df = pd.read_csv("data/processed/cleaned_transactions.csv")
df.to_excel("data/processed/cleaned_transactions.xlsx", index=False)

df = pd.read_csv("data/processed/anomalies.csv")
df.to_excel("data/processed/anomalies.xlsx", index=False)

print("All CSV files converted to Excel successfully!")