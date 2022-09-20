resource "aws_s3_bucket" "static_hosting" {
  bucket = "assignment.appstellar.training"
  #   policy = file("policy.json")

}


resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.static_hosting.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.static_hosting.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.static_hosting.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["313422618945"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.static_hosting.arn,
      "${aws_s3_bucket.static_hosting.arn}/*",
    ]
  }
}
