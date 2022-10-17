#!/bin/bash

if [ -f /.init_control/run_timestamp ]; then

	echo >&2 "The database was already initialized before. Skipping script execution."

else
	export PGPASSWORD=${POSTGRES_PASSWORD}

	echo >&2 "Running *.sql"
	psql -h postgres -U ${POSTGRES_USER:-postgres} -d projeto-labbd -f /db/*.sql
	date '+%Y%m%d-%H%M%S' > /.init_control/run_timestamp
	echo >&2 "Saving timestamp at /.init_control/run_timestamp. DO NOT DELETE THIS FILE!"

fi