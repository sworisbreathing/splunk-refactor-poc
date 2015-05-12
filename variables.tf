variable "TF_VAR_access_key" {}
variable "TF_VAR_secret_key" {}
variable "TF_VAR_key_name" {}
variable "TF_VAR_key_path" {}

variable "aws_region" {
  description = "AWS region to launch servers."
  default = "ap-southeast-2"
}

# Ubuntu 14.04 paravirtual
variable "aws_amis" {
  default = {
    ap-southeast-2 = "ami-7163104b"
  }
}
