resource aws_route_table "TFCustomTable1" {
    vpc_id = "${var.vpcid}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.TFIgw1.id}"
        //gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "TFCustomTable1"
    }
}

resource aws_route_table_association "TFPubSubnetAsc" {

    subnet_id ="${aws_subnet.PubSubnetTF.id}"
    route_table_id = "${aws_route_table.TFCustomTable1.id}"
}