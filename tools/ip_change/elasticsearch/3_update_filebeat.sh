#!/bin/bash
#
# Copyright 2019 ABB. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This script updates Elastisearch and Kibana configuration files:
# /etc/elasticsearch/elasticsearch.yml
# /etc/kibana/kibana.yml
#
# Run script:
# sudo ./3_update_filebeat.sh "OLD_IP" "NEW_IP"


# OLD_IP - Address which will be modified
# NEW_IP - Updated value
set -e

OLD_IP=$1
NEW_IP=$2

echo "==== Modifying /etc/filebeat/filebeat.yml for new IP ===="
sed -i "s/$OLD_IP/$NEW_IP/g" "/etc/filebeat/filebeat.yml"
echo "==== /etc/filebeat/filebeat.yml modification completed ===="

echo "==== Restarting Filebeat ===="
systemctl restart filebeat
echo "==== Filebeat restarted ===="
