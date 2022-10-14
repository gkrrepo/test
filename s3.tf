terraform{
    backend "s3" {
        bucket = "terraform-buk11"
        encrypt = true
        key = "terraform.tfstate"
        region = "us-east-1"
    }
}

resource "random_pet" "lambda_bucket_k_name" {
  prefix = "lambda2"
  length = 2
}

resource "aws_s3_bucket" "lambda_k_bucket" {
  bucket        = random_pet.lambda_bucket_k_name.id
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "lambda_k_bucket" {
  bucket = aws_s3_bucket.lambda_k_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
