irb(main):001:0> ems = ManageIQ::Providers::Openstack::CloudManager.first
  ManageIQ::Providers::Openstack::CloudManager Load (0.6ms)  SELECT  "ext_management_systems".* FROM "ext_management_systems" WHERE "ext_management_systems"."type" IN ('ManageIQ::Providers::Openstack::CloudManager')  ORDER BY "ext_management_systems"."id" ASC LIMIT 1
  ManageIQ::Providers::Openstack::CloudManager Inst Including Associations (27.1ms - 1rows)
=> #<ManageIQ::Providers::Openstack::CloudManager id: 1, name: "openstack_kilo", port: "5000", hostname: "10.8.99.233", ipaddress: nil, created_on: "2015-11-20 08:40:18", updated_on: "2015-12-02 13:52:23", guid: "54523294-8f62-11e5-8196-02420bd2c3fb", zone_id: 1, type: "ManageIQ::Providers::Openstack::CloudManager", api_version: "v2", uid_ems: nil, host_default_vnc_port_start: nil, host_default_vnc_port_end: nil, provider_region: nil, last_refresh_error: nil, last_refresh_date: "2015-12-02 13:52:23", provider_id: nil, security_protocol: nil, realm: nil, tenant_id: 1, project: nil>
irb(main):002:0> ManageIQ::Providers::Openstack::CloudManager::AuthKeyPair.create_keypair(ems, "testkaypairmiq", "KEEY")
  Authentication Load (0.3ms)  SELECT "authentications".* FROM "authentications" WHERE "authentications"."resource_id" = $1 AND "authentications"."resource_type" = $2  [["resource_id", 1], ["resource_type", "ExtManagementSystem"]]
  Authentication Inst Including Associations (30.8ms - 3rows)
MiqException::MiqOpenstackApiRequestError: Expected(200) <=> Actual(400 Bad Request)
excon.error.response
  :body          => "{\"badRequest\": {\"message\": \"Keypair data is invalid: failed to generate fingerprint\", \"code\": 400}}"
  :headers       => {
    "Content-Length"       => "99"
    "Content-Type"         => "application/json; charset=UTF-8"
    "Date"                 => "Wed, 02 Dec 2015 15:33:16 GMT"
    "X-Compute-Request-Id" => "req-5231b427-1948-4528-86f0-48761c2babc7"
  }
  :local_address => "10.34.131.123"
  :local_port    => 57900
  :reason_phrase => "Bad Request"
  :remote_ip     => "10.8.99.233"
  :status        => 400
  :status_line   => "HTTP/1.1 400 Bad Request\r\n"
# ...stacktrace...
irb(main):003:0> ManageIQ::Providers::Openstack::CloudManager::AuthKeyPair.create_keypair(ems, "testkaypairmiq", "ssh-rsa AAAAB3NzaC1yc2xG57KrUmCQPSaMjHw76xkuVtV8WcWUfTYL0sLYb140df9BXRYOwPUBCXUyOV8r6Y1JPdL65AOTXeCaKFi1dAdAy8XDwAXYsJyVlI2S9Wv52oBAmjKSr1CaJRtTjTQGrA3DehBTKsrQe1o3guarzNQQvG617ecMeWZx4zZFxa5f5iR82QRYRMcHFaUn4jo3DtLnYAY9rANPdoZG32T4VYbCn/zh9OYwikSPjYjp99eQMC5+8UQoaWN3fQkG4J6jr/xSp8rfLma+Ix9KW4mArQCl1ireyzA7UqTwqGC+Br4N4GLspRZtUaNqPItkKVL8+A1N")
=>   <Fog::Compute::OpenStack::KeyPair
    name="testkaypairmiq",
    fingerprint="c9:d1:fa:1f:00:88:0a:aa:05:db:03:81:ef:7f:fb:8f",
    public_key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwCb14WQi/8l61+KrVvixG57KrUmCQPSaMjHw76xkuVtV8WcWUfTYL0sLYb140df9BXRYOwPUBCXUyOV8r6Y1JPdL65AOTXeCaKFi1dAdAy8XDwAXYsJyVlI2S9Wv52oBAmjKSr1CaJRtTjTQGrA3DehBTKsrQe1o3guarzNQQvG617ecMeWZx4zZFxa5f5iR82QRYRMcHFaUn4jo3DtLnYAY9rANPdoZG32T4VYbCn/zh9OYwikSPjYjp99eQMC5+8UQoaWN3fQkG4J6jr/xSp8rfLma+Ix9KW4mArQCl1ireyzA7UqTwqGC+Br4N4GLspRZtUaNqPItkKVL8+A1N",
    private_key=nil,
    user_id="43c5e7ae4cd4416b8651a08b2c108652",
    id=nil
  >
irb(main):004:0> ManageIQ::Providers::Openstack::CloudManager::AuthKeyPair.find_by_name('testkaypairmiq').delete_keypair(ems)
r.send(:get_key_pairs)
  ManageIQ::Providers::Openstack::CloudManager::AuthKeyPair Load (0.3ms)  SELECT  "authentications".* FROM "authentications" WHERE "authentications"."type" IN ('ManageIQ::Providers::Openstack::CloudManager::AuthKeyPair') AND "authentications"."name" = $1 LIMIT 1  [["name", "testkaypairmiq"]]
  ManageIQ::Providers::Openstack::CloudManager::AuthKeyPair Inst Including Associations (0.1ms - 1rows)
  Authentication Load (0.3ms)  SELECT "authentications".* FROM "authentications" WHERE "authentications"."resource_id" = $1 AND "authentications"."resource_type" = $2  [["resource_id", 1], ["resource_type", "ExtManagementSystem"]]
  Authentication Inst Including Associations (6.3ms - 4rows)
=> nil

# refresher - fetch keys
r = ManageIQ::Providers::Openstack::CloudManager::RefreshParser.new(ems)
