eums-provisioning
=================

Provisioning repo for the End User Monitoring System.

## Local Deployment

1. Install Vagrant.
2. Install VirtualBox.
3. Download the [Ubuntu 14.04 Vagrant box](https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box).
4. `vagrant box add eums /path/to/downloaded/box`
5. `cd /path-to-project-root/vagrant`
6. `vagrant up`
7. EUMS will be running locally at `127.0.0.1:8080`

## Main Deployment

See the [Deployment Guide](https://github.com/unicefuganda/eums/wiki/Deployment-Guide).
