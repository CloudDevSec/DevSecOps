resource "aws_s3_bucket" "backup_bucket" {
  bucket = "my-backup-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
resource "aws_iam_role" "backup_role" {
  name = "backup-role"
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "lambda.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  EOF
}

resource "aws_iam_role_policy" "backup_policy" {
  role = aws_iam_role.backup_role.id

  policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket"
        ],
        "Resource": [
          "${aws_s3_bucket.backup_bucket.arn}",
          "${aws_s3_bucket.backup_bucket.arn}/*"
        ]
      }
    ]
  }
  EOF
}

resource "aws_lambda_function" "backup_function" {
  filename         = "path/to/lambda.zip"
  function_name    = "backup-function"
  role             = aws_iam_role.backup_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.9"
}
