terraform {
  backend "s3" {
    bucket         = "aaku-backend-s3-un"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "akku-db-table"
  }
}