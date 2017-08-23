Airline On-Time Performance Data

This dataset contains on-time arrival data for non-stop domestic flights by major air carriers, and provides such additional items as departure and arrival delays, origin and destination airports, flight numbers, scheduled and actual departure and arrival times, cancelled or diverted flights, taxi-out and taxi-in times, air time, and non-stop distance. This is an official dataset took from https://transtats.bts.gov/.

This repo has scripts that downloads the data from its source and prepares ClickHouse schema.

The Schema

There is only one table `ontime` which has 109 columns with more than 175 mil rows.