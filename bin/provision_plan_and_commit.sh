#! /bin/bash

echo "* Planning and committing membership changes"
riak-admin cluster plan
riak-admin cluster commit
