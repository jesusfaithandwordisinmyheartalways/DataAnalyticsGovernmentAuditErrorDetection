import pandas as pd

# 1️⃣ Convert government_transactions.csv
df = pd.read_csv("data/raw/government_transactions.csv")
df.to_excel("data/raw/government_transactions.xlsx", index=False)

# 2️⃣ Convert cleaned_transactions.csv
df = pd.read_csv("data/processed/cleaned_transactions.csv")
df.to_excel("data/processed/cleaned_transactions.xlsx", index=False)

# 3️⃣ Convert anomalies.csv
df = pd.read_csv("data/processed/anomalies.csv")
df.to_excel("data/processed/anomalies.xlsx", index=False)

print("All CSV files converted to Excel successfully!")