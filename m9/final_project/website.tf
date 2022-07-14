resource "aws_s3_bucket" "project_website" {
  bucket = "devops-2022-q2-project-website"
}

resource "aws_s3_bucket_acl" "project_website" {
    bucket = aws_s3_bucket.project_website.id
    acl = "public-read"
  
}

resource "aws_s3_bucket_website_configuration" "project_website" {
  bucket = aws_s3_bucket.project_website.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "project_website" {
  bucket = aws_s3_bucket.project_website.id
  policy = data.aws_iam_policy_document.project_website.json
}

data "aws_iam_policy_document" "project_website" {
  statement {
    principals {
      type = "*"
      identifiers = ["*"]
    }

    actions = [
        "s3:GetObject"
    ]

    resources = [
        "${aws_s3_bucket.project_website.arn}/*"
    ]
  }
}
