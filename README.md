# Ansible Workstation

Consistent, repeatable, idempotent(-ish?) workstation setup

## Prerequisites

### macOS

Before running the below command, sign in to:

- Mac App Store
- iCloud
- Gmail

## Quick start

```console
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/jmaroeder/ansible-workstation/master/install.sh)"
```

## Overview

TODO

## Development

**NOTE** This repository uses submodules for the various roles. Be sure to clone using `--recursive` or run `git submodule update --recursive --init` after cloning, otherwise it will appear to do a lot of nothing!

To check for valid syntax:

```console
$ ansible-playbook --syntax-check local.yml
```

To run `check`:

```console
$ ansible-playbook --check local.yml
```

To run the playbook locally (this keeps a `sudo -v` process re-upping in the background):

```console
$ ./run_playbook.sh
```

To run the playbook locally with special arguments:

```console
$ ./run_playbook.sh --tags "homebrew"
```
