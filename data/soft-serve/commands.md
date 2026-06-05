---
title: Soft-Serve Commands
tags: 
- data
- git server
- CLI
requires: 
- data/git.md
- networking/ssh.md
---

Some commands to try with an active soft server:

```sh
ssh -p 2222 splint.rs repo list

ssh -p 2222 splint.rs repo info nd6

ssh -p 2222 splint.rs repo tree nd6 /

ssh -p 2222 splint.rs repo info newsraft

ssh -p 2222 splint.rs repo tree newsraft main doc

ssh -p 2222 splint.rs repo tree mkdots all scripts

ssh -p 2222 splint.rs repo -cl cat mkdots all scripts/nb | less -R

```
