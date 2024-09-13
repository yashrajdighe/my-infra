terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
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
