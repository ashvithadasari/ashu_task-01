

terraform {
  backend "s3" {
    bucket         =  "tasks3bucket99085567"  # S3 bucket name
    key            = var.backendkey            # Path inside the bucket
    region         =  "ap-south-1"               # AWS region
    encrypt        = true                          # Enable server-side encryption
               
}
}
