# Getting Started

> [!WARNING]
> This assumes an `apt` based system using `podman` to manage containers.

## Table of Contents

- [First time set-up](#first-time-set-up)
- [Daily Use](#daily-use)
- [FAQ](#faq)
  - [Why do you have `defaults` in `vars`?](#why-do-you-have-defaults-in-vars)

## First time set-up

1. Install dependencies:

   a. For running playbooks, etc:

      ```bash
      sudo apt-get install git podman
      ```

   b. For running tests, install the [vagrant] repo by following the
      instructions on their site and then install:

      ```bash
      sudo apt-get install vagrant virtualbox
      ```

> [!NOTE]
> You can use `docker` instead, just note that further documentation may
> exclusively reference `podman` and `ansible-navigator` may not work.

2. Install Python3:

   a. **PREFERRED**: Install and set-up [pyenv] to not taint your system python:

   ```bash
   curl https://pyenv.run | bash

   # The quotes around "EOM" are critical!
   cat <<"EOM" >> ~/.bashrc
   export PYENV_ROOT="$HOME/.pyenv"
   [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
   eval "$(pyenv init - bash)"
   EOM

   # Restart shell for recent changes
   exec "$SHELL"

   # Do this from the top level repo directory so it uses .python-version file!
   pyenv install
   ```

   b. (Not preferred method) Yolo system manager Python method

   ```bash
   sudo apt-get install python3 python3-pip
   ```

3. Set-up a [venv] for the Python dependencies and activate it:

    ```bash
    # Do this from the top level repo directory!
    python -m venv --prompt ".venv $( basename $PWD )" .venv
    source .venv/bin/activate
    ```

4. Install Python dependencies:

    ```bash
    pip install --upgrade pip
    pip install -r python-requirements.txt
    ```

5. Install Ansible dependencies:

   ```bash
   ansible-galaxy install -r ansible-requirements.yml
   ```

6. Confirm you can execute Molecule tests:

   ```bash
   molecule test --all
   ```

7. AS NEEDED: Prep your system for ssh use.

    a. Copy template ssh config from password manager to your host.
    (_TODO Flesh out details_)

    b. Make sure your ssh keys are added to the agent with their passphrase (You
    can do the following only before use, or add it to you `~/.bashrc` file):

    ```bash
    ssh-add ~/.ssh/$USER_$DESC_infra
    ```

8. Ensure `ansible-navigator` works against your localhost (_The following
   commands will only gather information about the setup of your system - no
   changes will be made_).

   ```bash
   # exec subcommand is used to execute one-off commands
   ansible-navigator exec "ansible localhost -m setup"

   # run subcommand is used for executing playbooks
   ansible-navigator run playbooks/test_localhost.yml
   ```

## Daily Use

1. Activate your Python [venv]:

    ```bash
    # Do this from the top level repo directory!
    source .venv/bin/activate
    ```

2. If you didn't add the `ssh-add` statements to your shell config file, add
   your ssh keys to the agent:

    ```bash
    ssh-add ~/.ssh/$USER_$DESC_infra
    ```

## FAQ

This section covers some Q/A on why some things are done the way they are done.

### Why do you have `defaults` in `vars`?

<details><summary><i>TL;DR: Keeping it DRY. Expand for details</i></summary>

You may have noticed the following pattern of madness in the
`apache2_configure` role:

```yaml
# defaults/main.yml
apache2_configure_server_root: "{{ __apache2_configure_server_root }}"
...
```

```yaml
# vars/main.yml
# ============================== START DEFAULTS ============================== #
__apache2_configure_server_root: /etc/apache2
...
# =============================== END DEFAULTS =============================== #
```

I am aware this goes against best practice. However, I prefer [DRY], and not to
need to update a value in multiple places in the event that (light forbid) it
needs to change. By putting my defaults values in `vars`, they can be used in
`defaults/main.yml`, `meta/main.yml` arg_specs, and I can link to the block in
the role README. The only draw back is the variables do not expand when using
`ansible-doc`. They do expand when argument validation fails and frankly I would
rather a user see them when they hit an error rather than the off chance they
are even aware they can use `ansible-doc` for that information. I included a
message in the argument_spec that the values can be found in `vars/main.yml` as
well.
</details>

<!-- Links -->
[DRY]:     https://en.wikipedia.org/wiki/Don%27t_repeat_yourself
[pyenv]:   https://github.com/pyenv/pyenv
[vagrant]: https://developer.hashicorp.com/vagrant/install
[venv]:    https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/#create-and-use-virtual-environments

<!-- markdownlint-configure-file {
  ol-prefix: false
} -->
