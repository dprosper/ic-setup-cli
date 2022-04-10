#!/bin/bash
# Copyright © 2022 Dimitri Prosper <dimitri_prosper@us.ibm.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -euo pipefail

curl -fsSL https://clis.cloud.ibm.com/install/linux | sh

plugins=$(echo "$INSTALL_PLUGINS" | tr "," "\n")
for plugin in $plugins; do
    pluginversion=$(echo "$plugin" | tr "@" "\n")
    pluginversion=(${pluginversion[@]})
    
    if [ ${#pluginversion[@]} -eq 2 ]; then
        set +o errexit
        ibmcloud plugin install "${pluginversion[0]}" -v "${pluginversion[1]}"
        [ $? -ne 0 ] && echo "Error in installing the $plugin plugin" && exit 1
        set -o errexit
    else
        set +o errexit
        ibmcloud plugin install "${pluginversion[0]}"
        [ $? -ne 0 ] && echo "Error in installing the $plugin plugin" && exit 1
        set -o errexit
    fi

    pluginversion=()
done

set +o errexit
ibmcloud login --apikey "$API_KEY" -r "$REGION" -g "$RESOURCE_GROUP"
[ $? -ne 0 ] && echo "Error during login" && exit 1
set -o errexit

exit 0