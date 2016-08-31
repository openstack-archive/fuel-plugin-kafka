.. _introduction:

Introduction
~~~~~~~~~~~~

The *Kafka Plugin* installs `Apache Kafka <http://kafka.apache.org/>`_ and
`Apache ZooKeeper <https://zookeeper.apache.org/>`_ in a
Mirantis OpenStack (MOS) environment deployed by Fuel.
Apache Kafka is a publish-subscribe messaging system. It is fast,
scalable and durable.

The *Kafka Plugin* is created for exchanging messages between various
components of StackLight and Ceilometer, but it is generic enough to
accommodate other usages.
The Plugin implements the *Kafka* Fuel role. The maximum number of nodes for
the *Kafka* Fuel role is 5. To support high-availability, the minimum number
of nodes is 3. You need to have an initial odd number of nodes to comply with
the leader election process constraints.

Please refer to the `Kafka 0.10.0 documentation <http://kafka.apache.org/documentation.html>`_
 for more information.