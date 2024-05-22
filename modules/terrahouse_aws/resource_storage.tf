resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
    UserUUID = var.user_uuid
  }
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "terraform_data" "content_version" {
  input = var.content_version
}

resource "aws_s3_object" "website_index" {
  bucket       = aws_s3_bucket.website_bucket.bucket
  key          = "index.html"
  content_type = "text/html"
  source       = var.index_html_filepath
  etag         = filemd5(var.index_html_filepath)

  lifecycle {
    ignore_changes       = [etag]
    replace_triggered_by = [terraform_data.content_version.output]
  }
}

resource "aws_s3_object" "website_error" {
  bucket       = aws_s3_bucket.website_bucket.bucket
  key          = "error.html"
  content_type = "text/html"
  source       = var.error_html_filepath
  etag         = filemd5(var.error_html_filepath)

  lifecycle {
    ignore_changes       = [etag]
    replace_triggered_by = [terraform_data.content_version.output]
  }
}

resource "aws_s3_object" "assets" {
  for_each = fileset(var.assets_path, "*.{jpg,png,gif}")
  bucket   = aws_s3_bucket.website_bucket.bucket
  key      = "assets/${each.key}"
  source   = "${var.assets_path}/${each.key}"
  etag     = filemd5("${var.assets_path}/${each.key}")

  lifecycle {
    ignore_changes       = [etag]
    replace_triggered_by = [terraform_data.content_version.output]
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.bucket
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipalReadOnly",
        Effect = "Allow",
        Principal = {
          Service = "cloudfront.amazonaws.com"
        },
        Action   = "s3:GetObject",
        Resource = "${aws_s3_bucket.website_bucket.arn}/*",
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.s3_distribution.id}"
          }
        }
      }
    ]
  })
}
