variable "account_code" {
  description = "Account code used as part of naming convention"
  type        = string
}

variable "env_code" {
  description = "Environment code (e.g., dev, qa, prod)"
  type        = string
}

variable "application_name" {
  description = "Name of the application"
  type        = string
}

variable "env" {
  description = "Deployment environment"
  type        = string
}

variable "replication_instance_class" {
  description = "DMS replication instance class (e.g., dms.t3.medium)"
  type        = string
}

variable "replication_allocated_storage" {
  description = "Allocated storage in GB for the replication instance"
  type        = number
}

variable "repl_auto_minor_version_upgrade" {
  description = "Whether minor engine upgrades are applied automatically"
  type        = bool
}

variable "availability_zone" {
  description = "Availability zone in which to launch the replication instance"
  type        = string
}

variable "repl_engine_version" {
  description = "DMS replication engine version (e.g., 3.4.6)"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS Key ARN used to encrypt the replication instance"
  type        = string
}

variable "multi_az" {
  description = "Specifies if the replication instance is multi-AZ"
  type        = bool
}

variable "preferred_maintenance_window" {
  description = "Weekly time range during which system maintenance can occur"
  type        = string
}

variable "publicly_accessible" {
  description = "Whether the replication instance is publicly accessible"
  type        = bool
}

variable "network_type" {
  description = "The type of IP network (e.g., IPV4)"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to be assigned to the replication instance"
  type        = list(string)
}

variable "subnet_ids" {
  type    = list(any)
  default = []
}
