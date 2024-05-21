terraform {
  cloud {
    organization = "Radu-Terraform-Beginner-Bootcamp-2023"

    workspaces {
      name = "terra-house-1"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.33.0"
    }
  }
}

provider "aws" {}
