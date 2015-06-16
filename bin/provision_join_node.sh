#! /bin/bash

echo "* Joining to riak@$1"
echo "  THIS WILL NOT BE COMPLETE UNTIL PLAN AND COMMIT IS RUN"
riak-admin cluster join riak@$1
