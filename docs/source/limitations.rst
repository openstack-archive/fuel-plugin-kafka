.. _limitations:

Limitations
~~~~~~~~~~~

* Kafka supports authentication, encryption and authorization. Current version of the
  plugin doesn't support any form of security, meaning that the Kafka cluster will be
  “open” on the management network.

* Kafka Plugin will not expose configuration properties for all the broker configuration parameters.
  This means that the Kafka broker configuration set by the plugin will not be appropriate for every
  usage.