---
title: "shell"
tags: [ "Documentation", "basics" ]
---
# Shells

Dash - fast but limited funcionality, great for scripts.

sh - primitive and ubiquitous.

bash - the standard

elvish - user-friendly, but new, with a full file-browser embedded into the system.

# Login

All shells launch either as login or non-login.  All remote sessions without a GUI withl require authentication, and therefore will be login.

## Login

These shells start by reading /etc/profile then the first of ~/.bash_profile, ~/.bash_login or ~/.profile, and load all given values.

## Non-Login

Non-login shells will read /etc/bash.bashrc and then the ~/.bashrc file.  You can summon the different shell perameters with the command `.`.

For example, so summon the file ~/.bashrc, you can perform:

`. ~/.bashrc`

How the logout is handled depends upon ~/.bash_logout

# Defaults

The default shell config files to create for a new user are under /etc/skel.

# Shellcheck

Run `shellcheck script.sh` on your scripts to check them for mistakes.

