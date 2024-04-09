provider "aws" {
  region = "us-west-2"
}
data "aws_ami" "amazon-linux-2" {
 most_recent = true

filter {
   name   = "owner-alias"
   values = ["amazon"]
 }


 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }

filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}

# resource "aws_instance" "web" {
#   ami           = data.aws_ami.aws-linux-2.id
#   instance_type = "t2.micro"
# }

data "aws_availability_zones" "all" {}

resource "aws_instance" "web" {
  count         = 3 
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  availability_zone      = element(data.aws_availability_zones.all.names, count.index)
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = aws_key_pair.key.key_name

  user_data = file("apache.sh")
  user_data_replace_on_change = true 

   tags = {
    Name = "web-${count.index + 1}"
  }
}
output ec2 {
  value = aws_instance.web[*].public_ip
}
