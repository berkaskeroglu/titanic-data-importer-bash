#!/bin/bash

processed_records=0
inserted_records=0

CSV_FILE="/home/ubuntux/titanic.csv"
HASURA_API_URL="http://?????/v1/graphql"

DB_HOST="??"
DB_PORT="??"
DB_USER="??"
DB_PASSWORD="??"
DB_NAME="??"

while IFS=',' read -r passengerid survived pclass name1 name2 sex age sibsp parch ticket fare cabin embarked; do

    survived=${survived:-null}
    pclass=${pclass:-null}
    name=$(echo $name1 $name2 | tr -d '"' | sed "s/'/''/g")
    sex=${sex:-null}
    age=${age:-null}
    sibsp=${sibsp:-null}
    parch=${parch:-null}
    ticket=${ticket:-null}
    fare=${fare:-null}
    cabin=${cabin:-null}
    embarked=${embarked:-null}

    result=$(curl -s -X POST -H "Content-Type: application/json" -d "{\"query\":\"query { titanic(where: { passengerid: { _eq: $passengerid } }) { passengerid } }\"}" $HASURA_API_URL)

    if [[ $result == *"$passengerid"* ]]; then
        echo "Record with passengerid $passengerid already exists. Skipping."
    else
        export PGPASSWORD=$DB_PASSWORD
        psql_output=$(psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -t -c "SELECT * FROM titanic WHERE passengerid = $passengerid")
        unset PGPASSWORD

        if [ -z "$psql_output" ]; then
            echo "Error querying the database for passengerid $passengerid."
        else
            if [ "$psql_output" == "$passengerid|$survived|$pclass|$name|$sex|$age|$sibsp|$parch|$ticket|$fare|$cabin|$embarked" ]; then
                echo "Record with passengerid $passengerid matches the local record."
            else
                echo "Error: Inserted record with passengerid $passengerid does not match the local record."
            fi
        fi

        echo "Record with passengerid $passengerid inserted."
        ((inserted_records++))
    fi

    ((processed_records++))
    echo "$processed_records"

done < <(tail -n +2 "$CSV_FILE")

echo "$processed_records records processed, $inserted_records records inserted."
