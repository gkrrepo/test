resource "aws_s3_bucket" "codepipeline_artifacmts_gkr_c" {
  bucket = "pipeline-artifacts-gkr-13"
  acl    = "private"
} 
