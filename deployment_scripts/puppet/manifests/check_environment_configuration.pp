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

notice('fuel-plugin-kafka: check_environment_configuration.pp')

# Check that JVM size doesn't exceed the physical RAM size
$kafka_heap       = hiera('kafka::kafka_jvm_heap_size')
$zookeeper_heap   = hiera('kafka::zookeeper_jvm_heap_size')

$total_heap_mb = ($kafka_heap + 0.0) * 1024 + ($zookeeper_heap + 0.0) * 1024

if $total_heap_mb >= $::memorysize_mb {
  fail("The configured JVM size for Kafka (${kafka_heap} GB) and Zookeeper (${zookeeper_heap} GB) in total is greater than the system RAM (${::memorysize}).")
}