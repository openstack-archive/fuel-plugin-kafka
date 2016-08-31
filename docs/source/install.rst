.. _installation:

Install the plugin
~~~~~~~~~~~~~~~~~~

To install the *Kafka Plugin*, you need to follow these steps.

#. Please refer to the :ref:`limitations` section before you proceed.

#. Download the plugin from the
   `Fuel Plugins Catalog <https://www.mirantis.com/products/openstack-drivers-and-plugins/fuel-plugins/>`_.

#. Copy the plugin's RPM file to the
   `Fuel Master node
   <http://docs.openstack.org/developer/fuel-docs/userdocs/fuel-install-guide/intro/intro_fuel_intro.html>`_
   with secure copy (scp)::

     # scp fuel-plugin-ceilometer-redis/kafka-0.1-0.1.0-1.noarch.rpm /
     root@:<the_Fuel_Master_node_IP address>:/tmp

#. Log into the Fuel Master node and install the plugin::

    # ssh root@:<the_Fuel_Master_node_IP address>
    [root@fuel-master ~]# cd /tmp
    [root@fuel-master ~]# fuel plugins --install kafka-0.1-0.1.0-1.noarch.rpm

#. Verify that the plugin is installed correctly::

    [root@fuel-master ~]# fuel plugins list
    id | name  | version | package_version | releases
    ---+-------+---------+-----------------+--------------------
    1  | kafka | 0.1.0   | 4.0.0           | ubuntu (mitaka-9.0)