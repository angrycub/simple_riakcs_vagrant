#! /bin/bash

echo "Creating Admin User..."
echo "* Stopping Riak CS"
riak-cs stop
echo "* Enabling Anonymous User Creation"
echo "anonymous_user_creation = on" >> /etc/riak-cs/riak-cs.conf
echo "* Starting Riak CS"
riak-cs start
echo "* Making User"
curl -s -XPOST http://127.0.0.1:8080/riak-cs/user \
     -H 'Content-Type: application/json' \
     -d '{"email":"admin@admin.com", "name":"admin"}' > /vagrant_data/work/admin.json
echo "* Stopping Riak CS"
riak-cs stop
echo "* Disabling Anonymous User Creation"
grep -v "anonymous_user_creation = on" /etc/riak-cs/riak-cs.conf >> /etc/riak-cs/riak-cs.conf.2
mv /etc/riak-cs/riak-cs.conf.2 /etc/riak-cs/riak-cs.conf
echo "* Restarting Riak CS"
riak-cs start