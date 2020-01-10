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
        sudo apt-get install ansible
    elif [[ $machine == "Mac" ]]; then
        # OSX
        if test ! $(which brew); then
            echo "Installing Homebrew..."
            yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
        fi
        brew install ansible
    fi
fi

sudo ansible-pull -U https://github.com/jmaroeder/ansible-workstation.git
