import "influxdata/influxdb/schema"

buck = "hppav14-monitoring"
msr = "system"

schema.measurementFieldKeys(
    bucket: buck,
    measurement: msr,
)