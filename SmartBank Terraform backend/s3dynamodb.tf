resource "aws_dynamodb_table" "tf_table" {
  name           = "saturn-bucket_lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

}
# Issue with new version https://github.com/hashicorp/terraform-provider-aws/issues/23125
# https://github.com/hashicorp/terraform-provider-aws/issues/23106
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
#need to go console to make below commented changes

resource "aws_s3_bucket" "tf_bucket" {
  bucket = "saturn-s3-tf-state"
  }

  resource "aws_s3_bucket_acl" "saturn_acl" {
  bucket = aws_s3_bucket.tf_bucket.id
  acl    = "private"
  }

  resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encrypt" {
  bucket = aws_s3_bucket.tf_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      #kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "AES256"
    }
  }
  }

  resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.tf_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
  
  #acl    = "private"

  #lifecycle {
      #prevent_destroy = true
      #}

  #versioning {
    #enabled = true
      #}

    #server_side_encryption_configuration {
    #rule {
      #apply_server_side_encryption_by_default {
       # sse_algorithm     = "AES256"
      #}
    
    
