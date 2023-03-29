import json
import mysql.connector

import datetime

# Connect to the MySQL database
mydb = mysql.connector.connect(
    host='127.0.0.1',
    user='',
    password='@',
    database='prifina'
)
start_dt=(datetime.datetime.now()).strftime("%Y-%m-%d %H:%M:%S")


# Create a cursor object
mycursor = mydb.cursor()


# Commit the transaction
mycursor.execute("select we.running ,we.walking ,we.jacking ,we.swiming ,we.cycling ,we.yoga ,we.workout from daily_exsice_t we inner join daily_body_status_t wb on we.txn_id=wb.txn_id where date(we.str_dtm)=date('2023-03-14')")
#mycursor.execute("select * from daily_exsice_t where date(str_dtm)=date('2023-03-14')")

# Serialize to JSON
#json_data = json.dumps(dt_strings)

# Convert data to JSON format

# Get the column names
columns = [column[0] for column in mycursor.description]

# Fetch all rows
rows = mycursor.fetchall()

# Convert the rows to a list of dictionaries
result = []
for row in rows:
    row_dict = {}
    for i in range(len(columns)):
        row_dict[columns[i]] = row[i]
    result.append(row_dict)

dt_strings = [dt.strftime("%Y-%m-%d %H:%M:%S") if isinstance(dt, datetime.datetime) else str(dt) for dt in result]

json_data = json.dumps(dt_strings)

print(json_data)
