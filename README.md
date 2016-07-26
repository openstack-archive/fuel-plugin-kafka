Kafka plugin
=======================

The *Kafka Plugin* installs [Apache Kafka](http://kafka.apache.org) and
[Apache ZooKeeper](https://zookeeper.apache.org) in a
Mirantis OpenStack (MOS) environment deployed by Fuel.

Please go to the [Kafka Plugin Documentation](
http://fuel-plugin-kafka.readthedocs.org/en/latest/index.html)
to getting started.


Building the plugin
-------------------

1. Clone the fuel-plugin repo:

    ``git clone https://review.openstack.org/openstack/fuel-plugin-kafka``

2. Install the Fuel Plugin Builder:

    ``pip install fuel-plugin-builder``

3. Build Kafka Fuel plugin:

   ``fpb --build fuel-plugin-kafka/``

4. The kafka-&lt;x.x.x&gt;.rpm plugin package will be created in the plugin folder
   (fuel-plugin-kafka/).


Limitations
-----------

All known limitations are described in the [Limitations](
http://fuel-plugin-elasticsearch-kibana.readthedocs.org/en/latest/description.html#limitations)
section of the plugin documentation.

Installation
------------

The installation instructions are provided in the [Installation](
http://fuel-plugin-kafka.readthedocs.org/en/latest/installation.html)
section of the plugin documentation.

User Guide
----------

Instructions for how to configure and use the Kafka Plugin
are provided in the [User Guide](
http://fuel-plugin-kafka.readthedocs.org/en/latest/guide.html)
section of the plugin documentation.

