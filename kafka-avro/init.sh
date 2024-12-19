#!/bin/bash
#######################################
# Kafka init: create topics
#######################################

topics=("adaptive-dryers.inbound"
  "adaptive-dryers.process-configs"
  "adaptive-dryers.cooler-time"
  "adaptive-dryers.features"
  "adaptive-dryers.nir-data"
  "adaptive-dryers.events"
  "adaptive-dryers.forecasts-and-recommends"
  "adaptive-dryers.nir-data-fact-predict-features"
  "adaptive-dryers.responses"
  )
bootstrap_server="mars-kafka:9092"
set -x
for topic in "${topics[@]}"
do
  kafka-topics.sh --bootstrap-server $bootstrap_server --create --topic "$topic" --if-not-exists
done