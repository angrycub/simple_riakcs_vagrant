#! /bin/bash

HOSTNAME=`ifconfig eth2| grep "inet addr" | awk '{print $2}' | awk -F":" '{print $2}'`
echo "== Provision xip.io name =="
echo "* Modifying RiakCS configuration"
echo "root_host = $HOSTNAME.xip.io" >> /etc/riak-cs/riak-cs.conf
echo "* Modifying .s3cfg"
mv /home/vagrant/.s3cfg /home/vagrant/.s3cfg.old
grep -v proxy /home/vagrant/.s3cfg.old > /home/vagrant/.s3cfg.tmp
echo "proxy_host = " >> /home/vagrant/.s3cfg.tmp
echo "proxy_port = 0" >> /home/vagrant/.s3cfg.tmp
sed "s/s3.amazonaws.com/$HOSTNAME.xip.io:8080/g" /home/vagrant/.s3cfg.tmp > /home/vagrant/.s3cfg
rm /home/vagrant/.s3cfg.tmp
chown vagrant:vagrant /home/vagrant/.s3cfg
echo "* Restarting Riak CS"
riak-cs stop
riak-cs start
s3cmd -c /home/vagrant/.s3cfg mb s3://config
s3cmd -c /home/vagrant/.s3cfg put -P /home/vagrant/.s3cfg s3://config/s3cfg
echo "++++  RiakCS should be available at http://$HOSTNAME.xip.io:8080 ++++"
echo "++++  Download the admin s3 configuration at http://config.$HOSTNAME.xip.io:8080/s3cfg ++++"
