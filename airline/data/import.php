<?php

$start = time();
$sourceDir = __DIR__ . '/';

$dir = dir($sourceDir);
while ($entry = $dir->read()) {
    if (stripos($entry, '.zip') !== false) {
        exec('unzip -o ' . $sourceDir . $entry);
        exec('unlink ' . $sourceDir . $entry);
        $entry = str_replace('.zip', '.csv', $entry);
    }

    if (stripos($entry, '.csv') === false) {
        continue;
    }
    
    echo "processing '$entry'...\n";
    
    $entry = $sourceDir . $entry;
    exec("tail -n +2 $entry | clickhouse-client --query=\"INSERT INTO ontime (  Year,  Quarter,  Month,  DayofMonth,  DayOfWeek,  FlightDate,  UniqueCarrier,  AirlineID,  Carrier,  TailNum,  FlightNum,  OriginAirportID,  OriginAirportSeqID,  OriginCityMarketID,  Origin,  OriginCityName,  OriginState,  OriginStateFips,  OriginStateName,  OriginWac,  DestAirportID,  DestAirportSeqID,  DestCityMarketID,  Dest,  DestCityName,  DestState,  DestStateFips,  DestStateName,  DestWac,  CRSDepTime,  DepTime,  DepDelay,  DepDelayMinutes,  DepDel15,  DepartureDelayGroups,  DepTimeBlk,  TaxiOut,  WheelsOff,  WheelsOn,  TaxiIn,  CRSArrTime,  ArrTime,  ArrDelay,  ArrDelayMinutes,  ArrDel15,  ArrivalDelayGroups,  ArrTimeBlk,  Cancelled,  CancellationCode,  Diverted,  CRSElapsedTime,  ActualElapsedTime,  AirTime,  Flights,  Distance,  DistanceGroup,  CarrierDelay,  WeatherDelay,  NASDelay,  SecurityDelay,  LateAircraftDelay,  FirstDepTime,  TotalAddGTime,  LongestAddGTime,  DivAirportLandings,  DivReachedDest,  DivActualElapsedTime,  DivArrDelay,  DivDistance,  Div1Airport,  Div1AirportID,  Div1AirportSeqID,  Div1WheelsOn,  Div1TotalGTime,  Div1LongestGTime,  Div1WheelsOff,  Div1TailNum,  Div2Airport,  Div2AirportID,  Div2AirportSeqID,  Div2WheelsOn,  Div2TotalGTime,  Div2LongestGTime,  Div2WheelsOff,  Div2TailNum,  Div3Airport,  Div3AirportID,  Div3AirportSeqID,  Div3WheelsOn,  Div3TotalGTime,  Div3LongestGTime,  Div3WheelsOff,  Div3TailNum,  Div4Airport,  Div4AirportID,  Div4AirportSeqID,  Div4WheelsOn,  Div4TotalGTime,  Div4LongestGTime,  Div4WheelsOff,  Div4TailNum,  Div5Airport,  Div5AirportID,  Div5AirportSeqID,  Div5WheelsOn,  Div5TotalGTime,  Div5LongestGTime,  Div5WheelsOff,  Div5TailNum) FORMAT CSV\"");
}

echo "Complete in " . (time() - $start) . " seconds.\n";

