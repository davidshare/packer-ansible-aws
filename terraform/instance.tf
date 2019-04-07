# specify the region you want to provision your instance
provider "aws" {
  region     = "${var.region}"
}

# create the aws instance
resource "aws_instance" "selene-ah" {
	# specify the base image for the instance you want to provision
   ami  = "${var.public_ami}"

	# specify the instance type
   instance_type = "${var.instance-type}"

	# specify the keypair file to be used in provisioning the instance
   key_name = "${var.keyname}"

	# specify that a public ip address should be associated with this instance
   associate_public_ip_address = true

	# specify the security group to be used for this instance
	 vpc_security_group_ids = ["${aws_security_group.selene_sg.id}"]

	# give the instance a tag
  tags {
    Name = "selene_frontend_instance"
  }
}

# reserve an elastic Ip address for the instance
resource "aws_eip" "ip" {
  instance = "${aws_instance.selene-ah.id}"
	tags {
    Name = "selene-elastic-ip"
  }
}
