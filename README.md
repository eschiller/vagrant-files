vagrant-files
=============

Web dev environments with vagrant.

Will redirect dev VM port 80 to 8080 on localhost, and 443 to 8443 on local host.

To get this running, do the following:

 1. Install Vagrant and Virtualbox
 2. Add the hasicorp Ubuntu Precise 64 box with the command "vagrant add box hashicorp/precise64"
 3. Edit the Vagrantfile "puppet.manifest_file" param as needed (defaults to basic.pp). 

 
Currently basic.pp is the only provided manifest. The puppet defines in this file can be edited according to the settings defined by the puppetlabs-apache module, which is installed automatically.

The ./project folder is synced with /var/www/project on the guest to allow for quick transfer of code to the guest web server.
