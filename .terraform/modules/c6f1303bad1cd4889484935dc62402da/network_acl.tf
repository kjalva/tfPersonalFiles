resource aws_network_acl "PubTFNACL" {

    vpc_id = "${var.vpcid}"
    subnet_ids=["${aws_subnet.PubSubnetTF.id}"]

    ingress {
        protocol = "icmp"
        rule_no = 200
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
        icmp_type = 8
    }

    ingress {
        protocol = "icmp"
        rule_no = 400
        action = "allow"
        cidr_block = "${var.private_subnets}"
        from_port = 0
        to_port = 0
        icmp_type = 0
    }
    
    ingress {
        protocol = "tcp"
        rule_no = 300
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = "22"
        to_port = "22"
    }

    ingress {
        protocol = "tcp"
        rule_no = 500
        action = "allow"
        cidr_block = "${var.private_subnets}"
        from_port = "1024"
        to_port = "65535"
    }

    egress {
        
        protocol = "icmp"
        rule_no = 100
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    
    }

    egress {
        protocol = "tcp"
        rule_no = 200
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = "1024"
        to_port = "65535"
    }

    egress {
        protocol = "tcp"
        rule_no = 300
        action = "allow"
        cidr_block = "${var.private_subnets}"
        //cidr_block = "10.1.0.0/26"
        from_port = "22"
        to_port = "22"
    }

    egress {
        protocol = "icmp"
        rule_no = 400
        action = "allow"
        cidr_block = "${var.private_subnets}"
        from_port = 0
        to_port = 0
        icmp_type = 8
    }

    tags {
        Name = "PubTFNACL"
    }
}

/*resource aws_network_acl "PubTFNACL2" {

    vpc_id = "${var.vpcid}"
    subnet_ids=["${aws_subnet.PubSubnetTF.id}"]

    ingress {
        protocol = "icmp"
        rule_no = 200
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
        icmp_type = 8
    }

    ingress {
        protocol = "icmp"
        rule_no = 400
        action = "allow"
        cidr_block = "${var.private_subnets}"
        from_port = 0
        to_port = 0
        icmp_type = 0
    }
    
    ingress {
        protocol = "tcp"
        rule_no = 300
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = "22"
        to_port = "22"
    }

    egress {
        
        protocol = "icmp"
        rule_no = 100
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    
    }

    egress {
        protocol = "tcp"
        rule_no = 200
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = "1024"
        to_port = "65535"
    }

    egress {
        protocol = "tcp"
        rule_no = 300
        action = "allow"
        cidr_block = "${var.private_subnets}"
        //cidr_block = "10.1.0.0/26"
        from_port = "22"
        to_port = "22"
    }

    tags {
        Name = "PubTFNACL2"
    }
}*/


/*resource aws_network_acl "PubTFNACLSsh" {

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
}*/



resource aws_network_acl "PrivateTFNACL" {

    vpc_id = "${var.vpcid}"
    subnet_ids=["${aws_subnet.PrivateSubnetTF.id}"]

    ingress {
        protocol = "tcp"
        rule_no = 200
        action = "allow"
        cidr_block = "${var.public_subnets}"
        from_port = "22"
        to_port = "22"
    }

    egress {
        protocol = "tcp"
        rule_no = 200
        action = "allow"
        cidr_block = "${var.public_subnets}"
         from_port = "1024"
        to_port = "65535"
    }

    ingress {
        protocol = "icmp"
        rule_no = 100
        action = "allow"
        cidr_block = "${var.public_subnets}"
        from_port = 0
        to_port = 0
        icmp_type = 8
    }

    egress {
        
        protocol = "icmp"
        rule_no = 100
        action = "allow"
        cidr_block = "${var.public_subnets}"
        from_port = 0
        to_port = 0
    
    }

    ingress {
        protocol = "icmp"
        rule_no = 300
        action = "allow"
        cidr_block = "${var.public_subnets}"
        from_port = 0
        to_port = 0
        
    }

    egress {
        
        protocol = "icmp"
        rule_no = 300
        action = "allow"
        cidr_block = "${var.public_subnets}"
        from_port = 0
        to_port = 0
        icmp_type = 8
    }

    tags {
        Name = "PrivateTFNACL"
    }    
}

/*resource aws_network_acl "PrivateTFNACL2" {

    vpc_id = "${var.vpcid}"
    subnet_ids=["${aws_subnet.PrivateSubnetTF.id}"]

    ingress {
        protocol = "tcp"
        rule_no = 200
        action = "allow"
        cidr_block = "${var.public_subnets}"
        from_port = "22"
        to_port = "22"
    }

    egress {
        protocol = "tcp"
        rule_no = 200
        action = "allow"
        cidr_block = "${var.public_subnets}"
         from_port = "1024"
        to_port = "65535"
    }

    ingress {
        protocol = "icmp"
        rule_no = 100
        action = "allow"
        cidr_block = "${var.public_subnets}"
        from_port = 0
        to_port = 0
        icmp_type = 8
    }

    egress {
        
        protocol = "icmp"
        rule_no = 100
        action = "allow"
        cidr_block = "${var.public_subnets}"
        from_port = 0
        to_port = 0
    
    }

    tags {
        Name = "PrivateTFNACL2"
    }    
}*/