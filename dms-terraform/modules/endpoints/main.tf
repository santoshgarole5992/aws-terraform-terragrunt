resource "aws_dms_endpoint" "db_endpoint" {
  count                                  = length(var.db_list)
  database_name                          = var.db_list[count.index]
  endpoint_id                            = "${replace("${var.db_list[count.index]}", "_", "-")}-${var.env}-db-endpoint"
  endpoint_type                          = var.db_endpoint_type
  engine_name                            = var.db_endpoint_engine_name
  kms_key_arn                            = var.kms_key_arn
  secrets_manager_arn                    = var.secrets_manager_arn
  secrets_manager_access_role_arn        = var.aws_role_arn
  ssl_mode                               = var.ssl_mode
  extra_connection_attributes            = var.extra_connection_attributes
}

resource "aws_dms_s3_endpoint" "s3_endpoint" {
  count                                  = length(var.db_list)
  endpoint_id                            = "${replace("${var.db_list[count.index]}", "_", "-")}-${var.env}-s3-endpoint"
  endpoint_type                          = var.s3_endpoint_type
  ssl_mode                               = var.ssl_mode
  bucket_folder                          = "${var.bucket_folder_path}/${var.db_list[count.index]}"
  bucket_name                            = var.bucket_name
  add_column_name                        = var.add_column_name
  compression_type                       = var.compression_type
  csv_delimiter                          = var.csv_delimiter
  csv_row_delimiter                      = var.csv_row_delimiter
  data_format                            = var.data_format
  date_partition_delimiter               = var.date_partition_delimiter
  date_partition_enabled                 = var.date_partition_enabled
  date_partition_sequence                = var.date_partition_sequence
  enable_statistics                      = var.enable_statistics
  include_op_for_full_load               = var.include_op_for_full_load
  parquet_timestamp_in_millisecond       = var.parquet_timestamp_in_millisecond
  timestamp_column_name                  = var.timestamp_column_name
  service_access_role_arn                = var.aws_role_arn
}
