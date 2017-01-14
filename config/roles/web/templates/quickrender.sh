#!/bin/bash

rm -rf /home/overviewer/data/world
rm -rf /home/overviewer/render/*


{% for host in groups['mc'] %}
rsync --quiet -avze "ssh -i /home/overviewer/.ssh/id_rsa -o StrictHostKeyChecking=no" minecraft@{{ hostvars[host]['rax_addresses']['private'][0]['addr'] }}:/home/minecraft/app/world /home/overviewer/data/
{% endfor %}

screen -S map -D -m sleep 1 && /usr/bin/overviewer.py --config=/home/overviewer/overviewer.cfg

{% for host in groups['mc'] %}
ssh -o StrictHostKeyChecking=no minecraft@{{ hostvars[host]['rax_addresses']['private'][0]['addr'] }} 'rm -rf /var/www/mcmap/map'
{% endfor %}

{% for host in groups['mc'] %}
rsync --quiet -avze "ssh -i /home/overviewer/.ssh/id_rsa -o StrictHostKeyChecking=no" /home/overviewer/render/ minecraft@{{ hostvars[host]['rax_addresses']['private'][0]['addr'] }}:/var/www/mcmap/map
{% endfor %}
