# TPC-H in dockerized postgres

Postgres database initialised with the [TPC-H](http://www.tpc.org/tpch/) dataset
at a specified scale factor.

* Start: `docker-compose up`
* Look at database: `http://localhost:80, user admin@pgadmin.com, password: 1
* Stop and remove: `docker-compose down`

You can modify the environment parameter `SCALE_FACTOR` to generate a bigger or
smaller TPC-H dataset.
