import pandas as pd
import random
from faker import Faker


fake = Faker()
rows = 500000  # simulate large dataset

data = []


for i in range(rows):
    record = {
        "transaction_id": i + 1,
        "agency": random.choice(["Health", "Education", "Transportation", "Defense"]),
        "transaction_type": random.choice(["Procurement", "Payroll", "Benefits", "Inspection"]),
        "vendor_or_employee": fake.company(),
        "amount": round(random.uniform(100, 500000), 2),
        "transaction_date": fake.date_between(start_date='-2y', end_date='today'),
        "status": random.choice(["Approved", "Pending", "Rejected"])
    }
    data.append(record)

df = pd.DataFrame(data)
df.to_csv("data/raw/government_transactions.csv", index=False)

print("CSV file created")