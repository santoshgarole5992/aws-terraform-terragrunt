locals {
  # Get common variables from parent
  common_vars = read_terragrunt_config("../root.hcl")
  account_code = local.common_vars.locals.account_code
  env_code = local.common_vars.locals.env_code
  application_name = local.common_vars.locals.application_name
  env = local.common_vars.locals.env
}

# Include parent configuration
include "root" {
  path = "../root.hcl"
}

# Module configuration
terraform {
  source = "../../../modules/endpoints"
}

# Module inputs
inputs = {
  # Common variables
  account_code = local.account_code
  env_code = local.env_code
  application_name = local.application_name
  env = local.env

  # Source endpoint configuration
  endpoint_name = "${local.application_name}-source-endpoint"
  secrets_manager_arn = "arn:aws:secretsmanager:us-east-1:${local.account_code}:secret:your-secret-name"
  username = "dbuser"
  password = "dbpassword"  # Should be stored in AWS Secrets Manager
  server_name = "your-source-db-server"
  database_name = "your-source-db"
  port = 5432
  db_list = ["db1", "db2"]
  db_endpoint_type = "source"
  db_endpoint_engine_name = "postgres"
  kms_key_arn = "arn:aws:kms:us-east-1:${local.account_code}:key/your-kms-key-id"
  aws_role_arn = "arn:aws:iam::${local.account_code}:role/dms-vpc-role"
  ssl_mode = "none"

  # Target endpoint configuration
  s3_endpoint_type = "target"
  bucket_folder_path = "dms-data"
  bucket_name = "${local.application_name}-${local.env}-bucket"
  add_column_name = true
  compression_type = "NONE"
  csv_delimiter = ","
  csv_row_delimiter = "\\n"
  data_format = "csv"
  date_partition_delimiter = "NONE"
  date_partition_enabled = false
  date_partition_sequence = "YYYYMMDD"
  enable_statistics = true
  include_op_for_full_load = true
  parquet_timestamp_in_millisecond = false
  timestamp_column_name = "timestamp"
}
