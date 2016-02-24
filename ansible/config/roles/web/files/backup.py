#!/usr/bin/env python

import bklib as b

region = 'DFW'
contname = 'mcbackups'

#Compress directory
bkup = b.compress_dir('../data/world', '../data/')
filepath = bkup[1]

#Upload file to Cloud Files
b.cloud_connect()
cont = b.upload_file(filepath, contname, region)

#Cleanup potentially old files
b.list_cont(contname, region)
