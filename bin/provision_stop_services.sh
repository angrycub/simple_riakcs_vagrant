#! /bin/bash

echo "Stopping Services..."
echo "* Riak CS"
riak-cs stop
echo "* Stanchion"
stanchion stop
echo "* Riak"
riak stop