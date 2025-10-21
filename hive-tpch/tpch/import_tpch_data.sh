#!/bin/bash


# Directory containing the .tbl files
TPCH_DATA_DIR="/tpch/data"

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