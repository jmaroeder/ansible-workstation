# Ansible Workstation

Consistent, repeatable, idempotent(-ish?) workstation setup

## Prerequisites

### macOS

Sign in to the Mac App Store prior to running the below command.

## Quick start

```console
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/jmaroeder/ansible-workstation/master/install.sh)"
```

## Overview

TODO

## Development

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
