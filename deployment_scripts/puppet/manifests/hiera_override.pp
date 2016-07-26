# Copyright 2015 Mirantis, Inc.
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

notice('fuel-plugin-kafka: hiera_override.pp')

# Initialize network-related variables
$network_scheme   = hiera_hash('network_scheme')
$network_metadata = hiera_hash('network_metadata')
prepare_network_config($network_scheme)

$kafka = hiera_hash('kafka')
$hiera_file           = '/etc/hiera/plugins/kafka.yaml'
$kafka_nodes             = get_nodes_hash_by_roles($network_metadata, ['kafka', 'primary-kafka'])
$kafka_nodes_count       = count($kafka_nodes)

$listen_address       = get_network_role_property('management', 'ipaddr')
$kafka_addresses_map     = get_node_to_ipaddr_map_by_network_role($kafka_nodes, 'management')
$kafka_ip_addresses      = sort(values($kafka_addresses_map))
$uid = $kafka_nodes[$hostname]['uid']

notice("kafka_addresses_map: ${kafka_addresses_map}")

if is_integer($kafka["replication_factor"]) and $kafka["replication_factor"] <= $kafka_nodes_count {
  $replication_factor = $kafka["replication_factor"]
}else{
  $replication_factor = $kafka_nodes_count
}
notice("Set replication factor to ${replication_factor}")

$calculated_content = inline_template('
---
kafka::kafka_jvm_heap_size: <%= @kafka["kafka_jvm_heap_size"] %>
kafka::zookeeper_jvm_heap_size: <%= @kafka["zookeeper_jvm_heap_size"] %>
kafka::num_partitions: <%= @kafka["num_partitions"] %>
kafka::replication_factor: <%= @replication_factor %>
kafka::log_retention_hours: <%= @kafka["log_retention_hours"] %>
kafka::kafka_nodes_count: <%= @kafka_nodes_count %>
kafka::uid: <%= @uid %>
kafka::nodes:
<% @kafka_ip_addresses.each do |x| -%>
    - "<%= x %>"
<% end -%>
kafka::addresses_map:
<% @kafka_addresses_map.each do |k,v| -%>
    <%= k %>: "<%= v %>"
<% end -%>
')

file { $hiera_file:
  ensure  => file,
  content => $calculated_content,
}
