terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.72.1"
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
