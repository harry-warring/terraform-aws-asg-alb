

resource "aws_s3_bucket" "bucket" {
  bucket = "back-end-state-bucket-1"

  #Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = false
  }
}

#Enable Versioning

resource "aws_s3_bucket_versioning" "versioning_enabled" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

#Enable server side encryption by default

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encrypted" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#Blocking all public access to the bucket

resource "aws_s3_bucket_public_access_block" "block_access" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#DynamoDB for Locking with Terraform

resource "aws_dynamodb_table" "locking_table" {
  name         = "table-for-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

