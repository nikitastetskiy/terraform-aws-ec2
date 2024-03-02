terraform {

  cloud {
    organization = "cesarfn4-demo"

    workspaces {
      name = "terraform-aws-deploy"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }

  required_version = "~> 1.2"
}
