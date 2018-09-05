myenv = "dev"

myregion = ["ap-south-1", "eu-west-1"]

availabilityzones = {
  ap-south-1 = ["ap-south-1a", "ap-south-1b"]
  eu-west-1  = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

vpc_cidr = "10.1.0.0/16"
private_subnets = "10.1.0.0/26"
public_subnets = "10.1.0.192/28"
regindex = 0
key_pair_name= "TFEc2Inst3"