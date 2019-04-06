provider "aws" {
  region     = "${var.region}"
}


resource "aws_instance" "selene-ah" {
   ami  = "${var.public_ami}"
   instance_type = "${var.instance-type}"
   key_name = "${var.keyname}"
   associate_public_ip_address = true
	 vpc_security_group_ids = ["${aws_security_group.selene_sg.id}"]
  tags {
    Name = "selene_frontend_instance"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.selene-ah.id}"
	tags {
    Name = "selene-elastic-ip"
  }
}
