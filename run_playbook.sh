#!/usr/bin/env bash
set -e

# Prompt for creds if necessary
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

set -x
ansible-playbook $@ local.yml
