resource aws_instance "TFEc2Inst1Mub" {
  ami           = "ami-00b6a8a2bd28daf19"
  instance_type = "t2.micro"

  key_name = "TFEc2Inst1"

  //region        = "${var.ipregion}"
}
