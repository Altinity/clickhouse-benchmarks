#!/bin/bash

ZIP_FILES_DIR="zip"
CSV_FILES_DIR="csv"

mkdir "$CSV_FILES_DIR"

if [ ! -d "$CSV_FILES_DIR" ]; then
	"Can' use dir: $CSV_FILES_DIR - not available"
	exit 1
fi

for ZIP_FILENAME in `ls "$ZIP_FILES_DIR"/*.zip`; do
	echo "Unzipping $ZIP_FILENAME to $CSV_FILES_DIR/"
	unzip -o "$ZIP_FILENAME" -d "$CSV_FILES_DIR/"
done

clickhouse-client -m --query="$(cat ../ddl/schema.sql)"

for CSV_FILENAME in `ls "$CSV_FILES_DIR"/*.csv`; do
	LINES_NUM=`wc -l "$CSV_FILENAME"|awk '{print $1}'`
	echo "Importing $CSV_FILENAME, see $LINES_NUM lines in it"
	if [[ $LINES_NUM < 2 ]]; then
		echo "NOTICE: too few lines in $CSV_FILENAME, skip import"
	else
		tail -n +2 $CSV_FILENAME | clickhouse-client --query="INSERT INTO ontime ( 
Year, 
Quarter, 
Month, 
DayofMonth, 
DayOfWeek, 
FlightDate, 
UniqueCarrier, 
AirlineID, 
Carrier, 
TailNum, 
FlightNum, 
OriginAirportID, 
OriginAirportSeqID, 
OriginCityMarketID, 
Origin, 
OriginCityName, 
OriginState, 
OriginStateFips, 
OriginStateName, 
OriginWac, 
DestAirportID, 
DestAirportSeqID, 
DestCityMarketID, 
Dest, 
DestCityName, 
DestState, 
DestStateFips, 
DestStateName, 
DestWac, 
CRSDepTime, 
DepTime, 
DepDelay, 
DepDelayMinutes, 
DepDel15, 
DepartureDelayGroups, 
DepTimeBlk, 
TaxiOut, 
WheelsOff, 
WheelsOn, 
TaxiIn, 
CRSArrTime, 
ArrTime, 
ArrDelay, 
ArrDelayMinutes, 
ArrDel15, 
ArrivalDelayGroups, 
ArrTimeBlk, 
Cancelled, 
CancellationCode, 
Diverted, 
CRSElapsedTime, 
ActualElapsedTime, 
AirTime, 
Flights, 
Distance, 
DistanceGroup, 
CarrierDelay, 
WeatherDelay, 
NASDelay, 
SecurityDelay, 
LateAircraftDelay, 
FirstDepTime, 
TotalAddGTime, 
LongestAddGTime, 
DivAirportLandings, 
DivReachedDest, 
DivActualElapsedTime, 
DivArrDelay, 
DivDistance, 
Div1Airport, 
Div1AirportID, 
Div1AirportSeqID, 
Div1WheelsOn, 
Div1TotalGTime, 
Div1LongestGTime, 
Div1WheelsOff, 
Div1TailNum, 
Div2Airport, 
Div2AirportID, 
Div2AirportSeqID, 
Div2WheelsOn, 
Div2TotalGTime, 
Div2LongestGTime, 
Div2WheelsOff, 
Div2TailNum, 
Div3Airport, 
Div3AirportID, 
Div3AirportSeqID, 
Div3WheelsOn, 
Div3TotalGTime, 
Div3LongestGTime, 
Div3WheelsOff, 
Div3TailNum, 
Div4Airport, 
Div4AirportID, 
Div4AirportSeqID, 
Div4WheelsOn, 
Div4TotalGTime, 
Div4LongestGTime, 
Div4WheelsOff, 
Div4TailNum, 
Div5Airport, 
Div5AirportID, 
Div5AirportSeqID, 
Div5WheelsOn, 
Div5TotalGTime, 
Div5LongestGTime, 
Div5WheelsOff, 
Div5TailNum 
) FORMAT CSV"

	fi
done

