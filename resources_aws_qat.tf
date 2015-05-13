
resource "aws_instance" "tldhybqat01vth" {
  instance_type = "t1.micro"
  ami = "${lookup(var.aws_amis, var.aws_region)}"
  key_name = "${var.TF_VAR_key_name}"

  connection {
    user = "ubuntu"
    key_file = "${var.TF_VAR_key_path}"
  }

  security_groups = [
    "SSH"
  ]

  tags = {
    client = "target"
    notify = "steven.swor@ecetera.com.au"
    Name = "tldhybqat01vth"
    "auto:stop" = "*/15 * * * *"
  }

}
