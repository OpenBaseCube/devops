#!/bin/bash
# Collect all README files in `docs/` folder
# This simplifies the way we generate the documentation
#
# READMEs for 'roles' are stored in its dedicated 'role' folder
# which show up in the navigation bar
#
# Example: ansible/roles/role/README.md -> docs/role/README.md
#
# All other READMEs are stored in the root folder
# which show up under the entry page
#
# Example: ./README.md -> README.md
#
# In case the README has a sub-type eg. README-azure.md
# the file is stored in its own folder:
#
# Example:
# ansible/README.md -> ansible/README.md
# ansible/README-azure.md -> ansible-azure/README.md

set -eu

find . -name '*.md' -not -path './docs/*' -not -path './vendor/*' -not -path './node_modules/*' |
while IFS= read -r filepath; do
    component_name=$(basename "$(dirname "$filepath")")
    filename=$(basename "$filepath")

    # Require component name
    # If component_name equals '.' it is not a directory and ignored
    if [[ $component_name != "." ]]; then
      # If a README contains a dash it is considered a sub-README
      if [[ $filename =~ - ]]; then
        sub_folder=$(echo "${filename}" | awk 'BEGIN {FS="-"}{print $(2)}')
        sub_folder=$(echo "${sub_folder}" | awk 'BEGIN {FS="."}{print $(1)}')
        component_name="${component_name}-${sub_folder}"
        filename="README.md"
      else
        component_name="${component_name}"
      fi

      rm -fr "./docs/${component_name}"
      mkdir -p "./docs/${component_name}"
      cp -v "$filepath" "./docs/${component_name}/${filename}"
    else
      rm -f "./docs/${filename}"
      cp -v "$filepath" "./docs/${filename}"
    fi
done
