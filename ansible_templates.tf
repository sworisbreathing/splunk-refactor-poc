resource "template_file" "ansible_inventory" {
  filename = "templates/ansible_inventory.tpl"
  vars {
    splk_srv_standalone = "${aws_instance.splk_srv_standalone.public_ip}"
    splk_fwd_qat = "${aws_instance.splk_fwd_qat.public_ip}"
    splk_fwd_uat = "${aws_instance.splk_fwd_uat.public_ip}"
    splk_fwd_stg = "${aws_instance.splk_fwd_stg.public_ip}"
    splk_fwd_prd = "${aws_instance.splk_fwd_prd.public_ip}"
    deployment_server_host = "${aws_instance.splk_srv_standalone.private_ip}"
    indexer_host = "${aws_instance.splk_srv_standalone.private_ip}"
  }
}
output "ansible_inventory_rendered" {
  value = "${template_file.ansible_inventory.rendered}"
}
