---
title: "Store Host Password"
tags: [ "system", "ansible" ]
---

Make a hosts file with one host (your computer) and one variable, just to test:

```sh
hosts_file=hosts
fort="$(fortune -s | head -1)"
cowvar=cowsays

echo "[cows]
$HOSTNAME $cowvar='${fort}'" > "${hosts_file}"
```

Now ansible should be able to show that '${cowvar}' in a debug message:

```sh
ansible -i "$hosts_file" -m debug -a "msg='{{ ${cowvar} }}'" $HOSTNAME
```

Now to convert the hosts file to yaml, because it's very fashionable:


```sh
yaml_hosts=hosts.yaml
ansible-inventory -i ${hosts_file} --list -y | tee "${yaml_hosts}"
```

Now you should see where the `cowsays` variable goes.
You can safely place your `sudo` password next to that variable goes with `ansible-vault`, which will encrypt just that string.

```sh
pass="your password"
ansible-vault encrypt_string --name='ansible_sudo_pass' "${pass}"
```

If that works, you can add the password, but in `yaml` format.
You can do this manually, or use `gawk` to add ten spaces in front of the lines:

```sh
pass="your password"
ansible-vault encrypt_string --name='ansible_sudo_pass' "${pass}"  | awk '{print "          "  $0}' >> "${yaml_hosts}"
```

Now to check that the inventory file works okay:

```sh
ansible-inventory -i ${yaml_hosts} --list -y
ansible -i "$hosts_file" -m debug -a "msg='{{ ${cowvar} }}'" $HOSTNAME
```

If that works, you can echo the debug message while becoming root.
Just add the `-J` flag so it will ask for the password:

```sh
ansible -i "${yaml_hosts}" -m debug -a "msg='{{ ${cowvar} }}'" $HOSTNAME --become -J
ansible -i "${yaml_hosts}" -m debug -a "msg={{ ansible_sudo_pass }}" $HOSTNAME --become -J
```

Now you can update using Ansible.

For Arch Linux:

```sh
ansible -i "${yaml_hosts}" -m community.general.pacman -a 'upgrade=true update_cache=true' $HOSTNAME --become -J
```

For Debian:

```sh
ansible -i "${yaml_hosts}" -m ansible.builtin.apt -a 'upgrade=full' $HOSTNAME --become -J
```

