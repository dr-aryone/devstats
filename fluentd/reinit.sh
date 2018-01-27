#!/bin/sh
./grafana/influxdb_recreate.sh fluentd_temp || exit 1
GHA2DB_CMDDEBUG=1 GHA2DB_RESETIDB=1 GHA2DB_LOCAL=1 GHA2DB_PROJECT=fluentd PG_DB=fluentd IDB_DB=fluentd_temp ./gha2db_sync || exit 2
./grafana/influxdb_recreate.sh fluentd || exit 3
./idb_backup fluentd_temp fluentd || exit 4
./grafana/influxdb_drop.sh fluentd_temp
