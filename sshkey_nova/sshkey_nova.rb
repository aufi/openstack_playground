require 'fog/openstack'
require 'pp'

puts "Host: #{ENV['OPEN_STACK_HOST']}"
puts "Password: #{ENV['OPEN_STACK_PASSWORD']}"

service = Fog::Compute.new({
    :provider            => 'openstack',                                      # OpenStack Fog provider
    :openstack_auth_url  => "http://#{ENV['OPEN_STACK_HOST']}:5000/v2.0/tokens", # OpenStack Keystone endpoint
    :openstack_username  => 'admin',                                  # Your OpenStack Username
    :openstack_tenant    => 'admin',                                # Your tenant id
    :openstack_api_key   => ENV['OPEN_STACK_PASSWORD'],                              # Your OpenStack Password
    :connection_options  => {}                                                # Optional
})

# pp service.list_servers

# uuid = service.list_servers.body['servers'][0]['id']
# p uuid

# server = service.get_server_details(uuid)
# pp server

# pp service.key_pairs[0]


# ----- NEW KEYPAIR -----

Fog::Compute::OpenStack::KeyPair.new
