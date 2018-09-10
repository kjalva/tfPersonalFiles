resource aws_vpc "AWSTest03TF"{

    cidr_block = "${var.vpc_cidr}"

//cidr_block = "10.1.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"

    tags{
        Name = "TFVPCTest1"
    }   
}