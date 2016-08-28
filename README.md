# fakecloud

(aka 'homecloud')

`fakecloud` is a lightweight cloud-init metadata server that makes it easy
to run pre-built cloud OS images on plain old libvirt, without having to
install openstack or similar.

It serves the data that cloud-init expects to fetch from
http://169.254.169.254/

Run it on your VM host, and add an `iptables` rule to redirect cloud-init
requests to it. e.g. if `fakecloud` is running on localhost:3000:

   `iptables -t nat -I PREROUTING -d 169.254.169.254 -p tcp --dport 80 -j REDIRECT --to-port 3000`

**Features:**

* reads data about VM hosts from a text file called `./hosts.txt`.  Format is
   `vmname mac-address ip-address`
* sends gzip-compresssed multi-part MIME user-data with:
  * correct MIME Content-Type for text/cloud-config, text/x-shellscript
  * user-data common to all: `./userdata/all/*`
  * host-specific user-data: `./userdata/vmname/*`
  * default user-data for hosts without host-specific user-data: `./userdata/default/*`
  * optional separate files for userdata, ssh host keys, ssh auth keys, and
    shellscripts e.g. `./userdata/all/shellscript` or `./userdata/vmname/hostkeys`.

**Testing features:**

* outputs text/plain if the User-agent is Cloud-Init or Mojolicious (for command-line testing)
* outputs text/html otherwise for testing with a web browser
* allows `?host=` override in URLs to see what meta-data and user-data a VM would get without having to reboot that VM.

**Future plans:**

* get the data from an SQL database, using DBI to allow for Postgresql, SQLite, MySQL etc
* a web front end for editing VM host data
 
**Written with perl and Mojolicious**
