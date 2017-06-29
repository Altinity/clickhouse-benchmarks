SELECT eventFile, count(*)
FROM starexp
WHERE eventNumber > 525000
GROUP BY eventFile