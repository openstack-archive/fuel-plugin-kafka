.. _limitations:

Limitations
~~~~~~~~~~~

The Kafka Plugin has the following limitations:

* Kafka supports authentication, encryption, and authorization. The current
  version of the plugin does not support any form of security, meaning that
  the Kafka cluster will be “open” on the management network.

* The Kafka Plugin will not expose configuration properties for all the broker
  configuration parameters. That is, the Kafka broker configuration set by the
  plugin will not be appropriate for every usage.