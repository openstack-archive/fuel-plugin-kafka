# Copyright 2016 Mirantis, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

notice('kafka: firewall.pp')

$zookeeper_client_port       = hiera('zookeeper::config::client_port')
$zookeeper_election_port     = hiera('zookeeper::config::election_port')
$zookeeper_leader_port       = hiera('zookeeper::config::leader_port')
$kafka_port                  = hiera('kafka::port')
$kafka_jmx_port              = hiera('kafka::jmx_port')

class {'::firewall':}

firewall { '000 accept all icmp requests':
  proto  => 'icmp',
  action => 'accept',
}

firewall { '001 accept all to lo interface':
  proto   => 'all',
  iniface => 'lo',
  action  => 'accept',
}

firewall { '002 accept related established rules':
  proto  => 'all',
  state  => ['RELATED', 'ESTABLISHED'],
  action => 'accept',
}

firewall {'020 ssh':
  port   => 22,
  proto  => 'tcp',
  action => 'accept',
}

firewall { '100 zookeeper port':
  port   => $zookeeper_client_port,
  proto  => 'tcp',
  action => 'accept',
}

firewall { '102 zookeeper port':
  port   => $zookeeper_election_port,
  proto  => 'tcp',
  action => 'accept',
}

firewall { '103 zookeeper port':
  port   => $zookeeper_leader_port,
  proto  => 'tcp',
  action => 'accept',
}

firewall { '104 kafka port':
  port   => $kafka_port,
  proto  => 'tcp',
  action => 'accept',
}

firewall { '105 kafka port':
  port   => $kafka_jmx_port,
  proto  => 'tcp',
  action => 'accept',
}

firewall { '999 drop all other requests':
  proto  => 'all',
  chain  => 'INPUT',
  action => 'drop',
}
