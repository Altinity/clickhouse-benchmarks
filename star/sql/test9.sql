SELECT eventFile,
    AVG(eventTime), AVG(multiplicity),
    MAX(runNumber), count(*)
FROM starexp
WHERE eventNumber > 20000
GROUP BY eventFile