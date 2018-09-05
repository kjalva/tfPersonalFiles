output "VPC" {
  value = "${aws_vpc.AWSTest03TF.cidr_block}"
  //value = "${aws_subnet.PubSubnetTF.id}"
}
