#!/bin/bash

##
# Copyright IBM Corporation 2016
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##

set -e

kill `ps aux | grep -F '.build/debug/Kitura-Starter-Bluemix' | grep -v -F 'grep' | awk '{ print $2 }'` || true
echo 'Running Kitura-Starter-Bluemix app in the background.'
.build/debug/Kitura-Starter-Bluemix &
