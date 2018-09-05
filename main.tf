provider "aws" {
  //region = "${var.myregion[0]}"
  region = "ap-south-1"
}

module "lc" {
  source = "./infra-setup"

  env = "${var.myenv}"

  ipregion = "${var.myregion[var.regindex]}"
  //ipregion = "ap-south-1"
  avbzones = "${var.availabilityzones[var.myregion[var.regindex]]}"
  vpcid = "${aws_vpc.AWSTest03TF.id}"
  public_subnets = "${var.public_subnets}"
  private_subnets = "${var.private_subnets}"
  key_pair_name = "${var.key_pair_name}"
  //dynamodb = "${aws_dynamodb_table.tfstate_dynamodb_table.name}"
  //bucket="${aws_s3_bucket.TFStateFiles.bucket}"
}
