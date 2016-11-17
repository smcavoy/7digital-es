7Digital Elasticsearch Setup
---
configure aws cli for the credentials
assumes eu-west-1 and appropriate ec2/sg/etc. permissions

install elastic elasticsearch-ansible role from github
currently waiting to merge change
  https://github.com/smcavoy/ansible-elasticsearch.git
`git checkout branch seanmcavoy-install_pip`

install geerlingguy.repo-epel
  ansible-galaxy install geerlingguy.repo-epel

adjust the IP in `setup.tf`  "allow_all_from_home"

run
 `terraform plan`
assuming it does not complain run
 `terraform apply`

After this succeeds run the ansible command
 `ansible-playbook -i ./ec2.py elasticsearch-setup.yml`

You should now have a usable elasticsearch cluster
you can check the IP of the created nodes with
 `ec2.py --list`

And check  the cluster health :
http://[node1]:9200/_cluster/health
