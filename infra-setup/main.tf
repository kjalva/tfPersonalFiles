resource aws_instance "TFEc2Inst1Mub1" {
  ami           = "ami-00b6a8a2bd28daf19"
  instance_type = "t2.micro"

  key_name = "${var.key_pair_name}"
  subnet_id = "${aws_subnet.PubSubnetTF.id}"
  vpc_security_group_ids = ["${aws_security_group.insshonly.id}","${aws_security_group.icmponly.id}"]
  //region        = "${var.ipregion}"
  associate_public_ip_address = "true"
  tags{
    Name = "TFEc2Inst1Mub1"
  }
}

resource aws_instance "TFEc2Inst1Mub2" {
  ami           = "ami-00b6a8a2bd28daf19"
  instance_type = "t2.micro"

  key_name = "${var.key_pair_name}"
  subnet_id = "${aws_subnet.PrivateSubnetTF.id}"
  vpc_security_group_ids = ["${aws_security_group.insshonly.id}","${aws_security_group.icmponly.id}"]
  //region        = "${var.ipregion}"
  tags{
    Name = "TFEc2Inst1Mub2"
  }
}

resource aws_subnet "PubSubnetTF" {

  vpc_id="${var.vpcid}"
  cidr_block="${var.public_subnets}"
  //count = "${length(var.avbzones)}"
  availability_zone="${element(var.avbzones,0)}"
  map_public_ip_on_launch="true"

  tags {
    Name = "TFPublicSubnet1"
  }
}

resource aws_subnet "PrivateSubnetTF" {

  vpc_id="${var.vpcid}"
  cidr_block="${var.private_subnets}"
  availability_zone="${element(var.avbzones,1)}"

  tags {
    Name = "TFPrivateSubnet1"
  }
}


output "PubSubnets" {

  value = "${aws_subnet.PrivateSubnetTF.availability_zone}"
}

output "PrivateSubnets" {

  value = "${aws_subnet.PubSubnetTF.availability_zone}"
}




