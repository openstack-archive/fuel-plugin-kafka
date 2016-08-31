.. _configure_plugin:

Configure the plugin
~~~~~~~~~~~~~~~~~~~~

Once the *Kafka Plugin* is installed following the instructions of
the :ref:`Installation Guide`, you can add Kafka nodes to new or
existing Mirantis OpenStack (MOS) environment.

To use the *Kafka Plugin*, you need to add nodes with Kafka role `Add a node to an OpenStack environment
<http://docs.openstack.org/developer/fuel-docs/userdocs/fuel-user-guide/configure-environment/add-nodes.html>`_.

1. Make sure that the plugin is properly installed on the Fuel Master node.

   Go to the *Plugins* tab. You should see the following:

   .. image:: images/plugins-list.png
    :width: 100%

2. Enable the plugin. You can configure additional setting on this step.

   Go to the *Environments* tab and select the *The Apache Kafka Message Broker Plugin* checkbox:

   .. image:: images/settings.png
    :width: 100%


3.  Add nodes to your environment and assign the **Kafka** role.

   .. note:: When `adding nodes
      <http://docs.openstack.org/developer/fuel-docs/userdocs/fuel-user-guide/configure-environment/add-nodes.html>`_
      to the environment and `assign or change a role
      <http://docs.openstack.org/developer/fuel-docs/userdocs/fuel-user-guide/configure-environment/change-roles.html>`_,
      do not forget to use an odd number of nodes as recommended in :ref:`overview` section.

  .. image:: images/assign-role.png
    :width: 100%

4. `Verify your network configuration
   <http://docs.openstack.org/developer/fuel-docs/userdocs/fuel-user-guide/configure-environment/verify-networks.html>`_.

5. `Deploy your changes
   <http://docs.openstack.org/developer/fuel-docs/userdocs/fuel-user-guide/deploy-environment.html>`_
   once you are done with the configuration of your environment.