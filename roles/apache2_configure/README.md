apache2_configure
=================

This role will make the specified regex/string substitutions in the specified
files. It will restart apache2 if changes are made.

> [!TIP]
> You can also run [`ansible-doc`] to see a summary of this role and it's variables.
>
> ```bash
> # From a check-out of this project:
> ansible-doc -t role apache2_configure
> ```
>
> ```bash
> # From your project, where this collection was installed:
> ansible-doc -t role hdub_tech.infrastructure.apache2_configure
> ```
<!-- markdownlint-disable-line MD028 -->
> [!NOTE]
> Yes I know, you can technically use this for any file on the system. But if
> you had access to execute this role, you had access to do it manually
> anyways. I do have issues open to add some enhancements/protections in this
> regard already.

Requirements
------------

Due to [issue #5], this role must be executed with a user which has permission
to modify the apache files and restart the service. So embarassing.

Role Variables
--------------

> [!TIP]
> The real source of truth for default values can be observed in the [`vars/main.yml`]
> file in the `DEFAULTS` block (See the [development FAQ] for the reasoning
> behind using this location). I try to keep docs up to date in lock step with
> code changes, but I might have missed something.

| Variable | Required | Default | Description |
| --- | --- | --- | --- |
| `apache2_configure_regex_modifications` | YES |  | A dictionary of filename keys to an array of from/to regex/string modifications to make to said file. See [Example Playbooks] or `ansible-doc` for a specific example. |
| `apache2_configure_server_root` | No | `/etc/apache2` | The path to the apache2 server root |
| `apache2_configure_backup` | No | `true` | Whether the file being modified should be backed up |
| `apache2_configure_service_name` | No | `apache2` | The name of the apache2 service which will be restarted if any changes are made |

Dependencies
------------

This role is using [`ansible.builtin.lineinfile`] module under the hood. The following
is a reference mapping of the values from this role to the `lineinfile` module.

| hdub_tech.infrastructure.apache2_configure | ansible.builtin.lineinfile |
| --- | --- |
| `apache2_configure_regex_modifications.FILENAME[*].from` (REQUIRED) | `regex` |
| `apache2_configure_regex_modifications.FILENAME[*].to` (REQUIRED) | `line` |
| `apache2_configure_regex_modifications.FILENAME[*].backrefs` (OPTIONAL) | `backrefs` |
| `apache2_configure_regex_modifications.FILENAME[*].backup` (OPTIONAL) | `backup` |

Example Playbooks
-----------------

With defaults and required variables. The following changes the
`MaxRequestWorkers` configuration in `mods-available/mpm_prefork.conf` to `50`,
keeping all spacing intact:

```yaml
- hosts: webservers
  roles:
    - hdub_tech.infrastructure.apache2_configure
  vars:
    apache2_configure_regex_modifications:
      mods-available/mpm_prefork.conf:
        - {
           from:     '(\s+)MaxRequestWorkers(\s+)(\d+)',
           to:       '\g<1>MaxRequestWorkers\g<2>50',
           backrefs: true
          }
```

Overriding defaults with required variables:

```yaml
- hosts: webservers
  roles:
    - hdub_tech.infrastructure.apache2_configure
  vars:
    apache2_configure_server_root:  /etc/httpd
    apache2_configure_backup:       false
    apache2_configure_service_name: httpd
    apache2_configure_regex_modifications:
      mods-available/mpm_prefork.conf:
        - {
           from:     '(\s+)MaxRequestWorkers(\s+)(\d+)',
           to:       '\g<1>MaxRequestWorkers\g<2>50',
           backrefs: true
          }
```

References
----------

- [`ansible.builtin.lineinfile`]
- [Tuning MaxRequestWorkers for Apache]

License
-------

MIT

Author Information
------------------

[@hdub-tech]

<!-- Links -->
[@hdub-tech]:        https://github.com/hdub-tech
[Example Playbooks]: #example-playbooks
[development FAQ]:   ../../docs/development.md#why-do-you-have-defaults-in-vars
[`vars/main.yml`]:   ./vars/main.yml
[`ansible.builtin.lineinfile`]:        https://docs.ansible.com/ansible/latest/collections/ansible/builtin/lineinfile_module.html
[`ansible-doc`]:                       https://docs.ansible.com/ansible/latest/cli/ansible-doc.html
[issue #5]:                            https://github.com/hdub-tech/ansible-collection-infrastructure/issues/5
[Tuning MaxRequestWorkers for Apache]: https://support.cpanel.net/hc/en-us/articles/360047992273-Tuning-MaxRequestWorkers-for-Apache
