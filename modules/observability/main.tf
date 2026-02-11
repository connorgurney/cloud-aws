# CloudTrail itself
resource "aws_cloudtrail" "this" {
  name = "connorgurney-cloud"

  s3_bucket_name = aws_s3_bucket.this.id

  is_multi_region_trail      = true
  enable_log_file_validation = true

  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.this.arn}:*"
  cloud_watch_logs_role_arn  = aws_iam_role.this.arn

  depends_on = [
    aws_iam_role_policy.this,
    aws_s3_bucket_policy.this
  ]
}

# IAM role and policy for CloudTrail to assume
resource "aws_iam_role" "this" {
  name = "connorgurney-cloud-observability-logging"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "cloudtrail.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "this" {
  name   = "connorgurney-cloud-observability-logging"
  role   = aws_iam_role.this.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "${aws_cloudwatch_log_group.this.arn}:*"
      }
    ]
  })
}

# CloudWatch Logs log group to temporarily store logs in
resource "aws_cloudwatch_log_group" "this" {
    name = "/connorgurney/cloud"

    # I'll be retaining logs via Grafana Loki but keep them here for 7 days in
    # case my Lambda function to forward them fails to do so.
    retention_in_days = 7
}

# S3 bucket that CloudTrail insists on having
# I don't use this bucket in any meaningful way, as I send all of my logs into
# CloudWatch, and will be sending them onto Grafana Loki from there, but I'm
# required to have one because, well, legacy stuff, I guess.
resource "aws_s3_bucket" "this" {
    bucket = "connorgurney-cloud-logs-${var.environment}"
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = "s3:GetBucketAcl"
        Resource = aws_s3_bucket.this.arn
      },
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.this.arn}/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    id     = "default"
    status = "Enabled"

    expiration {
      days = 1
    }
  }
}
