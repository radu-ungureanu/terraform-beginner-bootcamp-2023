resource "random_string" "bucket_name" {
  length  = 32
  lower   = true
  special = false
  upper   = false
}

resource "aws_s3_bucket" "main_bucket" {
  bucket = random_string.bucket_name.result

  tags = {
    UserUUID = var.user_uuid
  }
}
