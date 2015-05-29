
# Copyright 2012-2014 Chef Software, Inc.
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
#

name "lm_sensors"
default_version "3.3.5"

version("3.3.5") { source md5: "da506dedceb41822e64865f6ba34828a" }

source url: "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-#{version}.tar.bz2"

dependency "patch"

relative_path "lm_sensors-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

    patch source: "disable_iconv.patch"

  # command "make " \
  #         " PREFIX=#{install_dir}/embedded", env: env

  make "-j #{workers} PREFIX=#{install_dir}/embedded", env: env
  make "-j #{workers} PREFIX=#{install_dir}/embedded install", env: env
end
