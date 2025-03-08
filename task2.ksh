#!/bin/bash

# Oracle Database Credentials
DB_USER="hr"
DB_PASSWORD="hr"
DB_SID="xe"

# Table Name
TABLE_NAME="EMP_DATA"

# Execute SQL Query to Get Count
COUNT=$(sqlplus -s "$DB_USER/$DB_PASSWORD@$DB_SID" <<EOF
SET HEAD OFF;
SET FEEDBACK OFF;
SELECT COUNT(*) FROM $TABLE_NAME;
EXIT;
EOF
)

# Print Count
echo "Record Count in Table $EMP_DATA: $COUNT"
