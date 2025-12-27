/*
terraform {
  backend "s3" {
    bucket = "back-end-state-bucket-1"
    key    = "terraform/state.tfstate"
    region = var.region

    dynamodb_table = "table-for-locking"
    encrypt        = true
  }
}
*/
