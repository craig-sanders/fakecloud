
Subdirectories:

* `all/    `  - files that are delivered to ALL VMs.
* `default/`  - files that are delivered to VMs without their own host-specific files.
* `vmname/ `  - host-specific files.

Filenames supported in all of the above subdirectories are:

* `userdata   ` - generic text/cloud-config userdata items
* `hostkeys   ` - ssh host keys to prevent the VM from generating new keys on every reboot (text/cloud-config)
* `authkeys   ` - ssh auth keys that are added to root and the first user (text/cloud-config)
* `shellscript` - text/x-shellscript
  
Filenames supported in vmname/ subdirectories:

* `exclude-all            ` - exclude all files from all/ subdirectory
* `exclude-all-userdata   ` - exclude all/userdata for this host
* `exclude-all-hostkeys   ` - exclude all/hostkeys for this host
* `exclude-all-authkeys   ` - exclude all/authkeys for this host
* `exclude-all-shellscript` - exclude all/shellscript for this host
