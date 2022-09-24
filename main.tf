provider "aws"{
    region = "us-east-1"
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_instance" "web" {
    ami = data.aws_ami.amazon-linux-2.id
    instance_type = "t2.micro"
    tags = {
        Name = "Web Server"
    }
}