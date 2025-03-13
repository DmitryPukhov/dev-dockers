#! /bin/bash
set -e

BUILD=${1:-"source"}

if [ $BUILD != "rpm" ] && [ $BUILD != "source" ]; then
    echo "Invalid argument: $BUILD"
    exit 1
fi

# Compile GPDB
if [ $BUILD == "source" ]; then
    /gpdb-scripts/compile-gpdb.sh
fi

/gpdb-scripts/install-and-prep-for-gpdb.sh $BUILD

/gpdb-scripts/create-gpdb-cluster.sh

/gpdb-scripts/setup_external_access.sh

