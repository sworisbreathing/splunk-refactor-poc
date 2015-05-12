resource "template_file" "ansible_inventory" {
  filename = "templates/ansible_inventory.tpl"
  vars {
    tlpinfmgt03vth = "${aws_instance.tlpinfmgt03vth.public_ip}"
    tldhybqat01vcl = "${aws_instance.tldhybqat01vcl.public_ip}"
    deployment_server_host = "${aws_instance.tlpinfmgt03vth.private_ip}"
  }
}
output "ansible_inventory_rendered" {
  value = "${template_file.ansible_inventory.rendered}"
}
