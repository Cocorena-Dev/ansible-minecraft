#!/usr/bin/env python

import bklib as b

#Compress Directory
bkup = b.compress_dir('../data/world', '/home/overviewer/data')

#upload compressed file
filepath = bkup[1]
b.cloud_connect()
b.upload_file(filepath, 'mcbackups', 'DFW')

#cleanup rooutine
