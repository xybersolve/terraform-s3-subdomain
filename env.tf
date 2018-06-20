#
#  XyberSolve specific variables, defined higher in the stack
#
#
#variable "aws_access_key" {}
#variable "aws_secret_key" {}
variable "environment" {
  description = "Which environment are we in?"
  default = "prod"
}

variable "zone" {
  default = "web"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_profile" {}
variable "aws_region" {}
variable "application" {}
variable "local_ips" {
  type = "list"
}
variable "ssh_public_key_path" {}
variable "ssh_private_key_path" {}
variable "ssh_public_key_name" {}
