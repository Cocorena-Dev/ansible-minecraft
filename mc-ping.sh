#!/bin/bash
#Ansible Ping entire environment

ansible -vvvv -u root -i scripts/rax.py mc -m ping -f 20
