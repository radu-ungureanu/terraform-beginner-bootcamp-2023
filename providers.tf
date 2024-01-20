terraform {
  cloud {
    organization = "Radu-Terraform-Beginner-Bootcamp-2023"

    workspaces {
      name = "terra-house-1"
    }
  }
  
  required_providers {
    # https://registry.terraform.io/providers/hashicorp/aws/5.29.0
    aws = {
      source  = "hashicorp/aws"
      version = "5.33.0"
    }
  }
}

provider "aws" {
  # Configuration options
}
