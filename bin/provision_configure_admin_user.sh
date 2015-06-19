#! /bin/bash

echo "Configuring Admin User..."

echo "* Configuring Riak CS"
echo "admin.key = `/usr/local/bin/jq -r .key_id /vagrant_data/work/admin.json`" >> /etc/riak-cs/riak-cs.conf
echo "admin.secret = `/usr/local/bin/jq -r .key_secret /vagrant_data/work/admin.json`" >> /etc/riak-cs/riak-cs.conf

echo "* Configuring Stanchion"
echo "admin.key = `/usr/local/bin/jq -r .key_id /vagrant_data/work/admin.json`" >> /etc/stanchion/stanchion.conf
echo "admin.secret = `/usr/local/bin/jq -r .key_secret /vagrant_data/work/admin.json`" >> /etc/stanchion/stanchion.conf

echo "* Configuring s3cmd"
cat /vagrant_data/s3cfg.template | 
    sed "s/{{admin_key}}/`/usr/local/bin/jq -r .key_id /vagrant_data/work/admin.json`/" | 
    sed "s/{{admin_secret}}/`/usr/local/bin/jq -r .key_secret /vagrant_data/work/admin.json`/" > /home/vagrant/.s3cfg
chown vagrant:vagrant /home/vagrant/.s3cfg

echo "* Configuring s3curl"
cat /vagrant_data/s3curl.template | 
    sed "s/{{admin_key}}/`/usr/local/bin/jq -r .key_id /vagrant_data/work/admin.json`/" | 
    sed "s/{{admin_secret}}/`/usr/local/bin/jq -r .key_secret /vagrant_data/work/admin.json`/" > /home/vagrant/.s3curl
chown vagrant:vagrant /home/vagrant/.s3curl
chmod 600 /home/vagrant/.s3curl
