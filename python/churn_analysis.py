import pandas as pd
import sqlite3
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
RAW_FILE = BASE_DIR / "data" / "customer_churn.csv"
CLEAN_FILE = BASE_DIR / "data" / "cleaned_churn.csv"
DB_FILE = BASE_DIR / "data" / "customer_churn.db"

df = pd.read_csv(RAW_FILE)

df.columns = (
    df.columns
    .str.strip()
    .str.lower()
    .str.replace(" ", "_")
)

df["churn_flag"] = df["churn"].map({"Yes": 1, "No": 0})

df.to_csv(CLEAN_FILE, index=False)

conn = sqlite3.connect(DB_FILE)
df.to_sql("customer_churn", conn, if_exists="replace", index=False)
conn.close()

print("✅ Data cleaned and saved!")