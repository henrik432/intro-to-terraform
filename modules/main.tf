provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "state-bucket"
    dynamodb_table = "lock-table"
    key = "state.tfstate"
    region = "eu-central-1"
    encrypt = true
  }
}
