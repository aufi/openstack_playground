require 'fog/openstack'

KEYSTONE_URL = ''
PASSWORD     = ''

service = Fog::Metering::OpenStack.new({
  :openstack_auth_url  => KEYSTONE_URL,
  :openstack_username  => 'admin',
  :openstack_tenant    => nil,
  :openstack_api_key   => PASSWORD,
  :connection_options  => {}
})

puts "== All events:"

p all_events = service.events.sort_by(&:generated)

puts "== Latest event timestamp:"

p latest_event_timestamp = all_events.last.generated

puts "== Try to get new events (events generated after last query):"

p newer_than_query = [{
  'field' => 'start_timestamp',
 	'op'    => 'gt',  # problem: try ge/gt - behaves same
 	'value' => latest_event_timestamp
}]

puts "== This is the last one of previous query, looks that greater than query does not work:"

p new_events = service.list_events(newer_than_query).body.map{|ev| Fog::Metering::OpenStack::Event.new(ev)} # workaround since event filtering is not implemented in Fog now

