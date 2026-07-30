vagrant
=========

This role will:

- Install [hashicorp apt repo].
- Install [vagrant].

Requirements
------------

Currently only supports Debian `ansible_facts.os_family`.

Role Variables
--------------

See [vars/Debian.yml] for the currently non-overrideable variables.

Dependencies
------------

N/A

Example Playbook
----------------

With all defaults:

    - name: vagrant - with defaults
      hosts: linux
      roles:
         - hdub_tech.infrastructure.vagrant

License
-------

MIT

Author Information
------------------

H Dub ([@hdub-tech])

<!-- Links -->
[vars/Debian.yml]:    ./vars/Debian.yml
[@hdub-tech]:         https://github.com/hdub-tech
[hashicorp apt repo]: https://apt.releases.hashicorp.com
[vagrant]:            https://developer.hashicorp.com/vagrant/install
