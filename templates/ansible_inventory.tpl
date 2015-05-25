[splunk_forwarders]

tldhybqat01vth ansible_ssh_user=ubuntu ansible_ssh_host=${tldhybqat01vth}

tldhybuat01vth ansible_ssh_user=ubuntu ansible_ssh_host=${tldhybuat01vth}

tldhybstg01vth ansible_ssh_user=ubuntu ansible_ssh_host=${tldhybstg01vth}

tldhybprd01pth ansible_ssh_user=ubuntu ansible_ssh_host=${tldhybprd01pth}


[splunk_forwarders:vars]
splunk_forwarder_deployment_server_host=${deployment_server_host}
splunk_forwarder_indexer_host=${indexer_host}

[splunk_servers]
tlpinfmgt03vth ansible_ssh_user=ubuntu ansible_ssh_host=${tlpinfmgt03vth}
