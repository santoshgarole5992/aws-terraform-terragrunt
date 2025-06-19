variable "endpoint_name" {
  description = "The name of the DMS endpoint"
  type        = string
}

variable "username" {
  description = "The username for the database"
  type        = string
}

variable "password" {
  description = "The password for the database"
  type        = string
}

variable "server_name" {
  description = "The server name of the database"
  type        = string
}

variable "database_name" {
  description = "The name of the database"
  type        = string
}

variable "port" {
  description = "The port of the database"
  type        = number
}

variable "db_list" {
  description = "List of database names for which endpoints will be created"
  type        = list(string)
}

variable "db_endpoint_type" {
  description = "Type of the DB endpoint (source/target)"
  type        = string
}

variable "db_endpoint_engine_name" {
  description = "Engine name for the DB endpoint"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS Key ARN for encryption"
  type        = string
}

variable "secrets_manager_arn" {
  description = "ARN of the Secrets Manager secret"
  type        = string
}

variable "aws_role_arn" {
  description = "ARN of the AWS IAM role"
  type        = string
}

variable "ssl_mode" {
  description = "SSL mode for the endpoint"
  type        = string
}

variable "extra_connection_attributes" {
  description = "Extra connection attributes for the endpoint"
  type        = string
  default     = ""
}

variable "s3_endpoint_type" {
  description = "Type of the S3 endpoint (source/target)"
  type        = string
}

variable "bucket_folder_path" {
  description = "Folder path in the S3 bucket"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "add_column_name" {
  description = "Whether to add column name in S3 endpoint"
  type        = bool
}

variable "compression_type" {
  description = "Compression type for S3 endpoint"
  type        = string
}

variable "csv_delimiter" {
  description = "CSV delimiter for S3 endpoint"
  type        = string
}

variable "csv_row_delimiter" {
  description = "CSV row delimiter for S3 endpoint"
  type        = string
}

variable "data_format" {
  description = "Data format for S3 endpoint"
  type        = string
}

variable "date_partition_delimiter" {
  description = "Date partition delimiter for S3 endpoint"
  type        = string
}

variable "date_partition_enabled" {
  description = "Enable date partitioning for S3 endpoint"
  type        = bool
}

variable "date_partition_sequence" {
  description = "Date partition sequence for S3 endpoint"
  type        = string
}

variable "enable_statistics" {
  description = "Enable statistics for S3 endpoint"
  type        = bool
}

variable "include_op_for_full_load" {
  description = "Include operation for full load in S3 endpoint"
  type        = bool
}

variable "parquet_timestamp_in_millisecond" {
  description = "Use millisecond timestamps in Parquet for S3 endpoint"
  type        = bool
}

variable "timestamp_column_name" {
  description = "Timestamp column name for S3 endpoint"
  type        = string
}

variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}
