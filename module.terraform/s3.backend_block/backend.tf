terraform {
  backend "s3" {
    bucket         = var.bucketname   # S3 bucket name
    key            = var.key # Path inside the bucket
    region         = var.region                  # AWS region
    encrypt        = true                          # Enable server-side encryption
    dynamodb_table = "terraform-locks"             # DynamoDB table for state locking
  }
}
