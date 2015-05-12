resource "template_file" "ansible_inventory" {
  filename = "templates/ansible_inventory.tpl"
  vars {
    tldhybqat01vcl = "${aws_instance.tldhybqat01vcl.public_ip}"
  }
}
output "ansible_inventory_rendered" {
  value = "${template_file.ansible_inventory.rendered}"
}
