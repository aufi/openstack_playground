Openstack in lab connection
===========================

I need connect to both undercloud and overcloud of instack in lab from local computer (ManageIQ). I had issues with OpenVPN setup (lack of my knowledge), ssh port forwarding would be not nice (too many ports to forward), but there is a "middle way" solution - [sshuttle](https://github.com/sshuttle/sshuttle).

Setup ssh connection
-----------------------

Prepare ssh config to connect to instack machine.

```
# ~/.ssh/config
Host instack.lab
  User stack
  Hostname 192.168.122.xxx
  ProxyCommand ssh stack@lab nc %h %p

Host lab
  Hostname dell-t5810ws-...
  User root
```

Prepare ssh pubkeys to make connection possible without passwords.

```
# 1. put your local pubkey to authorized_keys to stack@lab, stack@instack
# 2. (?) put stack@lab pubkey to stack@instack authorized_keys
```

Connect with sshuttle
---------------------

```
# pip install sshuttle
```

```
$ sshuttle -r instack.lab -N -v
```

You can omit -v to dont see TCP connections. Parameter -N scans available subnets to be forwarded.

Enjoy connection to openstack
---------------------------

Test keystone access (port 5000) or horizon on port 80

Note: ping is too low level, will not work

Known sshuttle issues
---------------------

 * It might be a dirty solution.
 * Requires python (no problem).
 * Lower performance than real VPN, but it is easy to setup.
 * Encoding issues can be fixed changing server.py line around 69 encoding ascii -> utf-8 (netstat -rn output parsing)

