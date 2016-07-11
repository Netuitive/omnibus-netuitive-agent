#
# Copyright 2014, Craig Tracey <craigtracey@gmail.com>
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
name    "libnl"
default_version "3.2.25"

source  :url => "https://www.infradead.org/~tgr/libnl/files/libnl-#{version}.tar.gz",
  :md5 => "03f74d0cd5037cadc8cdfa313bbd195c"

relative_path "libnl-#{version}"


env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "PATH" => "#{install_dir}/embedded/bin:#{ENV['PATH']}"
}

build do
  command "./configure --prefix=#{install_dir}/embedded", env: env
  command "make", :env => env
  command "make install", env: env
end