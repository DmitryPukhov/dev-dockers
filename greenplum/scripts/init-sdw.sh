#! /bin/bash
set -e

BUILD=${1:-"source"}
/gpdb-scripts/install-and-prep-for-gpdb.sh $BUILD


