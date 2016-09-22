.. _configuration:

Configure the plugin
~~~~~~~~~~~~~~~~~~~~

Once installed, configure the Kafka Plugin and add nodes with the **Kafka**
role to a new or existing Mirantis OpenStack environment.

**To configure the plugin:**

#. Log in to the Fuel web UI.
#. Verify that the Kafka Plugin is listed in the :guilabel:`Plugins` tab:

   .. image:: images/plugins-list.png
      :width: 450pt

#. `Create a new environment <http://docs.openstack.org/developer/fuel-docs/userdocs/fuel-user-guide/create-environment/start-create-env.html>`_
   or use an existing one.

#. To enable the plugin and configure additional settings, navigate to the
   :guilabel:`Environments` tab and select the
   :guilabel:`The Apache Kafka Message Broker Plugin` checkbox:

   .. image:: images/settings.png
      :width: 450pt

#.  Add nodes to your environment and assign the **Kafka** role to these nodes.

   .. note:: When `adding nodes
      <http://docs.openstack.org/developer/fuel-docs/userdocs/fuel-user-guide/configure-environment/add-nodes.html>`_
      to the environment and `assigning or changing a role
      <http://docs.openstack.org/developer/fuel-docs/userdocs/fuel-user-guide/configure-environment/change-roles.html>`_,
      do not forget to use an odd number of nodes as recommended in the
      :ref:`requirements` section.

   .. image:: images/assign-role.png
      :width: 450pt

4. `Verify your network configuration
   <http://docs.openstack.org/developer/fuel-docs/userdocs/fuel-user-guide/configure-environment/verify-networks.html>`_.

5. `Deploy your environment
   <http://docs.openstack.org/developer/fuel-docs/userdocs/fuel-user-guide/deploy-environment.html>`_.