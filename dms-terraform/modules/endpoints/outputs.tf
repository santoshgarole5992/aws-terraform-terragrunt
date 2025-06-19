output "source_endpoint_arn" {
  description = "The ARN of the source endpoint"
  value       = aws_dms_endpoint.db_endpoint[0].id
}

output "target_endpoint_arn" {
  description = "The ARN of the target endpoint"
  value       = aws_dms_s3_endpoint.s3_endpoint[0].id
} 