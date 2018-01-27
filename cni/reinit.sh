#!/bin/sh
./grafana/influxdb_recreate.sh cni_temp || exit 1
GHA2DB_CMDDEBUG=1 GHA2DB_RESETIDB=1 GHA2DB_LOCAL=1 GHA2DB_PROJECT=cni PG_DB=cni IDB_DB=cni_temp ./gha2db_sync || exit 2
./grafana/influxdb_recreate.sh cni || exit 3
./idb_backup cni_temp cni || exit 4
./grafana/influxdb_drop.sh cni_temp
