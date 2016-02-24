#!/usr/bin/env python

import time, os, zipfile, random, struct, pyrax
from Crypto.Cipher import AES
import pyrax.exceptions as exc

timestamp = time.strftime('%m-%d-%Y_%H:%M')

def cloud_connect():
    creds_file = os.path.expanduser("~/.rackspace_cloud_credentials")
    try:
        pyrax.set_setting("identity_type", "rackspace")
        pyrax.set_credential_file(creds_file)
    except exc.AuthenticationFailed:
        print "Problem with credential file ~/.rackspace_cloud_credentials"

def compress_dir(path, outpath):
    os.chdir(outpath)
    fname = path.split("/")[2]
    file_name = "%s%s.zip" % (fname, timestamp)
    zip = zipfile.ZipFile(file_name, 'w',
                          compression=zipfile.ZIP_DEFLATED,)
    for root, dirs, files in os.walk(path):
        for file in files:
            zip.write(os.path.join(root, file))
    return (path + "/" + file_name, outpath+"/"+file_name)

def upload_file(path, cont, dc):
    datacenter = dc
    cf = pyrax.connect_to_cloudfiles(datacenter)
    chksum = pyrax.utils.get_checksum(path)
    obj = cf.upload_file(cont, path, etag=chksum)
    return (obj)

def list_cont():
    files = obj.get_objects()
    for file in files:
        print(" ", obj.name)

if __name__ == "__main__":
    print "meh"
