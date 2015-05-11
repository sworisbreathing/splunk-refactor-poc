provider "aws" {
  # AWS keys are loaded from gitignored terraform.tfvars
  access_key = "${var.TF_VAR_access_key}"
  secret_key = "${var.TF_VAR_secret_key}"

  region = "${var.aws_region}"
}
