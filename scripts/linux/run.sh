#!/bin/bash

set -eu

echo "Installing common tools..."
npm install yarn
pip3 install mkdocs-material

echo "Installing CI related tools..."
pip3 install ansible-lint    # https://github.com/ansible/ansible-lint
pip3 install docker
