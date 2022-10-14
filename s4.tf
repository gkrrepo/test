resource "random_pet" "lambda_test_name" {
  prefix = "lambda1"
  length = 2
}

resource "aws_s3_bucket" "lambda_test_bucket" {
  bucket        = random_pet.lambda_test_name.id
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "lambda_test_bucket" {
  bucket = aws_s3_bucket.lambda_test_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
