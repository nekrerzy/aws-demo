#s3 bucket for ProjectA
resource "aws_s3_bucket" "project-a-s3-bucket" {
    bucket = "project-a-s3-bucket-123456"
    
    tags = {
        Name = "projecta-s3-bucket"
    }
}

#s3 public access block for ProjectA
resource "aws_s3_bucket_public_access_block" "project-a-s3-bucket-public-access-block" {
    bucket = aws_s3_bucket.project-a-s3-bucket.id
    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}

data "aws_iam_policy_document" "allow_access_put_get" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
      }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutObject"
    ]

    resources = [
      aws_s3_bucket.project-a-s3-bucket.arn,
      "${aws_s3_bucket.project-a-s3-bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "allow_access_put_get" {
  bucket = aws_s3_bucket.project-a-s3-bucket.id
  policy = data.aws_iam_policy_document.allow_access_put_get.json
}
