CREATE TABLE test.taxi_zones (
  location_id UInt32,  
  zone String,  
  create_date Date DEFAULT toDate(0)
) ENGINE = MergeTree(create_date, location_id, 8192);

CREATE TABLE test.central_park_weather_observations (
  station_id String,  
  station_name String,  
  weather_date Date,  
  precipitation Float32,  
  snow_depth Float32,  
  snowfall Int32,  
  max_temperature Float32,  
  min_temperature Float32,  
  average_wind_speed Float32)
 ENGINE = MergeTree(weather_date, station_id, 8192);

CREATE TABLE test.yellow_tripdata_staging (
  pickup_date Date DEFAULT toDate(tpep_pickup_datetime),  
  id UInt64,  
  vendor_id String,  
  tpep_pickup_datetime DateTime,  
  tpep_dropoff_datetime DateTime,  
  passenger_count Int32,  
  trip_distance Float32,  
  pickup_longitude Float32,  
  pickup_latitude Float32,  
  rate_code_id String,  
  store_and_fwd_flag String,  
  dropoff_longitude Float32,  
  dropoff_latitude Float32,  
  payment_type String,  
  fare_amount String,  
  extra String,  
  mta_tax String,  
  tip_amount String,  
  tolls_amount String,  
  improvement_surcharge String,  
  total_amount Float32,  
  pickup_location_id UInt32,  
  dropoff_location_id UInt32,  
  junk1 String,  
  junk2 String
) ENGINE = MergeTree(pickup_date, (id, pickup_location_id, dropoff_location_id, vendor_id), 8192);

