.. _verify_plugin:

Verify the plugin
~~~~~~~~~~~~~~~~~

#. On the Fuel Master node, find the IP address of a node where the
   Kafka is installed using the :command:`fuel nodes` command:

   .. code-block:: console

    [root@fuel ~]# fuel nodes
    id|status|name            |cluster|ip  |mac |roles               |
    --|------|----------------|-------|----|-------------------------|
    1 |ready |Untitled (fa:87)| 1     |... |... |kafka               |
    2 |ready |Untitled (12:aa)| 1     |... |... |kafka               |
    3 |ready |Untitled (4e:6e)| 1     |... |... |kafka               |


#. Log in to any of these nodes using SSH, for example, to ``node-1``.
#. Run the following command:

   .. code-block:: console

    root@node-1:~# netstat -ntpl | grep java
    tcp6       0      0 :::9092                 :::*                    LISTEN      14702/java
    tcp6       0      0 :::2181                 :::*                    LISTEN      9710/java
    tcp6       0      0 :::9990                 :::*                    LISTEN      14702/java

   You will see that Kafka and Zookeeper are running and listening theirs ports:
   2181 - Zookeeper, 9092 and 9990 - Kafka.

#. Additionally you can test sending/receiving messages with instructions on `Quick Start Guide (Step 3 - Step 5) <http://kafka.apache.org/documentation.html#quickstart>`_