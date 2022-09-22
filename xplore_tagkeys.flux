import "influxdata/influxdb/schema"

buck = "hppav14-monitoring"
msr = "mem"

schema.measurementTagKeys(
    bucket: buck,
    measurement: msr,
)