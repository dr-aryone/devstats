#!/bin/sh
echo 'To clear old annotations use: `influx -host '172.17.0.1' -username gha_admin -password ... -database grpc`, then `drop series from annotations; drop series from quick_ranges;`'
GHA2DB_PROJECT=grpc GHA2DB_DEBUG=1 GHA2DB_LOCAL=1 PG_DB=grpc IDB_DB=grpc ./annotations
