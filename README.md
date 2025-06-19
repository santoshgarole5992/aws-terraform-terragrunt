# AWS DMS Terraform/Terragrunt Infrastructure

This repository contains reusable Terraform modules and Terragrunt configurations for managing AWS Database Migration Service (DMS) resources, including:
- Endpoints
- Replication Instance
- Replication Task
- Secrets Manager
- IAM Role
- S3 Bucket

## Directory Structure

```
dms-terraform/
├── environments/
│   ├── dev/
│   │   ├── root.hcl
│   │   ├── endpoints/terragrunt.hcl
│   │   ├── replication-instance/terragrunt.hcl
│   │   ├── replication-task/terragrunt.hcl
│   │   ├── s3-bucket/terragrunt.hcl
│   │   ├── secrets-manager/terragrunt.hcl
│   │   └── iam-role/terragrunt.hcl
│   └── production/
│       └── ...
├── modules/
│   ├── endpoints/
│   ├── replication-instance/
│   ├── replication-task/
│   ├── s3-bucket/
│   ├── secrets-manager/
│   └── iam-role/
└── ...
```

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/) >= 0.35
- AWS CLI configured with credentials (`aws configure` or environment variables)
- S3 bucket and DynamoDB table for remote state backend

## Setup & Usage

1. **Clone the repository:**
   ```sh
   git clone <repo-url>
   cd aws-terraform-terragrunt/dms-terraform/environments/dev
   ```

2. **Configure AWS Credentials:**
   Ensure your AWS credentials are set in your environment or via `aws configure`.
   ```sh
   export AWS_ACCESS_KEY_ID=...
   export AWS_SECRET_ACCESS_KEY=...
   export AWS_SESSION_TOKEN=...
   ```

3. **Edit Environment Variables:**
   - Update `root.hcl` with your environment, region, and backend S3/DynamoDB details.
   - Update each module's `terragrunt.hcl` with real values for subnet IDs, security group IDs, KMS key ARNs, etc.

4. **Run Terragrunt Commands:**
   - Initialize and plan for a module (e.g., replication-instance):
     ```sh
     cd replication-instance
     terragrunt init
     terragrunt plan
     terragrunt apply
     ```
   - Repeat for other modules as needed.

5. **Module Dependencies:**
   - Dependencies (e.g., IAM role, S3 bucket) are handled via Terragrunt's `dependency` blocks and outputs.
   - Ensure dependencies are applied before dependent modules.

6. **CI/CD Pipeline:**
   - The repo includes a sample `.gitlab-ci.yml` for automating Terragrunt validate, plan, and apply stages, with Slack notifications.

## Notes
- **Backend:** Remote state is managed via S3 and DynamoDB, configured in `root.hcl`.
- **Provider:** AWS provider is centrally configured using Terragrunt's `generate` block in `root.hcl`.
- **Environments:** Separate folders for `dev` and `production` allow isolated state and configuration.
- **Secrets:** Do not hardcode sensitive values. Use AWS Secrets Manager and reference ARNs in your configs.

## Example: Setting KMS Key ARN
Replace this placeholder in your `terragrunt.hcl`:
```hcl
kms_key_arn = "arn:aws:kms:us-east-1:<your-account-id>:key/<your-kms-key-id>"
```

## Troubleshooting
- Ensure all required variables are set in each module's `terragrunt.hcl`.
- If you see errors about missing subnets, provide at least 2 subnet IDs for DMS replication subnet groups.
- For invalid ARN errors, use your real AWS account ID and resource IDs.
- If you see credential errors, refresh your AWS session or re-export credentials.

## References
- [Terragrunt Documentation](https://terragrunt.gruntwork.io/docs/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS DMS Documentation](https://docs.aws.amazon.com/dms/index.html)
