provider "aws" {
  //region = "${var.myregion[0]}"
  region = "ap-south-1"
}

module "lc" {
  source = "./infra-setup"

  env = "${var.myenv}"

  //ipregion = "${var.myregion[0]}"
  ipregion = "ap-south-1"
  avbzones = "${lookup(var.availabilityzones, var.myregion)}"
}
