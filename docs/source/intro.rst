.. _introduction:

Introduction
~~~~~~~~~~~~

The *Kafka Plugin* installs `Apache Kafka <http://kafka.apache.org/>`_ and
`Apache ZooKeeper <https://zookeeper.apache.org/>`_ in a
Mirantis OpenStack (MOS) environment deployed by Fuel.
Apache Kafka is publish-subscribe messaging system. It is fast,
scalable and durable.

The *Kafka Plugin* is created for exchanging messages between various
components of StackLight and Ceilometer, but it is generic enough to
accommodate other usages.
Plugin provides fuel role *kafka*. Maximum node number is 5.
Recommended minimum is 3 nodes, odd number of nodes required for leader election.

Please refer to the `Kafka 1.0 documentation <http://kafka.apache.org/documentation.html>`_
 for more information.