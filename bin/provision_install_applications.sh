#! /bin/bash

echo "Installing Applications..."

echo "* Checking for cached components"
if [ ! -f "/vagrant_data/riak-2.0.5-1.el6.x86_64.rpm" ] 
  then
    echo "   - Downloading Riak 2.0.5 Package into cache"
    wget -q --output-document=/vagrant_data/riak-2.0.5-1.el6.x86_64.rpm http://s3.amazonaws.com/downloads.basho.com/riak/2.0/2.0.5/rhel/6/riak-2.0.5-1.el6.x86_64.rpm 
fi

if [ ! -f "/vagrant_data/riak-cs-2.0.1-1.el6.x86_64.rpm" ] 
  then
    echo "   - Downloading Riak CS 2.0.1 Package into cache"
    wget -q --output-document=/vagrant_data/riak-cs-2.0.1-1.el6.x86_64.rpm http://s3.amazonaws.com/downloads.basho.com/riak-cs/2.0/2.0.1/rhel/6/riak-cs-2.0.1-1.el6.x86_64.rpm 
fi

if [ ! -f "/vagrant_data/stanchion-2.0.0-1.el6.x86_64.rpm" ] 
  then
    echo "   - Downloading Stanchion 2.0.0 Package into cache"
    wget -q --output-document=/vagrant_data/stanchion-2.0.0-1.el6.x86_64.rpm http://s3.amazonaws.com/downloads.basho.com/stanchion/2.0/2.0.0/rhel/6/stanchion-2.0.0-1.el6.x86_64.rpm
fi


echo "* Installing Riak, Stanchion, Riak CS"
yum -y --nogpgcheck --noplugins -q localinstall \
 /vagrant_data/riak-2.0.5-1.el6.x86_64.rpm \
 /vagrant_data/riak-cs-2.0.1-1.el6.x86_64.rpm \
 /vagrant_data/stanchion-2.0.0-1.el6.x86_64.rpm

echo "* Installing s3cmd"
cp /vagrant_data/s3tools.repo /etc/yum.repos.d
yum -y -q install s3cmd

echo "* Installing jq"
cp /vagrant_data/jq /usr/local/bin
chmod +x /usr/local/bin/jq

date > /etc/vagrant_provisioned_at
