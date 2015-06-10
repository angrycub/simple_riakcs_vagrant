#! /bin/bash

echo "* Joining to node1.local(192.168.33.11)"
echo "  THIS WILL NOT BE COMPLETE UNTIL PLAN AND COMMIT IS RUN"
riak-admin cluster join riak@192.168.33.11
