resource "aws_s3_bucket" "public_bucket" {
  bucket = var.bucketnamee # Must be globally unique
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.public_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_all" {
  bucket = aws_s3_bucket.public_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadWrite"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          "${aws_s3_bucket.public_bucket.arn}",
          "${aws_s3_bucket.public_bucket.arn}/*"
        ]
      }
    ]
  })
}