# TPC-H in dockerized clickhouse

Kafka, Kafka UI, Avro schema registry in dockers without security, only for development


* Start: `docker-compose up`
 
* Kafka bootstrap servers: localhost:9092
* Kafka ui: `http://localhost:8080`
* Avro schema registry: `http://localhost:8082/`, `http://localhost:8082/schemas`, `http://localhost:8082/subjects`

* Stop and remove: `docker-compose down`