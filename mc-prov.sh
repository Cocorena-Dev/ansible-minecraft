#!/bin/bash
#This is the master provisioning script

#provision nodes
ansible-playbook -i scripts/rax.py config/mc-prov.yml -f 20

#configure nodes
ansible-playbook -i scripts/rax.py config/mc-config.yml -f 20

#ping them
ansible -vvvv -u root -i scripts/rax.py mc -m ping -f 20
