---
title: "Ansible Basics"
tags: [ "system", "ansible", "orchestration" ]
requires: [ "ssh", "pass" ]
---

# Start Locally

Start by doing normal actions on the computer.

Say 'hello' to yourself:

```sh
ansible --module-name=ping localhost
```

Ansible takes a lot of information about each machine during setup:

```sh
TMP=$(mktemp)
ansible --module-name=setup localhost  | tee $TMP
less !$
```

If you have `jq`, you can pull out info:

```sh
sed -i 's/.*SUCC.*/{/' $TMP
jq '.ansible_facts.ansible_distribution' < $TMP
```

Upgrade through the package manager.

`packager=apt` (or `pacman` or `xbps`,...)

```sh
packager="$( jq -r '.ansible_facts.ansible_pkg_mgr' < $TMP )"
ansible --module-name=${packager} --args "upgrade=yes" localhost
```

This fails because you have not 'become root'.
So, '*become*'!

```sh
ansible --become -m ${packager} -a "upgrade=true" localhost
```

# Passwords

Typing the password is dull.
You might shift it to the command line:

ansible-playbook t.yaml -i hosts.yaml -e "ansible_become_password=${password}"

...this is also dull.


If you have a password store, like `pass`, you can put that in a script:


```sh
echo "#!/bin/sh
pass $HOSTNAME" > pass.sh

chmod u+x !$

ansible --become --module-name=pacman --args "upgrade=true" localhost
```

# Other Hosts

Find something you can `ssh` into.
Ansible will use your `/etc/hosts` file, and `~/.ssh/config`.

## Make a Hosts File

You can use the `.ini` format:

```sh
echo '[phones]
192.168.0.20' > hosts
```
But everything uses `yaml` nowadays, so may as well be consistent:

```yaml
all:
  children:
    phones:
      children:
        pine:
          ansible_host: 192.168.0.20

```

Check the inventory in yaml format:

```sh
ansible-inventory --list -y -i hosts
```

```sh
ansible-vault view sec.yml --vault-pass-file pass.sh
```

Install `espeak', then make the computer say something:

```sh
ansible --module-name=say --args "msg='testing'" localhost
```
