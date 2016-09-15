.. _installation:

Install the plugin
~~~~~~~~~~~~~~~~~~

Before you proceed with installing the plugin, see the :ref:`limitations`
section.

**To install the Kafka Plugin:**

#. Download the plugin from the
   `Fuel Plugins Catalog <https://www.mirantis.com/products/openstack-drivers-and-plugins/fuel-plugins/>`_.

#. Copy the plugin's RPM file to the
   `Fuel Master node
   <http://docs.openstack.org/developer/fuel-docs/userdocs/fuel-install-guide/intro/intro_fuel_intro.html>`_
   using the secure copy :command:`scp` command:
   
   .. code-block:: console

      # scp fuel-plugin-ceilometer-redis/kafka-1.0-0.1.0-1.noarch.rpm /
      root@:<the_Fuel_Master_node_IP address>:/tmp

#. Log in to the Fuel Master node:

   .. code-block:: console

      # ssh root@:<the_Fuel_Master_node_IP address>

#. Install the plugin:

   .. code-block:: console

      [root@fuel-master ~]# cd /tmp
      [root@fuel-master ~]# fuel plugins --install kafka-1.0-0.1.0-1.noarch.rpm

#. Verify that the plugin is installed correctly:

   .. code-block:: console

      [root@fuel-master ~]# fuel plugins list
      id | name  | version | package_version | releases
      ---+-------+---------+-----------------+--------------------
      1  | kafka | 1.0.0   | 4.0.0           | ubuntu (mitaka-9.0)