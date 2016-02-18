#/bin/bash
#This file backs up the world to cloud files.

filename=minecraft-`date +%Y%m%d_%H%M%S`.tar

mkdir /home/minecraft/backup
rsync -avz /home/minecraft/app/world/ /home/minecraft/backup
tar -cvf $filename
upload $filename
