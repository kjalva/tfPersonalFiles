resource aws_security_group "insshonly" {
    name = "TFEc2SSH"
    description = "SSH only inbound"
    vpc_id = "${var.vpcid}"

    ingress {
        cidr_blocks = ["0.0.0.0/0","${var.public_subnets}","${var.private_subnets}"]
        from_port = "22"
        to_port = "22"
        protocol = "tcp"        
    }

    egress {
        cidr_blocks = ["0.0.0.0/0","${var.public_subnets}","${var.private_subnets}"]
        from_port = "22"
        to_port = "22"
        protocol = "tcp"        
    }

    tags {
        Name = "TFEc2SSH" 
    }
}

resource aws_security_group "icmponly" {
    name = "TFEc2ICMP"
    description = "ICMP allow"
    vpc_id = "${var.vpcid}"

    ingress {
        cidr_blocks = ["0.0.0.0/0","${var.public_subnets}","${var.private_subnets}"]
        protocol = "icmp"
        //action = "allow"
        from_port = 8
        to_port = 0
    }

    ingress {
        cidr_blocks = ["0.0.0.0/0","${var.public_subnets}","${var.private_subnets}"]
        protocol = "icmp"
        //action = "allow"
        from_port = 0
        to_port = 0
    }
    /*ingress {
        cidr_blocks = ["0.0.0.0/0"]
        protocol = -1
        //action = "allow"
        from_port = 0
        to_port = 0
    }*/

    egress {
        cidr_blocks = ["0.0.0.0/0","${var.public_subnets}","${var.private_subnets}"]
        protocol = "tcp"
        //action = "allow"
        from_port = 0
        to_port = 65535
    }

    egress {
         cidr_blocks = ["0.0.0.0/0","${var.public_subnets}","${var.private_subnets}"]
        protocol = "icmp"
        //action = "allow"
        from_port = 8
        to_port = 0
    }

    tags {
        Name = "TFEc2ICMP" 
    }
}