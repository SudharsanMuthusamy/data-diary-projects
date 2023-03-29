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
# Call the stored procedure and pass input parameters
params_excersie=(None,2,None,None,None,None,None,50,165,200,15,20,11,80,22,78,60)
params_sleep = (start_dt,None,50,100,500,22,2,20,12,40,5,59)
params_nutrients=('Bread',2,8,5,2,70,58,50,20,900,10,22,45,10,33,30,20)

mycursor.callproc('proc_daily_exsice_insert', params_excersie)
mycursor.callproc('proc_daily_sleep_insert', params_sleep)
mycursor.callproc('proc_daily_nutrins_insert', params_nutrients)

# Commit the transaction
mydb.commit()
#result = mycursor.fetchall()
print("successfull")

#dt_strings = [dt.strftime("%Y-%m-%d %H:%M:%S") if isinstance(dt, datetime.datetime) else str(dt) for dt in result]

# Serialize to JSON
#json_data = json.dumps(dt_strings)

# Convert data to JSON format
#json_data = json.dumps(result)

#print(json_data)

