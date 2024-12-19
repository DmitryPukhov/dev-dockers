# TPC-H in dockerized clickhouse

Clickhouse database initialised with the [TPC-H](http://www.tpc.org/tpch/) dataset
at a specified scale factor.

* Start: `docker-compose up`
* Look at database: `http://localhost:8123/play`
* Stop and remove: `docker-compose down`

You can modify the environment parameter `SCALE_FACTOR` to generate a bigger or
smaller TPC-H dataset.
