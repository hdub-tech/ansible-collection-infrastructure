# Ansible Collection - hdub_tech.infrastructure

A collection of things I commonly use with infrastructure.

> [!WARNING]
> MASSIVE WIP! First collection, just playing around. This is not published to Galaxy.

## Table of Contents

- [What's in the box](#whats-in-the-box)
  - [Playbooks](#playbooks)
  - [Roles](#roles)
- [Getting Started](#getting-started)

## What's in the box

> [!NOTE]
> Again, reminder that I'm just collecting things I use in a generic fashion so
> that I can use them again in the future. I know it looks strange other wise.

### Playbooks

| Playbook | Description | Variables |
| --- | --- | --- |
| [`hdub_tech.infrastructure.configure_apache2.yml`] | Uses [hdub_tech.infrastructure.apache2_configure] role to modify apache configs and restart the service | Refer to [`apache2_configure` role README] |
| [`hdub_tech.infrastructure.configure_swap.yml`] | Uses [geerlingguy.swap role] to enable or disable swap on a linux host | Refer to [geerlingguy.swap#role-variables] |

### Roles

| Role | Description | Variables |
| --- | --- | --- |
| [hdub_tech.infrastructure.apache2_configure] | Uses [`ansible.builtin.lineinfile` module] to modify apache configs and restart the service | Refer to [`apache2_configure` role README] |

## Getting Started

1. Add this collection to your project by adding it to YOUR project's `ansible-requirements.yml`:

   ```yaml
   collections:
     - name: git@github.com:hdub-tech/ansible-collection-infrastructure.git
       type: git
       version: 1.0.0
    ```

2. Install the `hdub_tech.infrastructure` collection:

   ```bash
   # From YOUR project / venv
   ansible-galaxy install -r ansible-requirements.yml
   ```

3. Install the `hdub_tech.infrastructure` collection's roles dependencies
   (_NOTE: This is necessary because Ansible does not support installing a
   collection's roles when the collection itself is installed.
   See [ansible#76030]_)

   ```bash
   # From YOUR project / venv, if your collections_path is in your project directory:
   ansible-galaxy install -r collections/ansible_collections/hdub_tech/infrastructure/ansible-requirements.yml
   ```

   ```bash
   # If it is elsewhere, like ~/.ansible/collections enter that path in lieu of $ANSIBLE_COLLECTIONS_PATH
   ansible-galaxy install -r $ANSIBLE_COLLECTIONS_PATH/collections/ansible_collections/hdub_tech/infrastructure/ansible-requirements.yml
   ```

4. Use a collection playbook by providing the entire `namespace.collectionname.playbookname`
   (The following uses `configure_swap.yml` as an example; substitute as necessary):

   a. To execute a playbook directly:

      ```bash
      ansible-playbook -i PATH_TO_YOUR_INVENTORY hdub_tech.infrastructure.configure_swap.yml [--check]
      ```

   b. To execute a playbook using [`ansible-navigator`]:

      ```bash
      ansible-navigator run hdub_tech.infrastructure.configure_swap.yml -i PATH_TO_YOUR_INVENTORY [--check]
      ```

   c. To use a playbook in another playbook:

      ```yaml
      - name: Configure swap
        ansible.builtin.import_playbook: hdub_tech.infrastructure.configure_swap.yml
      ```

5. Use a collection role by providing the entire `namespace.collectionname.rolename`:

   ```yaml
   - hosts: webservers
     roles:
       - hdub_tech.infrastructure.ROLENAME
     vars:
       ROLENAME_VARNAME: VARVALUE
   ```

<!-- Links -->
[`apache2_configure` role README]:                  ./roles/apache2_configure/README.md#role-variables
[hdub_tech.infrastructure.apache2_configure]:       ./roles/apache2_configure/README.md
[`hdub_tech.infrastructure.configure_apache2.yml`]: ./playbooks/configure_apache2.yml
[`hdub_tech.infrastructure.configure_swap.yml`]:    ./playbooks/configure_swap.yml
[ansible#76030]:                       https://github.com/ansible/ansible/issues/76030#issuecomment-942520399
[`ansible.builtin.lineinfile` module]: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/lineinfile_module.html
[`ansible-navigator`]:                 https://ansible.readthedocs.io/projects/navigator
[geerlingguy.swap role]:               https://github.com/geerlingguy/ansible-role-swap
[geerlingguy.swap#role-variables]:     https://github.com/geerlingguy/ansible-role-swap/tree/master?tab=readme-ov-file#role-variables
