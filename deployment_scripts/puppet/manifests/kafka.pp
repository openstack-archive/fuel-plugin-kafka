
mirror_url = “http://${master_ip}:8080/plugins/kafka-${plugin_version}/repositories/ubuntu”

class { ‘kafka’:
  version => ‘0.9.0.1’,
  scala_version => ‘2.11’,
  mirror_url => $mirror_url,
}