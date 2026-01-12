import pandas as pd


df = pd.read_csv("data/raw/government_transactions.csv")


# Remove duplicates
df = df.drop_duplicates()

# Handle missing values
df["amount"] = df["amount"].fillna(0)

# Flag invalid transactions
df["error_flag"] = df["amount"] <= 0


df.to_csv("data/processed/cleaned_transactions.csv", index=False)

print("Data cleaned and saved.")