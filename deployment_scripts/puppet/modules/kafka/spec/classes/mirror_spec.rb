require 'spec_helper'

describe 'kafka::mirror', type: :class do
  let :facts do
    {
      osfamily: 'Debian',
      operatingsystem: 'Ubuntu',
      operatingsystemrelease: '14.04',
      lsbdistcodename: 'trusty',
      architecture: 'amd64',
      service_provider: 'upstart',
    }
  end

  let :params do
    {
      consumer_config: {
        'group.id'          => 'kafka-mirror',
        'zookeeper.connect' => 'localhost:2181',
      },
      producer_config: {
        'bootstrap.servers' => 'localhost:9092',
      },
    }
  end

  it { is_expected.to contain_class('kafka::mirror::install').that_comes_before('Class[kafka::mirror::config]') }
  it { is_expected.to contain_class('kafka::mirror::config').that_comes_before('Class[kafka::mirror::service]') }
  it { is_expected.to contain_class('kafka::mirror::service').that_comes_before('Class[kafka::mirror]') }
  it { is_expected.to contain_class('kafka::mirror') }

  context 'on Debian' do
    describe 'kafka::mirror::install' do
      context 'defaults' do
        it { is_expected.to contain_class('kafka') }
      end
    end

    describe 'kafka::mirror::config' do
      context 'defaults' do
        it { is_expected.to contain_class('kafka::producer::config') }
      end
    end

    describe 'kafka::mirror::service' do
      context 'defaults' do
        it { is_expected.to contain_file('/etc/init.d/kafka-mirror') }

        it { is_expected.to contain_service('kafka-mirror') }
      end
    end
  end

  context 'on CentOS' do
    let :facts do
      {
        osfamily: 'RedHat',
        operatingsystem: 'CentOS',
        operatingsystemrelease: '7',
        operatingsystemmajrelease: '7',
        architecture: 'amd64',
        path: '/usr/local/sbin',
        service_provider: 'systemd',
      }
    end

    describe 'kafka::mirror::install' do
      context 'defaults' do
        it { is_expected.to contain_class('kafka') }
      end
    end

    describe 'kafka::mirror::config' do
      context 'defaults' do
        it { is_expected.to contain_class('kafka::producer::config') }
      end
    end

    describe 'kafka::mirror::service' do
      context 'defaults' do
        it { is_expected.to contain_file('/usr/lib/systemd/system/kafka-mirror.service').that_notifies('Exec[systemctl-daemon-reload]') }

        it {
          is_expected.to contain_file('/etc/init.d/kafka-mirror').with(
            ensure: 'absent',
          )
        }

        it { is_expected.to contain_exec('systemctl-daemon-reload').that_comes_before('Service[kafka-mirror]') }

        it { is_expected.to contain_service('kafka-mirror') }
      end
    end
  end
end
