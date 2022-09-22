import influxdb_client
import datetime as datetime
import csv
import matplotlib.pyplot as plt

buck = "hppav14-monitoring"
my_token = "3G5NnG79LhnUkqwhyZrf_5xCsNOulWfnx9Ctcct_REa4nu75kXdmnA3pywF0k1kYAuq6jVa-ou36KZBwgjSEZA=="
my_org = "robotics-club"
db_url = "http://localhost:8086/" 

client = influxdb_client.InfluxDBClient(
    url = db_url,
    token = my_token,
    org = my_org
)

query_api = client.query_api()

query = '''
from(bucket: "hppav14-monitoring")
    |> range(start: -3h)
    |> filter(fn: (r) => r._measurement == "cpu")
    |> filter(fn: (r) => r._field == "usage_system")
    |> filter(fn: (r) => r.cpu == "cpu1")
'''

result = client.query_api().query(org=my_org, query=query)
csv_result = query_api.query_csv(org=my_org, query=query)

#write to csv
csv_file = open(r'data.csv', "w",newline='')
writer = csv.writer(csv_file)
for row in csv_result:
     writer.writerow(row)
csv_file.close()

#for table in result:
#    for row in table.records:
#        print (row.values)

data_value = []
data_time = []
for table in result:
    for record in table.records:
        data_value.append((record.get_value()))
        data_time.append((record.get_time()))

print(data_value)
print(data_time[0])
print(data_time[1])
print(data_time[2])

lw=1.5 # linewidth
plt.figure()
plt.plot(data_time, data_value, "b", linewidth=lw)
plt.grid(True)
#plt.xlabel("time (samples)")
plt.ylabel("cpu1_usage")
plt.show()