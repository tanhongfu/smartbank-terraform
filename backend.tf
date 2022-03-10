terraform {
  backend "s3" {
    bucket         = "saturn-s3-tf-state"
    key            = "global/s3/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "saturn-bucket_lock"
    encrypt        = true
    profile        = "terraform"
  }
}


