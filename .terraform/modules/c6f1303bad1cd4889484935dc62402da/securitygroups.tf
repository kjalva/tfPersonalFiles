resource aws_security_group "insshonly" {
    name = "TFEc2SSH"
    description = "SSH only inbound"
    vpc_id = "${var.vpcid}"

    ingress {
        cidr_blocks = ["0.0.0.0/0"]
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
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
        from_port = "53"
        to_port = "53"
    }

    tags {
        Name = "TFEc2ICMP" 
    }
}