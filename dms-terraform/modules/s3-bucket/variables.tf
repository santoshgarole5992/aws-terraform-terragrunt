variable "bucket_name" {
  description                       = "The name of the S3 bucket"
  type                              = string
}

variable "aws_role_arn" {
  description                       = "The ARN of the AWS IAM role for the bucket policy"
  type                              = string
}