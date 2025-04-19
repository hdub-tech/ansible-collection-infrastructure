# Getting Started

> [!WARNING]
> This assumes an `apt` based system using `podman` to manage containers.

## First time SET-UP

1. Install system dependencies:

   ```bash
   sudo apt-get install git podman
   ```

> [!NOTE]
> You can use `docker` instead, just note that further documentation may
> exclusively reference `podman` and ansible-navigator may not work.

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

6. Prep your system for ssh use.

    a. Copy template ssh config from password manager to your host.
    (_TODO Flesh out details_)

    b. Make sure your ssh keys are added to the agent with their passphrase (You
    can do the following only before use, or add it to you `~/.bashrc` file):

    ```bash
    ssh-add ~/.ssh/$USER_$DESC_infra
    ```

7. Change to the `ansible` repository subdirectory and ensure
   `ansible-navigator` works against your localhost (_The following commands
   will only gather information about the setup of your system - no changes will
   be made_).

   ```bash
   cd ansible

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

<!-- Links -->
[pyenv]: https://github.com/pyenv/pyenv
[venv]: https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/#create-and-use-virtual-environments

<!-- markdownlint-configure-file {
  MD029: false
} -->