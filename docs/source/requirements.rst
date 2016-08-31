.. _requirements:

Requirements
~~~~~~~~~~~~

.. tabularcolumns:: |p{4cm}|p{12.5cm}|

+----------------------+-------------------------------------------------------+
|**Requirement**       |**Version/Comment**                                    |
+======================+=======================================================+
|Mirantis OpenStack    |9.x                                                    |
+----------------------+-------------------------------------------------------+
|Disk space            |Provide at least 50 GB of disk space. The disk space   |
|                      |depends on the environment size, replication settings, |
|                      |and data retention.                                    |
+----------------------+-------------------------------------------------------+
|Hardware requirements |The hardware configuration (RAM, CPU, disk(s)) required|
|                      |by this plugin depends on the size of your cloud       |
|                      |environment and other factors like the replication     |
|                      |factor and retention policy for Kafka queues.          |
|                      |The JVM Heap size is configurable through the plugin   |
|                      |UI. Provide at least 8 GB for the JVM heap size of     |
|                      |Kafka. For an intensive workload, you should provide   |
|                      |16GB of RAM for the JVM heap size of Kafka and 5 GB of |
|                      |RAM for the JVM heap size of Zookeeper. An average     |
|                      |setup would require a quad-core server with at least   |
|                      |8 GB of RAM for Kafka and 3GB for Zookeeper and access |
|                      |to a 500+ IOPS disk.                                   |
+----------------------+-------------------------------------------------------+