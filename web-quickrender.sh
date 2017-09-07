#!/bin/bash

rm -rf ~/.ansible/

#provision nodes
/usr/local/bin/ansible-playbook /home/dev/ansible-minecraft/config/web-prov.yml -f 20

#Ansible Ping entire environment
/usr/local/bin/ansible -u root -i /home/dev/ansible-minecraft/scripts/rax.py web -m ping -f 20

#configure nodes
/usr/local/bin/ansible-playbook -i /home/dev/ansible-minecraft/scripts/rax.py /home/dev/ansible-minecraft/config/web-config.yml -f 20 --skip-tags "fullrender"

#Delete node after job runs.
/usr/local/bin/ansible-playbook -i /home/dev/ansible-minecraft/scripts/rax.py /home/dev/ansible-minecraft/config/web-delete.yml -f 20
