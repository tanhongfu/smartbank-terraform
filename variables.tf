variable "region" {
  type    = string
  default = "us-west-1"
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-0a74926286e5202d9"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.0.0/24"
  type    = string
}

variable "public_subnet2_cidr" {
  default = "10.0.1.0/24"
  type    = string
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
  type    = string
}

variable "private_subnet2_cidr" {
  default = "10.0.3.0/24"
  type    = string
}

variable "lb_type" {
  default = ["application", "network", "gateway"]
  type    = list(string)
}

variable "instance_type" {
  description = "type to use for the instance"
  type        = string
  default     = "t2.micro"
}

variable "sg_ports" {
  description = "list of ingress ports to use"
  type        = list(number)
  default     = [22, 3000, 80, 5432]
}

variable "db_username" {
  description = "username for rds"
  type        = string
  sensitive = true
}

variable "db_password" {
  description = "password for rds"
  type        = string
  sensitive = true
}



