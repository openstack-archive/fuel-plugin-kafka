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

notice('fuel-plugin-kafka: kafka.pp')

$deployment_id = hiera('deployment_id')
$master_ip = hiera('master_ip')

# TODO compute, not hardcode
$plugin_version = '0.1'
$kafka_version = '0.10.0.0'

$mirror_url = "http://${master_ip}:8080/plugins/kafka-${plugin_version}/repositories/ubuntu"

class { 'kafka':
  version => $kafka_version,
  scala_version => '2.11',
  mirror_url => $mirror_url,
}

class { 'kafka::broker':
  config => {
    'broker.id' => '0',
    'zookeeper.connect' => 'localhost:2181',
    'inter.broker.protocol.version' => $kafka_version,
  }
}
