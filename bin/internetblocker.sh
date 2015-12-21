#!/bin/bash

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

# Hour in the evening to start internet blocking
START_HR=22
# Hour in the morning to turn off internet blocking
END_HR=06

# Force enable internet for emergencies. 0=schedule, 1=no blocking.
# Note: This can take up to 5 minutes to take effect due to cron.
DISABLE_BLOCK=0

##############################################################################
# END OF NORMAL USER CONFIGURATION
##############################################################################

h=`date +%H`
if [ "$#" -ne 1 ]; then
  echo "Syntax: $0 <username to block>"
  exit 1
fi
USER=$1

# Check if the rule is already added to iptables
iptables -C OUTPUT -m owner --uid-owner $USER  -j REJECT &>/dev/null
rule_exist=$?

if [ $DISABLE_BLOCK -eq 0 ] && [[ $h -ge $START_HR || $h -lt $END_HR ]];
then
  # Add the rule
  if [ $rule_exist -ne 0 ]; then
    iptables -A OUTPUT -m owner --uid-owner $USER -j REJECT &>/dev/null
  fi
else
  if [ $rule_exist -eq 0 ]; then
    # Delete the rule
    iptables -D OUTPUT -m owner --uid-owner $USER -j REJECT &>/dev/null
  fi
fi
