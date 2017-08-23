New York City Taxi Dataset

The official TLC trip record dataset contains data for over 1.1 billion taxi trips from January 2009 through June 2015, covering both yellow and green taxis. Each individual trip record contains precise location coordinates for where the trip started and ended, timestamps for when the trip started and ended, plus a few other variables including fare amount, payment method, and distance traveled.

This repo provides scripts to download that data and prepare the schema for ClickHouse.

The Schema
  * yellow_tripdata_staging table contains all yellow taxi trips. Each trip maps census tracts to NYC's official neighborhood tabulation areas by pickup/dropoff location ids.
  * tripdata table is a distributed table along the cluster with the same data as yellow_tripdata_staging
  * taxi_zones table contains the TLC's official taxi zone boundaries. Starting in July 2016, the TLC no longer provides pickup and dropoff coordinates. Instead, each trip comes with taxi zone pickup and dropoff location IDs
  * central_park_weather_observations dictionary has summary weather data by date
  * taxi_zones dictionary has official neighborhood tabulation areas data


