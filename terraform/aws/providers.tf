terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}

terraform {
  cloud {

    organization = "yashrajdighe-githubaction"

    workspaces {
      name = "yashrajdighe-githubactions"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "Common"
      Owner       = "TF"
      Created_by  = "Terraform"
    }
  }
}
