[splunk_forwarders]
tldhybqat01vcl ansible_ssh_user=ubuntu ansible_ssh_host=${tldhybqat01vcl} deployment_client_name=tldhybqat01vcl

[splunk_forwarders:vars]
splunk_forwarder_deployment_server_host=${deployment_server_host}

[splunk_servers]
tlpinfmgt03vth ansible_ssh_user=ubuntu ansible_ssh_host=${tlpinfmgt03vth}
