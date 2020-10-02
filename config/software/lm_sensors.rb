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
default_version "3.6.0"

version("3.4.0") { source sha256: 'e334c1c2b06f7290e3e66bdae330a5d36054701ffd47a5dde7a06f9a7402cb4e' }
version("3.6.0") { source sha256: '0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197' }

# the original site seems to be dead
# source url: "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-#{version}.tar.bz2"

source url: "https://github.com/lm-sensors/lm-sensors/archive/V#{version.tr('.', '-')}.tar.gz"

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
