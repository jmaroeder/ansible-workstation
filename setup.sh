#!/usr/bin/env bash
set -e

if test ! $(which ansible); then
    # Install Ansible

    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     machine=Linux;;
        Darwin*)    machine=Mac;;
        *)          machine="UNKNOWN:${unameOut}"
    esac
    echo "Installing ansible on ${machine}..."

    if [[ $machine == "Linux" ]]; then
        # Ubuntu
        set -x
        sudo apt-get install ansible
    elif [[ $machine == "Mac" ]]; then
        # OSX
        if test ! $(which brew); then
            echo "Installing Homebrew..."
            yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
        fi
        set -x
        brew install ansible
    fi
fi

# Prompt for creds if necessary
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

set -x
ansible-pull --url https://github.com/jmaroeder/ansible-workstation.git
