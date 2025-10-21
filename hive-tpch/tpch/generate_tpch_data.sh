#!/bin/bash

SCALE_FACTOR=0.001
TPCH_DIR=/tpch

function generate_tbl_files(){
  echo "Generating tbl files"

  # Generate tbl files
  cd $TPCH_DIR/2.18.0_rc2/dbgen
  ./dbgen -v -s $SCALE_FACTOR

  # Move the generated files to /tpch/data
  rm -r $TPCH_DIR/data
  mkdir -p $TPCH_DIR/data
  mv *.tbl $TPCH_DIR/data
  ls $TPCH_DIR/data
  echo "tbl files generated"
  cd $OLDPWD

}

function create_schema(){
  echo "Creating tpch schema"
  cd $TPCH_DIR
  hive -f create_tpch_schema.sql
  cd $OLDPWD
}

function import_data(){
  # Directory containing the .tbl files
  TPCH_DATA_DIR="$TPCH_DIR/data"

  # Load each dataset into respective tables
  hive -e "
  LOAD DATA LOCAL INPATH '${TPCH_DATA_DIR}/nation.tbl' OVERWRITE INTO TABLE tpch.nation;
  LOAD DATA LOCAL INPATH '${TPCH_DATA_DIR}/region.tbl' OVERWRITE INTO TABLE tpch.region;
  LOAD DATA LOCAL INPATH '${TPCH_DATA_DIR}/part.tbl' OVERWRITE INTO TABLE tpch.part;
  LOAD DATA LOCAL INPATH '${TPCH_DATA_DIR}/supplier.tbl' OVERWRITE INTO TABLE tpch.supplier;
  LOAD DATA LOCAL INPATH '${TPCH_DATA_DIR}/partsupp.tbl' OVERWRITE INTO TABLE tpch.partsupp;
  LOAD DATA LOCAL INPATH '${TPCH_DATA_DIR}/customer.tbl' OVERWRITE INTO TABLE tpch.customer;
  LOAD DATA LOCAL INPATH '${TPCH_DATA_DIR}/orders.tbl' OVERWRITE INTO TABLE tpch.orders;
  LOAD DATA LOCAL INPATH '${TPCH_DATA_DIR}/lineitem.tbl' OVERWRITE INTO TABLE tpch.lineitem;
  "

  hive -e "SELECT * FROM tpch.customer LIMIT 10;"
}

generate_tbl_files
create_schema
import_data