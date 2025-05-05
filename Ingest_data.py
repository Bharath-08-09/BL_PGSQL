import pandas as pd
from sqlalchemy import create_engine

# Load dataset
df = pd.read_csv("D:/BL_Pg_Covid/all_weekly_excess_deaths.csv")

# Preview columns
print(df.columns)

# Clean columns (rename if needed)
df.columns = [col.lower().replace(" ", "_") for col in df.columns]

# PostgreSQL connection string
engine = create_engine("postgresql://postgres:Bharath08@localhost:5432/Covid_19db")

# Write to PostgreSQL
df.to_sql("weekly_excess_deaths", engine, if_exists="replace", index=False)
print("✅ Data successfully loaded into PostgreSQL.")