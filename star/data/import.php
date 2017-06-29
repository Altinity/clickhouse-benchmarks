<?php

$start = time();
$sourceFile = __DIR__ . '/star2002-full.csv';

for ($i = 0; $i < 500; $i++) {
    echo "start load for #$i\n";
    exec("cat $sourceFile | clickhouse-client --query=\"INSERT INTO starexp (antiNucleus, eventFile, eventNumber, eventTime, histFile, multiplicity, NaboveLb, NbelowLb, NLb, primaryTracks, prodTime, Pt, runNumber, vertexX, vertexY, vertexZ) FORMAT CSV\"");
    echo "finish load for #$i\n";
}

echo "Complete in " . (time() - $start) . " seconds.\n";

