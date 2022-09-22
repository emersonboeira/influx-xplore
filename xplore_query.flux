buck = "hppav14-monitoring"

from(bucket: buck)
    |> range(start: -1m)
    |> filter(fn: (r) => r._measurement == "mem")
    |> filter(fn: (r) => r._field == "used")
    |> yield()