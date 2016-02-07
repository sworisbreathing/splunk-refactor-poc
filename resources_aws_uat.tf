
resource "aws_instance" "splk_fwd_uat" {
  instance_type = "t1.micro"
  ami = "${lookup(var.aws_amis, var.aws_region)}"
  key_name = "${var.TF_VAR_key_name}"

  connection {
    user = "ubuntu"
    key_file = "${var.TF_VAR_key_path}"
  }

  security_groups = [
    "ssh_inbound_public",
    "splunk_outbound",
    "outbound_public"
  ]

  tags = {
    Name = "techtalk-splunk-aws-terraform-ansible-uat"
  }

}
