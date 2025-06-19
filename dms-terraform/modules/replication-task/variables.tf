variable "db_list" {
  description = "List of database names for which DMS replication tasks will be created"
  type        = list(string)
}

variable "migration_type" {
  description = "The type of migration (e.g., full-load, cdc, full-load-and-cdc)"
  type        = string
}

variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

# Optional: If you want to override default replication task settings file
variable "replication_task_settings_file" {
  description = "Path to the replication task settings JSON file"
  type        = string
  default     = "task_settings.json"
}

variable "replication_instance_arn" {
  description = "ARN of the DMS replication instance"
  type        = string
}

variable "source_endpoint_arn" {
  description = "ARN of the source endpoint"
  type        = string
}

variable "target_endpoint_arn" {
  description = "ARN of the target endpoint"
  type        = string
}

variable "replication_task_settings" {
  description = "Replication task settings JSON content"
  type        = string
  default     = "{}"
}

variable "table_mappings" {
  description = "Table mappings JSON content"
  type        = string
  default     = "{}"
}

variable "start_replication_task" {
  description = "Whether to start the replication task automatically"
  type        = bool
  default     = false
}
