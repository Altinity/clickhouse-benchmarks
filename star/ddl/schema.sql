CREATE TABLE starexp (
  antiNucleus	UInt32,
  eventFile	UInt32,
  eventNumber	UInt32,
  eventTime	Float64,
  histFile	UInt32,
  multiplicity	UInt32,
  NaboveLb	UInt32,
  NbelowLb	UInt32,
  NLb		UInt32,
  primaryTracks	UInt32,
  prodTime	Float64,
  Pt		Float32,
  runNumber	UInt32,
  vertexX		Float32,
  vertexY		Float32,
  vertexZ		Float32,
  eventDate Date default concat(substring(toString(floor(eventTime)), 1, 4), '-', substring(toString(floor(eventTime)), 5, 2), '-', substring(toString(floor(eventTime)), 7, 2))
)
ENGINE = MergeTree(eventDate, (eventNumber, eventTime, runNumber, eventFile, multiplicity), 8192);
