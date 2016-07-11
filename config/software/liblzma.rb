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

name "liblzma"
default_version "5.2.2"

# license "Public-Domain"
# license_file "COPYING"

source url: "http://tukaani.org/xz/xz-#{version}.tar.gz",
       md5: "7cf6a8544a7dae8e8106fdf7addfa28c"

relative_path "xz-#{version}"

build do


env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "PATH" => "#{install_dir}/embedded/bin:#{ENV['PATH']}"
}

  command "./configure --prefix=#{install_dir}/embedded --disable-debug --disable-dependency-tracking --disable-doc --disable-scripts", env: env

  make "install", env: env
end