variable "region" {
  type = string
  description = "AWS region"
  default     = "eu-west-1"
}

variable "instance_type" {
  type = string
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_name" {
  type = string
  description = "EC2 instance name"
  default     = "terraform"
}

