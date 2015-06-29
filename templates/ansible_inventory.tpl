[splunk_forwarders]

splk_fwd_qat ansible_ssh_user=ubuntu ansible_ssh_host=${splk_fwd_qat}

splk_fwd_uat ansible_ssh_user=ubuntu ansible_ssh_host=${splk_fwd_uat}

splk_fwd_stg ansible_ssh_user=ubuntu ansible_ssh_host=${splk_fwd_stg}

splk_fwd_prd ansible_ssh_user=ubuntu ansible_ssh_host=${splk_fwd_prd}


[splunk_forwarders:vars]
splunk_forwarder_deployment_server_host=${deployment_server_host}
splunk_forwarder_indexer_host=${indexer_host}

[splunk_servers]
splk_srv_standalone ansible_ssh_user=ubuntu ansible_ssh_host=${splk_srv_standalone}
