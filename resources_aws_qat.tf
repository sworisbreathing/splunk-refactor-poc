
resource "aws_instance" "tldhybqat01vcl" {
  instance_type = "t1.micro"
  ami = "${lookup(var.aws_amis, var.aws_region)}"
}
