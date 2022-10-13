resource "aws_s3_bucket" "codepipeline_artifacmts_gkr" {
  bucket = "pipeline-artifacts-gkr-13"
  acl    = "private"
} 