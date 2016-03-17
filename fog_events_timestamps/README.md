Ceilometer events filtering doe snot work correctly propably
============================================================

Example:

```
$ bundle
$ bundle exec ruby metering_event_monitor_example.rb
== All events:
...
     <Fog::Metering::OpenStack::Event
    message_id="7b76e553-b804-4b67-9191-b9595b513e6e",
    event_type="floatingip.update.start",
    generated="2016-03-17T09:59:44.606000",
    raw={},
    traits=[{"type"=>"string", "name"=>"user_id",
"value"=>"8dabf4cf6cb24e58ba47a83ae65811a6"}, {"type"=>"string",
"name"=>"service",
"value"=>"network.dhcp-8-99-225.cloudforms.lab.eng.rdu2.redhat.com"},
{"type"=>"string", "name"=>"resource_id",
"value"=>"c0ac28bd-ab95-432a-a446-ac2b8bec5d6f"}, {"type"=>"string",
"name"=>"tenant_id", "value"=>"d3e8e3c7026441a98d15d348fd078cb1"},
{"type"=>"string", "name"=>"request_id",
"value"=>"req-a673e971-f1b3-4f59-b300-cc3c3d15329e"}, {"type"=>"string",
"name"=>"project_id", "value"=>"d3e8e3c7026441a98d15d348fd078cb1"}]
  >,   <Fog::Metering::OpenStack::Event
    message_id="8b4bcdb3-5519-459c-9545-aba0d5760a62",
    event_type="floatingip.update.end",
    generated="2016-03-17T09:59:45.150000",
    raw={},
    traits=[{"type"=>"string", "name"=>"user_id",
"value"=>"8dabf4cf6cb24e58ba47a83ae65811a6"}, {"type"=>"string",
"name"=>"service",
"value"=>"network.dhcp-8-99-225.cloudforms.lab.eng.rdu2.redhat.com"},
{"type"=>"string", "name"=>"resource_id",
"value"=>"c0ac28bd-ab95-432a-a446-ac2b8bec5d6f"}, {"type"=>"string",
"name"=>"tenant_id", "value"=>"d3e8e3c7026441a98d15d348fd078cb1"},
{"type"=>"string", "name"=>"request_id",
"value"=>"req-a673e971-f1b3-4f59-b300-cc3c3d15329e"}, {"type"=>"string",
"name"=>"project_id", "value"=>"d3e8e3c7026441a98d15d348fd078cb1"}]
  >]
== Latest event timestamp:
"2016-03-17T09:59:45.150000"
== Try to get new events (events generated after last query):
[{"field"=>"start_timestamp", "op"=>"gt",
"value"=>"2016-03-17T09:59:45.150000"}]
== This is the last one of previous query, looks that greater than query does
not work:
[  <Fog::Metering::OpenStack::Event
    message_id="8b4bcdb3-5519-459c-9545-aba0d5760a62",
    event_type="floatingip.update.end",
    generated="2016-03-17T09:59:45.150000",
    raw={},
    traits=[{"type"=>"string", "name"=>"user_id",
"value"=>"8dabf4cf6cb24e58ba47a83ae65811a6"}, {"type"=>"string",
"name"=>"service",
"value"=>"network.dhcp-8-99-225.cloudforms.lab.eng.rdu2.redhat.com"},
{"type"=>"string", "name"=>"resource_id",
"value"=>"c0ac28bd-ab95-432a-a446-ac2b8bec5d6f"}, {"type"=>"string",
"name"=>"tenant_id", "value"=>"d3e8e3c7026441a98d15d348fd078cb1"},
{"type"=>"string", "name"=>"request_id",
"value"=>"req-a673e971-f1b3-4f59-b300-cc3c3d15329e"}, {"type"=>"string",
"name"=>"project_id", "value"=>"d3e8e3c7026441a98d15d348fd078cb1"}]
  >]
```
