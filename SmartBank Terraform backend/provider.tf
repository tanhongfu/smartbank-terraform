terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.3"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
  profile = "terraform"

  default_tags {
    tags = {
      department  = "Saturn"
      product     = "1234"
      application = "5678"
      environment = "dev"
    }
  }


}
