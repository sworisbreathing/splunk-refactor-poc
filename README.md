Splunk App Refactoring POC
==========================

This is a repository for doing offline testing of an attempt to refactor the Splunk app repository at Target.

Why
---

When we set up Splunk in 2013, the automated process for deploying apps to splunk was (effectively)

  1. commit app to git repository (manual)
  2. `git pull`
  3. copy the repository contents to `$SPLUNK_HOME/etc/deployment-apps`
  4. copy the repository contents to `$SPLUNK_HOME/etc/apps`
  5. restart splunk

This is bad.

The Fix
-------
Refactor the apps so that TAs which get deployed to forwarders are separate from apps which get deployed to the indexer/search head. The new process is (effectively):

  1. commit app to git repository (manual)
  2. `git pull`
  3. copy `$git_repo/deployment-apps` to `$SPLUNK_HOME/etc/deployment-apps`
  4. copy `$git_repo/apps` to `$SPLUNK_HOME/etc/apps`
  5. some smarts to determine if we need to restart Splunk entirely, or just reload the deployment server.

Offline Testing
---------------
It turns out that the apps had a *lot* of config in them, so we need a way to test the refactoring process to make sure we don't break something important. As Target don't have a test environment for Splunk, AWS seemed like the most obvious easy solution.

Terraform
---------
This seemed like an ideal use case for trying out Terraform... short-lived infrastructure
that we will probably need to blow away and recreate quite often, with versioning of changes.

To get started:

1. install terraform
2. get your AWS access key and AWS secret key
3. clone this repo
4. create a file named `terraform.tfvars` in the root of this repository (don't worry... it's gitignored), with the following contents:

```
    TF_VAR_access_key="<your aws access key>"
    TF_VAR_secret_key="<your aws secret key>"
    TF_VAR_key_name="<name of the SSH key in AWS>"
    TF_VAR_key_path="<path to the SSH private key file>"
```

To spin up:

`terraform apply`

To tear down:

`terraform destroy`

Provisioning with Ansible
-------------------------

replace the `splunk_server.git_repo.url`
in `ansible/roles/splunk_deployment_server/vars/main.yml`
with the real one.

Then run:

```
    terraform apply
    terraform output ansible_inventory_rendered > ansible/ansible.inventory
    cd ansible
    ansible-playbook --private-key=<path_to_private_key> playbook.yml
```
