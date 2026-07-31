virtualbox
=========

This role will:

- Install [VirtualBox] from the [Oracle apt repo].
- Install [VirtualBox Guest Additions] (bundled with `virtualbox-7.2`).

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

    - name: virtualbox - with defaults
      hosts: linux
      roles:
         - hdub_tech.infrastructure.virtualbox

License
-------

BSL-1.0

Author Information
------------------

H Dub ([@hdub-tech])

<!-- Links -->
[vars/Debian.yml]:            ./vars/Debian.yml
[@hdub-tech]:                 https://github.com/hdub-tech
[Oracle apt repo]:            https://download.virtualbox.org/virtualbox/debian
[VirtualBox]:                 https://www.virtualbox.org/
[VirtualBox Guest Additions]: https://www.virtualbox.org/manual/UserManual.html#guestadditions
