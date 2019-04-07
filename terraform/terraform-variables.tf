# create a variable with the region to provision the instance
variable "region" {
  default = "eu-west-1"
}

# create a variable that holds the instance type
variable "instance-type" {
	default ="t2.micro"
}

# create a variable that holds the name of the keypair to be used
variable "keyname" {
	default = "eu-west-1-key"
}

# create a variable with the tag of the instance
variable "public_sg_name" {
	default ="selene-sg"
}
