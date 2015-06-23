#! /bin/bash

HOSTNAME=`ifconfig eth0| grep "inet addr" | awk '{print $2}' | awk -F":" '{print $2}'`
echo "== Provision xip.io name =="
echo "* Modifying RiakCS configuration"
echo "root_host = $HOSTNAME.xip.io" >> /etc/riak-cs/riak-cs.conf
echo "* Modifying .s3cfg"
mv /home/vagrant/.s3cfg /home/vagrant/.s3cfg.old
sed "s/s3.amazonaws.com/$HOSTNAME.xip.io/g" /home/vagrant/.s3cfg.old > /home/vagrant/.s3cfg
echo "* Restarting Riak CS"
riak-cs stop
riak-cs start
