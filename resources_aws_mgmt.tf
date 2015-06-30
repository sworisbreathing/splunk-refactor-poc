
resource "aws_instance" "splk_srv_standalone" {
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
    client = "ecetera"
    notify = "steven.swor@ecetera.com.au"
    Name = "techtalk-splunk-aws-terraform-ansible-standalone"
    "auto:stop" = "*/60 * * * *"
  }

}
