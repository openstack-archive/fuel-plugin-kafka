.. _overview:

Overview
========

The *Kafka Plugin* installs `Apache Kafka <http://kafka.apache.org/>`_ and
`Apache ZooKeeper <https://zookeeper.apache.org/>`_ in a
Mirantis OpenStack (MOS) environment deployed by Fuel.
Apache Kafka is publish-subscribe messaging system. It is fast,
scalable and durable.

The *Kafka Plugin* is created for exchanging messages between various components of StackLight and Ceilometer, but it is generic enough to accommodate other usages.
Plugin provides fuel role *kafka*. Maximum node number is 5.
Recommended minimum is 3 nodes, odd number of nodes required for leader election.

Please refer to the `Kafka 0.10.0 documentation <http://kafka.apache.org/documentation.html>`_
 for more information.

Requirements
------------

======================= ================
Requirements            Version/Comment
======================= ================
MOS                     9.0
======================= ================

.. _limitations:

Limitations
-----------

* Kafka supports authentication, encryption and authorization. Current version of the
  plugin doesn't support any form of security, meaning that the Kafka cluster will be
  “open” on the management network. We plan to support some level of security in future
  versions of the plugin.

* Kafka Plugin will not expose configuration properties for all the broker configuration parameters.
  This means that the Kafka broker configuration set by the plugin will not be appropriate for every
  usage. In the future, we may make the Fuel plugin more configurable by adding new configuration
  properties.
