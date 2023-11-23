variable "region" {
  default = "us-east-1"
}

variable "cidr" {
  default = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  default = "10.0.1.0/24"
}

variable "subnet2_cidr" {
  default = "10.0.2.0/24"
}

variable "subnet1_az" {
  default = "us-east-1a"
}

variable "subnet2_az" {
  default = "us-east-1b"
}

variable "ubuntu_ami" {
  default = "ami-0fc5d935ebf8bc3bc"
}