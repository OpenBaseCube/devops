#!/bin/bash

set +eu

if [[ $CI != true ]]; then
export PATH=/usr/local/opt/node@10/bin:$PATH
fi

echo "Installing common tools..."
brew bundle install --file=scripts/setup/osx/common.brewfile
npm install yarn@1.16.0
pip3 install mkdocs-material

echo "Installing CI related tools..."
brew bundle install --file=scripts/setup/osx/ci.brewfile
pip3 install ansible-lint    # https://github.com/ansible/ansible-lint
pip3 install docker

echo "WARN removing ansible package (only pip is supported)"
brew remove --force ansible

echo "Installing azure related packages"
pip3 install packaging \
             pywinrm \
             msrestazure \
            'ansible[azure]==2.8'

brew bundle install --file=scripts/setup/osx/azure.brewfile
