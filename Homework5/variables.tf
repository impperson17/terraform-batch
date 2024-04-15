variable "region" {
  default = "us-west-2"
}

variable "route_table_names" {
  default = ["public-rt", "private-rt"]
}

variable "internet_gateway_name" {
  default = "homework5_igw"
}

variable "vpc" {
  type = list(object({
    vpc_cidr = string
    vpc_name = string
    vpc_sup  = bool
    dns_host = bool
  }))
  default = [{
    dns_host = true
    vpc_cidr = "192.168.0.0/16"
    vpc_name = "kaizen"
    vpc_sup  = true
  }]
}
variable "subnets" {
  description = "List of subnets"
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
  default = [
    {
      name              = "public1"
      cidr_block        = "192.168.1.0/24"
      availability_zone = "us-west-2a"
    },
    {
      name              = "public2"
      cidr_block        = "192.168.2.0/24"
      availability_zone = "us-west-2b"
    },
    {
      name              = "private1"
      cidr_block        = "192.168.101.0/24"
      availability_zone = "us-west-2c"
    },
    {
      name              = "private2"
      cidr_block        = "192.168.102.0/24"
      availability_zone = "us-west-2d"
    }
  ]
}

variable "ec2_instances" {
  default = [
    { name = "ubuntu", ami = "ami-08116b9957a259459", instance_type = "t2.micro" },
    { name = "amazon", ami = "ami-0395649fbe870727e", instance_type = "t2.micro" }
  ]
}

variable "open_ports" {
  description = "List of open ports"
  type        = list(number)
  default     = [22, 80]
}
variable "key_name" {
  description = "Name of the key pair"
  default     = "Bastion-key"
  type        = string
}
