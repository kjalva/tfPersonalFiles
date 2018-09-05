terraform {
  backend "s3" {
    encrypt = "true"
    //bucket="${aws_s3_bucket.TFStateFiles.bucket}"
    bucket="awstest03-tf-states"
    key="versions/v1/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "Test03TFLockDynamoDB"
    //dynamodb = "${aws_dynamodb_table.tfstate_dynamodb_table.name}"
  }
}