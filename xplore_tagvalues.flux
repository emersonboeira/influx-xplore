import "influxdata/influxdb/schema"

buck = "hppav14-monitoring"
tg = "host"

schema.tagValues(
    bucket: buck,
    tag: tg,
)