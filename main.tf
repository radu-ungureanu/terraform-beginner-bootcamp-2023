terraform {
  cloud {
    organization = "Radu-Terraform-Beginner-Bootcamp-2023"

    workspaces {
      name = "terra-house-1"
    }
  }
}

locals {
  index_html_filepath = "${path.root}/public/index.html"
  error_html_filepath = "${path.root}/public/error.html"
  assets_path         = "${path.root}/public/assets"
  content_version     = 3
}

module "terrahouse_aws" {
  source              = "./modules/terrahouse_aws"
  user_uuid           = var.user_uuid
  bucket_name         = var.bucket_name
  index_html_filepath = local.index_html_filepath
  error_html_filepath = local.error_html_filepath
  content_version     = local.content_version
  assets_path         = local.assets_path
}
