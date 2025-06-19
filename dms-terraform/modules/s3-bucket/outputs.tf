
output "s3_bucket_id" {
    value                           = aws_s3_bucket.s3-bucket.id
}

output "s3_bucket_arn" {
    value                           = aws_s3_bucket.s3-bucket.arn
}

output "bucket_name" {
  value = aws_s3_bucket.s3-bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.s3-bucket.arn
}
