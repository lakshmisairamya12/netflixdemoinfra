provider "aws" {
region = "ap-south-1"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-0f918f7e67a3323f0"
instance_type = "t2.medium"
key_name = "netflix"
vpc_security_group_ids = ["sg-002c307d047f6fac3"]
tags = {
Name = var.instance_name[count.index]
}
}

variable "instance_names" {
  description = "List of EC2 instance names"
  type        = list(string)
  default = ["jenkins",  "Appserver-1", "Appserver-2", "Monitoring server"]
}

