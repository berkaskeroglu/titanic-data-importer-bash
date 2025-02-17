# Titanic Data Importer for Hasura & PostgreSQL

## Overview
This Bash script reads Titanic dataset records from a CSV file and inserts them into a **Hasura GraphQL API** and a **PostgreSQL database**. Before inserting, it checks if the record already exists in **Hasura** and **PostgreSQL** to prevent duplicates.

## Features
- Reads data from a **CSV file**
- Checks for existing records in **Hasura GraphQL API** before inserting
- Verifies records in **PostgreSQL** before adding new entries
- Inserts missing records into the database
- Handles missing values by converting them to `null`
- Uses **Bash scripting**, **cURL**, and **psql** for efficient data handling

## Prerequisites
Before running the script, ensure you have:
- A running **PostgreSQL database**
- A deployed **Hasura GraphQL API**
- The required environment variables set (`HASURA_API_URL`, `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASSWORD`, `DB_NAME`)
- `psql` and `curl` installed

## Usage
1. Clone the repository:
   ```
   git clone https://github.com/berkaskeroglu/titanic-importer-bash.git
   cd titanic-importer
2. Update the script with your database credentials and Hasura API URL.
3. 
4. Run the script.
   ```
   chmod +x import.sh
   ./import.sh
## Configuration
  ```
  CSV_FILE="/path/to/titanic.csv"
  HASURA_API_URL="http://your-hasura-instance/v1/graphql"
  
  DB_HOST="your-db-host"
  DB_PORT="your-db-port"
  DB_USER="your-db-user"
  DB_PASSWORD="your-db-password"
  DB_NAME="your-db-name"
