resource aws_internet_gateway "TFIgw1" {

    vpc_id = "${var.vpcid}"

    tags {
        Name = "TFIgw1"
    }
}