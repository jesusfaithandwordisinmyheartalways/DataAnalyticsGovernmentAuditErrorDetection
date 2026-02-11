

import pandas as pd

df = pd.read_csv("data/raw/government_transactions.csv")

df = df.drop_duplicates()
df["amount"] = df["amount"].fillna(0)
df["error_flag"] = df["amount"] <= 0

df.to_csv("data/processed/cleaned_transactions.csv", index=False)

print("Data cleaned and saved.")