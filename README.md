# Ansible Collection - hdub_tech.infrastructure

A collection of things I commonly use with infrastructure.

> [!WARNING]
> MASSIVE WIP! First collection, just playing around.

## Usage

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

4. Use a collection playbook by providing the entire `namespace.collectionname.playbookname`:

   a. To execute directly:

      ```bash
      ansible-playbook hdub_tech.infrastructure.configure_swap.yml
      ```

   b. To use in another playbook:

      ```yaml
      - ansible.builtin.import_playbook: hdub_tech.infrastructure.configure_swap.yml
      ```

<!-- Links -->
[ansible#76030]: https://github.com/ansible/ansible/issues/76030#issuecomment-942520399
