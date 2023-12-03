terraform {
  required_providers {
    # https://registry.terraform.io/providers/hashicorp/random/3.5.1
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }

    # https://registry.terraform.io/providers/hashicorp/aws/5.29.0
    aws = {
      source  = "hashicorp/aws"
      version = "5.29.0"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "aws" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length  = 32
  lower   = true
  special = false
  upper   = false
}

resource "aws_s3_bucket" "main_bucket" {
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}
