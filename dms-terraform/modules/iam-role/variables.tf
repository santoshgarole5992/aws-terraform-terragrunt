variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "The assume role policy document"
  type        = string
}
