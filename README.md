# Vagrant Riak CS Cluster

This is a Vagrant project using shell-script provisioning to bring up a local [Riak
CS](https://github.com/basho/riak_cs) cluster. Each node runs 
`CentOS 6.5` 64-bit with `1024MB` of RAM by default.

## Description 

This repository is **community supported**. We both appreciate and need your
contribution to keep it stable. For more on how to contribute,
[take a look at the contribution process](#contribution).

Thank you for being part of the community! We love you for it.

## Configuration

### Install Vagrant

Download and install Vagrant via the
[Vagrant installer](http://downloads.vagrantup.com/).


### Clone repository

``` bash
$ git clone https://github.com/angrycub/simple_riakcs_vagrant.git
$ cd simple_riakcs_vagrant
```

### Launch cluster

``` bash
$ vagrant up
```
<!--
### Environmental variables

- `RIAK_CS_CREATE_ADMIN_USER` – A flag signaling whether you want an
  administrative user for Riak CS to be created for you (default: `true`)
-->
### Test cluster

\<\<TODO>> The provisioning script will create an .s3cfg file in the **vagrant** user's home directory with the correct settings for this cluster's Riak CS configuration.  The changes are described below:

* **Access Key** - Replaced with generated values from provisioning.
* **Secret Key** - Replaced with generated values from provisioning
* **Proxy Server**: `localhost`
* **Proxy Port**: `8080`
* **signature_v2**: `True` - `s3cmd` defaults to AWS v4 authentication, whereas Riak CS does not support this yet.  See also
[issue 897](https://github.com/basho/riak_cs/issues/897).

The following command can be used to test the configuration:

``` bash
$ s3cmd mb s3://test-bucket
```

## Contribution

Basho Labs repos survive because of community contribution. Here’s how to get started.

* Fork the appropriate sub-projects that are affected by your change
* Create a topic branch for your change and checkout that branch
     `git checkout -b some-topic-branch`
* Make your changes and run the test suite if one is provided (see below)
* Commit your changes and push them to your fork
* Open a pull request with a descriptive title
* Maintainers will review your pull request, suggest changes, and merge it when it’s ready and/or offer feedback
* To report a bug or issue, please open a new issue against this repository

You can [read the full guidelines for bug reporting and code contributions](http://docs.basho.com/riak/latest/community/bugs/) on the Riak Docs. And **thank you!** Your contribution is incredible important to us.
