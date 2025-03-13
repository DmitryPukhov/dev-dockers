#!/bin/bash

echo "Set up external access to greenplum database"
source /home/gpadmin/env.sh
# Path to pg_hba.conf
PG_HBA_CONF="$COORDINATOR_DATA_DIRECTORY/pg_hba.conf"
# Path to postgresql.conf
POSTGRESQL_CONF="$COORDINATOR_DATA_DIRECTORY/postgresql.conf"

# Allow connections from any IP
echo "host    all    all    0.0.0.0/0    trust" >> $PG_HBA_CONF

# Set listen_addresses to all interfaces
sed -i "s/^#listen_addresses =.*/listen_addresses = '*'/" $POSTGRESQL_CONF

# Reload Greenplum configuration
su gpadmin -c "gpstop -u"