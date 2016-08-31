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
|                      |environment and other factors like the retention       |
|                      |policy. The JVM Heap size is configurable through the  |
|                      |plugin UI. Provide at least 1 GB for Kafka and 1 GB for|
|                      |ZooKeeper. An average setup would require a quad-core  |
|                      |server with 8 GB and 2 GB of RAM accordingly and access|
|                      |to a 150-200 IOPS disk.                                |
+----------------------+-------------------------------------------------------+