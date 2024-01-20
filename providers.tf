terraform {
  cloud {
    organization = "Radu-Terraform-Beginner-Bootcamp-2023"

    workspaces {
      name = "terra-house-1"
    }
  }
  
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
