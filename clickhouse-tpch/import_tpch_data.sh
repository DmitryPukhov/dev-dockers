cd "/tmp/tpchdata"
clickhouse-client --format_csv_delimiter '|' --query "INSERT INTO tpch.nation FORMAT CSV" < nation.tbl
clickhouse-client --format_csv_delimiter '|' --query "INSERT INTO tpch.region FORMAT CSV" < region.tbl
clickhouse-client --format_csv_delimiter '|' --query "INSERT INTO tpch.part FORMAT CSV" < part.tbl
clickhouse-client --format_csv_delimiter '|' --query "INSERT INTO tpch.supplier FORMAT CSV" < supplier.tbl
clickhouse-client --format_csv_delimiter '|' --query "INSERT INTO tpch.partsupp FORMAT CSV" < partsupp.tbl
clickhouse-client --format_csv_delimiter '|' --query "INSERT INTO tpch.customer FORMAT CSV" < customer.tbl
clickhouse-client --format_csv_delimiter '|' --query "INSERT INTO tpch.orders FORMAT CSV" < orders.tbl
clickhouse-client --format_csv_delimiter '|' --query "INSERT INTO tpch.lineitem FORMAT CSV" < lineitem.tbl