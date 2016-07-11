#
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

name "libxml2"
default_version "2.9.4"

# license "MIT"
# license_file "COPYING"

dependency "zlib"
dependency "libiconv"
dependency "liblzma"
# dependency "config_guess"

version "2.9.4" do
  source md5: "ae249165c173b1ff386ee8ad676815f5"
end

source url: "ftp://xmlsoft.org/libxml2/libxml2-#{version}.tar.gz"

relative_path "libxml2-#{version}"


env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "PATH" => "#{install_dir}/embedded/bin:#{ENV['PATH']}"
}

build do
  command "./configure --prefix=#{install_dir}/embedded --with-zlib=#{install_dir}/embedded --with-iconv=#{install_dir}/embedded --without-python --without-icu", env: env
  command "make", :env => env
  command "make install", env: env
end