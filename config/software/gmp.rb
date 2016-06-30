#
# Copyright:: Copyright (c) 2014 Balanced, Inc.
# License:: Apache License, Version 2.0
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
#

name "gmp"
default_version "6.1.1"

source :url => "https://gmplib.org/download/gmp/gmp-#{version}.tar.bz2",
       :md5 => "4c175f86e11eb32d8bf9872ca3a8e11d"

relative_path "#{name}-#{version}"

configure_env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "PATH" => "#{install_dir}/embedded/bin:#{ENV['PATH']}"
}

build do
  # patch source: "patch-aa"

  command "./configure --prefix=#{install_dir}/embedded", env: configure_env
  command "make", env: configure_env
  command "make check"
  command "make install"
end