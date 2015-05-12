
resource "aws_instance" "tlpinfmgt03vth" {
  instance_type = "t1.micro"
  ami = "${lookup(var.aws_amis, var.aws_region)}"
  key_name = "${var.TF_VAR_key_name}"

  connection {
    user = "ubuntu"
    key_file = "${var.TF_VAR_key_path}"
  }

  security_groups = [
    "SSH",
    "Splunk",
  ]

  tags = {
    client = "target"
    notify = "steven.swor@ecetera.com.au"
    Name = "tlpinfmgt03vth"
    "auto:stop" = "*/15 * * * *"
  }

}
