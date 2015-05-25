resource "template_file" "ansible_inventory" {
  filename = "templates/ansible_inventory.tpl"
  vars {
    tlpinfmgt03vth = "${aws_instance.tlpinfmgt03vth.public_ip}"
    tldhybqat01vth = "${aws_instance.tldhybqat01vth.public_ip}"
    tldhybuat01vth = "${aws_instance.tldhybuat01vth.public_ip}"
    tldhybstg01vth = "${aws_instance.tldhybstg01vth.public_ip}"
    tldhybprd01pth = "${aws_instance.tldhybprd01pth.public_ip}"
    deployment_server_host = "${aws_instance.tlpinfmgt03vth.private_ip}"
    indexer_host = "${aws_instance.tlpinfmgt03vth.private_ip}"
  }
}
output "ansible_inventory_rendered" {
  value = "${template_file.ansible_inventory.rendered}"
}
