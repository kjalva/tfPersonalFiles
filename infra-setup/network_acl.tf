resource aws_network_acl "PubTFNACLIcmp" {

    vpc_id = "${var.vpcid}"
  //  subnet_ids=["${aws_subnet.PubSubnetTF.*.id}"]

    ingress {
        protocol = "tcp"
        rule_no = 100
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = "53"
        to_port = "53"
    }

    egress {
        
        protocol = "tcp"
        rule_no = 100
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = "53"
        to_port = "53"
    
    }

    tags {
        Name = "PubTFNACLIcmp"
    }
}

resource aws_network_acl "PubTFNACLSsh" {

    vpc_id = "${var.vpcid}"
//    subnet_ids=["${aws_subnet.PubSubnetTF.*.id}"]

    ingress {
        protocol = "tcp"
        rule_no = 200
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = "22"
        to_port = "22"
    }

    egress {
        protocol = "tcp"
        rule_no = 200
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = "22"
        to_port = "22"
    }

    tags {
        Name = "PubTFNACLSsh"
    }
}



resource aws_network_acl "PrivateTFNACLSsh" {

    vpc_id = "${var.vpcid}"
//    subnet_ids=["${aws_subnet.PrivateSubnetTF.*.id}"]

    ingress {
        protocol = "tcp"
        rule_no = 200
        action = "allow"
        cidr_block = "10.1.0.192/28"
        from_port = "22"
        to_port = "22"
    }

    egress {
        protocol = "tcp"
        rule_no = 200
        action = "allow"
        cidr_block = "10.1.0.192/28"
    }

    tags {
        Name = "PrivateTFNACLSsh"
    }    
}

resource aws_network_acl "PrivateTFNACLIcmp" {

    vpc_id = "${var.vpcid}"
//    subnet_ids=["${aws_subnet.PrivateSubnetTF.*.id}"]

    ingress {
        protocol = "tcp"
        rule_no = 200
        action = "allow"
        cidr_block = "10.1.0.192/28"
        from_port = "53"
        to_port = "53"
    }

    egress {
        
        protocol = "tcp"
        rule_no = 200
        action = "allow"
        cidr_block = "10.1.0.192/28"
        from_port = "53"
        to_port = "53"
    
    }
    tags {
        Name = "PrivateTFNACLIcmp"
    } 
}