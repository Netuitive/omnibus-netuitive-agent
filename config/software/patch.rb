#
# Copyright 2014 Chef Software, Inc.
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

name "patch"
default_version "2.7.5"

version("2.7.5") { source md5: "ed4d5674ef4543b4eb463db168886dc7" }

source url: "http://mirrors.ibiblio.org/gnu/ftp/gnu/patch/patch-#{version}.tar.gz"

relative_path "patch-#{version}"

env = with_standard_compiler_flags(with_embedded_path)

build do
  configure_command = ["./configure",
                       "--prefix=#{install_dir}/embedded"]

  command configure_command.join(" "), env: env
  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
