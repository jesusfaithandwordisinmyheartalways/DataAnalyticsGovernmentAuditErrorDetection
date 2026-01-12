import pandas as pd
from sklearn.ensemble import IsolationForest


df = pd.read_csv("data/processed/cleaned_transactions.csv")

model = IsolationForest(contamination=0.01)
df["anomaly"] = model.fit_predict(df[["amount"]])

anomalies = df[df["anomaly"] == -1]

anomalies.to_csv("data/processed/anomalies.csv", index=False)
print("Anomalies detected.")