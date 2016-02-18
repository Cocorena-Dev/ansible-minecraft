#/bin/bash

{% for host in groups['mc'] %}
rsync -avz minecraft@{{ hostvars[host]['rax_addresses']['private'][0]['addr'] }}:/home/minecraft/app/world /home/overviewer/data/
{% endfor %}
