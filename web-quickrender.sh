#!/bin/bash

rm -rf ~/.ansible/

#provision nodes
ansible-playbook config/web-prov.yml -f 20

#Ansible Ping entire environment
ansible -u root -i scripts/rax.py web -m ping -f 20

#configure nodes
ansible-playbook -i scripts/rax.py config/web-config.yml -f 20 --skip-tags "fullrender"

#Delete node after job runs.
ansible-playbook -i scripts/rax.py config/web-delete.yml -f 20
