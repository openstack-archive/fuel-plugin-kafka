require 'spec_helper'

describe 'kafka::consumer', type: :class do
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
      service_config: {
        'topic'     => 'demo',
        'zookeeper' => 'localhost:2181',
      },
    }
  end

  it { is_expected.to contain_class('kafka::consumer::install').that_comes_before('Class[kafka::consumer::service]') }
  it { is_expected.to contain_class('kafka::consumer::service').that_comes_before('Class[kafka::consumer]') }
  it { is_expected.to contain_class('kafka::consumer') }

  context 'on Debian' do
    describe 'kafka::consumer::install' do
      context 'defaults' do
        it { is_expected.to contain_class('kafka') }
      end
    end

    describe 'kafka::consumer::service' do
      context 'defaults' do
        it { is_expected.to contain_file('/etc/init.d/kafka-consumer') }

        it { is_expected.to contain_service('kafka-consumer') }
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

    describe 'kafka::consumer::install' do
      context 'defaults' do
        it { is_expected.to contain_class('kafka') }
      end
    end

    describe 'kafka::consumer::service' do
      context 'defaults' do
        it { is_expected.to contain_file('/usr/lib/systemd/system/kafka-consumer.service').that_notifies('Exec[systemctl-daemon-reload]') }

        it {
          is_expected.to contain_file('/etc/init.d/kafka-consumer').with(
            ensure: 'absent',
          )
        }

        it { is_expected.to contain_exec('systemctl-daemon-reload').that_comes_before('Service[kafka-consumer]') }

        it { is_expected.to contain_service('kafka-consumer') }
      end
    end
  end
end
