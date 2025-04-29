# Release Notes

## {{ NEXT_RELEASE }}

- Adds `apache2_configure` role
- Adds `configure_apache2.yml` playbook
- Adds a role skeleton
- Adds a FAQ to development documentation
- Updates various lint configuration files
- Adds release workflow

## 1.0.0

<details>

### Release Summary

Initial release.

- Adds config files for gitignore, ansible-lint, ansible-navigator, ansible
  galaxy, molecule and markdownlint
- Adds configure_swap.yml playbook and molecule test
- Adds a prepare_default.yml molecule playbook which will call the driver
  specific prepare playbook (Useful when creating custom prepare.yml files)
- Adds a lint and test github action
- Adds usage and development documentation

</details>
