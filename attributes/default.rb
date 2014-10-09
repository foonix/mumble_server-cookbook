# encoding: UTF-8

default['mumble_server']['packages'] = %w(mumble-server)
case node['platform']
when 'centos', 'redhat', 'fedora', 'amazon', 'scientific'
  default['mumble_server']['service_name'] = 'murmur'
  default['mumble_server']['service_supports'] =
    Mash.new(restart: true, reload: false, status: true)
else
  default['mumble_server']['service_name'] = 'mumble-server'
  default['mumble_server']['service_supports'] =
    Mash.new(restart: true, reload: false, status: false)
end
default['mumble_server']['config_file'] = '/etc/murmur/murmur.ini'
default['mumble_server']['pid_file'] =
  '/var/run/mumble-server/mumble-server.pid'
default['mumble_server']['user'] = 'mumble-server'
default['mumble_server']['group'] = node['mumble_server']['user']
