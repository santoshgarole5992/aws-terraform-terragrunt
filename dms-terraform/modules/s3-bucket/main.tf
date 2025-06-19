resource "aws_s3_bucket" "s3-bucket" {
    bucket                          = var.bucket_name
}
resource "aws_s3_bucket_public_access_block" "bucket_acl" {
    bucket                          = aws_s3_bucket.s3-bucket.id
    block_public_acls               = true
    block_public_policy             = true
    ignore_public_acls              = true
    restrict_public_buckets         = true
}

resource "aws_s3_bucket_policy" "bucket_policy" {
    bucket                          = aws_s3_bucket.s3-bucket.id
    policy                          = data.aws_iam_policy_document.bucket_policy.json
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
     principals {
      type                          = "AWS"
      identifiers                   = [var.aws_role_arn]
     }
       actions                      = [
       "s3:AbortMultipartUpload",
       "s3:GetBucketLocation",
       "s3:GetObject",
       "s3:ListBucket",
       "s3:ListBucketMultipartUploads",
       "s3:PutObject",
       "s3:PutObjectAcl"
     ]

     resources                      = [
       "arn:aws:s3:::${var.bucket_name}",
       "arn:aws:s3:::${var.bucket_name}/*"
    ]
   }
}
