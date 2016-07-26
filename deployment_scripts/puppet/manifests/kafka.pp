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

$deployment_id       = hiera('deployment_id')
$master_ip           = hiera('master_ip')
$uid                 = hiera('kafka::uid')
$heap_size           = hiera('kafka::jvm_heap_size')
$num_partitions      = hiera('kafka::num_partitions')
$replication_factor  = hiera('kafka::replication_factor')
$log_retention_hours = hiera('kafka::log_retention_hours')
$kafka_port          = hiera('kafka::port')
$kafka_jmx_port      = hiera('kafka::jmx_port')
$zookeeper_port      = hiera('zookeeper::config::client_port')
$kafka               = hiera_hash('kafka')
$plugin_version      = $kafka['metadata']['plugin_version']
$array_version       = split($plugin_version, '[.]')
$major_version       = "${$array_version[0]}.${$array_version[1]}"
$kafka_version       = '0.10.0.0'
$datastore           = hiera('kafka::data_dir')
$mirror_url          = "http://${master_ip}:8080/plugins/kafka-${major_version}/repositories/ubuntu"
$log_options         = '-Dlog4j.configuration=file:/opt/kafka/config/log4j.properties -Dkafka.logs.dir=/var/log/kafka'
$jmx_opts            = "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=${kafka_jmx_port}"

class { 'kafka':
  version       => $kafka_version,
  scala_version => '2.11',
  mirror_url    => $mirror_url,
}

class { 'kafka::broker':
  config     => {
    'broker.id'                     => $uid,
    'zookeeper.connect'             => "localhost:${zookeeper_port}",
    'inter.broker.protocol.version' => $kafka_version,
    'num.partitions'                => $num_partitions,
    'replication.factor'            => $replication_factor,
    'log.retention.hours'           => $log_retention_hours,
    'port'                          => $kafka_port,
    'log.dir'                       => "${datastore}/message-logs",
  },
  heap_opts  => "-Xmx${heap_size}G -Xms${heap_size}G",
  log4j_opts => $log_options
}

file { "${datastore}/message-logs":
  ensure  => directory,
  owner   => 'kafka',
  group   => 'kafka',
  mode    => '0644',
}

file { '/etc/logrotate.d/kafka.conf':
  ensure  => present,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => template('kafka_zookeeper/kafka_logrotate.conf.erb'),
}

file { '/etc/cron.hourly/logrotate':
  ensure => present,
  source => '/etc/cron.daily/logrotate',
}

