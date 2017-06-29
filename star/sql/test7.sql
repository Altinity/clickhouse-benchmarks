SELECT eventFile, eventTime, count(*)
FROM starexp
WHERE eventNumber > 525000
GROUP BY eventFile, eventTime
ORDER BY eventFile DESC, eventTime ASC