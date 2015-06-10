#! /bin/bash

echo Configuring Node as $1...
echo * Increasing File Limits
echo '
# Added by Vagrant Provisioning Script
# ulimit settings for Riak CS
root soft nofile 65536
root hard nofile 65536
riak soft nofile 65536
riak hard nofile 65536
riak-cs soft nofile 65536
riak-cs hard nofile 65336
stanchion soft nofile 65536
stanchion hard nofile 65536
'  >> /etc/security/limits.conf

echo * Riak
echo '
# Added by Vagrant Provisioning Script'  >> /etc/riak/riak.conf
echo "nodename = riak@$1" >> /etc/riak/riak.conf
echo "buckets.default.allow_mult = true" >> /etc/riak/riak.conf
echo '
%% Added by Vagrant Provisioning Script'  >> /etc/riak/advanced.config
echo '
[
 {riak_kv, [
              {add_paths, ["/usr/lib64/riak-cs/lib/riak_cs-2.0.0/ebin"]},
              {storage_backend, riak_cs_kv_multi_backend},
              {multi_backend_prefix_list, [{<<"0b:">>, be_blocks}]},
              {multi_backend_default, be_default},
              {multi_backend, [
                  {be_default, riak_kv_eleveldb_backend, [
                      {total_leveldb_mem_percent, 30},
                      {data_root, "/var/lib/riak/leveldb"}
                  ]},
                  {be_blocks, riak_kv_bitcask_backend, [
                      {data_root, "/var/lib/riak/bitcask"}
                  ]}
              ]}
  ]}
].
' >> /etc/riak/advanced.config

echo * Riak CS
echo '
# Added by Vagrant Provisioning Script' >> /etc/riak-cs/riak-cs.conf
echo "nodename = riak-cs@$1" >> /etc/riak-cs/riak-cs.conf
echo "listener = 0.0.0.0:8080" >> /etc/riak-cs/riak-cs.conf
echo "stanchion_host = 192.168.33.11:8085" >> /etc/riak-cs/riak-cs.conf

echo * Stanchion
echo '
# Added by Vagrant Provisioning Script' >> /etc/stanchion/stanchion.conf
echo "nodename = stanchion@$1" >> /etc/stanchion/stanchion.conf
echo "listener = $1:8085" >> /etc/stanchion/stanchion.conf

