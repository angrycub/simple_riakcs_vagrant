#! /bin/bash

echo "Starting Services..."
echo "* Riak"
riak start
echo "    - Waiting for KV to come up" 
riak-admin wait-for-service riak_kv
echo "* Stanchion"
stanchion start
echo "* Riak CS"
riak-cs start