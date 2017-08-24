<?php

$dataFolder = './data';
$year_month_regex = "/tripdata_([0-9]{4})-([0-9]{2})/i";

$green_schema_pre_2015 = "(vendor_id,lpep_pickup_datetime,lpep_dropoff_datetime,store_and_fwd_flag,rate_code_id,pickup_longitude,pickup_latitude,dropoff_longitude,dropoff_latitude,passenger_count,trip_distance,fare_amount,extra,mta_tax,tip_amount,tolls_amount,ehail_fee,total_amount,payment_type,trip_type,junk1,junk2)";
$green_schema_2015_h1 = "(vendor_id,lpep_pickup_datetime,lpep_dropoff_datetime,store_and_fwd_flag,rate_code_id,pickup_longitude,pickup_latitude,dropoff_longitude,dropoff_latitude,passenger_count,trip_distance,fare_amount,extra,mta_tax,tip_amount,tolls_amount,ehail_fee,improvement_surcharge,total_amount,payment_type,trip_type,junk1,junk2)";
$green_schema_2015_h2_2016_h1 = "(vendor_id,lpep_pickup_datetime,lpep_dropoff_datetime,store_and_fwd_flag,rate_code_id,pickup_longitude,pickup_latitude,dropoff_longitude,dropoff_latitude,passenger_count,trip_distance,fare_amount,extra,mta_tax,tip_amount,tolls_amount,ehail_fee,improvement_surcharge,total_amount,payment_type,trip_type)";
$green_schema_2016_h2 = "(vendor_id,lpep_pickup_datetime,lpep_dropoff_datetime,store_and_fwd_flag,rate_code_id,pickup_location_id,dropoff_location_id,passenger_count,trip_distance,fare_amount,extra,mta_tax,tip_amount,tolls_amount,ehail_fee,improvement_surcharge,total_amount,payment_type,trip_type,junk1,junk2)";

$yellow_schema_pre_2015 = "(vendor_id,tpep_pickup_datetime,tpep_dropoff_datetime,passenger_count,trip_distance,pickup_longitude,pickup_latitude,rate_code_id,store_and_fwd_flag,dropoff_longitude,dropoff_latitude,payment_type,fare_amount,extra,mta_tax,tip_amount,tolls_amount,total_amount)";
$yellow_schema_2015_2016_h1 = "(vendor_id,tpep_pickup_datetime,tpep_dropoff_datetime,passenger_count,trip_distance,pickup_longitude,pickup_latitude,rate_code_id,store_and_fwd_flag,dropoff_longitude,dropoff_latitude,payment_type,fare_amount,extra,mta_tax,tip_amount,tolls_amount,improvement_surcharge,total_amount)";
$yellow_schema_2016_h2 = "(vendor_id,tpep_pickup_datetime,tpep_dropoff_datetime,passenger_count,trip_distance,rate_code_id,store_and_fwd_flag,pickup_location_id,dropoff_location_id,payment_type,fare_amount,extra,mta_tax,tip_amount,tolls_amount,improvement_surcharge,total_amount,junk1,junk2)";


$sourceList = dir($dataFolder);
while (($file = $sourceList->read()) !== false) {
    if (preg_match($year_month_regex, $file, $m)) {
        $year  = $m[1];
        $month = $m[2];
    }
    $schema = '';


    if (stripos($file, 'yellow') !== false) {
        if ($year < 2015) {
            $schema = $yellow_schema_pre_2015;
        } elseif ($year == 2015 || $year == 2016 && $month < 7) {
            $schema = $yellow_schema_2015_2016_h1;
        } else {
            $schema = $yellow_schema_2016_h2;
        }

        echo date('Y-m-d H:i:s'), ": beginning load for $file\n";
        exec("tail -n +4 $dataFolder/$file | clickhouse-client --query=\"INSERT INTO yellow_tripdata_staging $schema FORMAT CSV\"");
        echo date('Y-m-d H:i:s'), ": finish load for $file\n";
    }

}