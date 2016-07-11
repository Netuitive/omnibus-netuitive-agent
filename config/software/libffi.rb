#
# Copyright 2012-2015 Chef Software, Inc.
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

name "libffi"

default_version "3.2.1"


# Is libtool actually necessary? Doesn't configure generate one?
dependency "libtool" unless windows?

version("3.2.1")  { source md5: "83b89587607e3eb65c70d361f13bab43" }

source url: "ftp://sourceware.org/pub/libffi/libffi-#{version}.tar.gz"

relative_path "libffi-#{version}"


env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "PATH" => "#{install_dir}/embedded/bin:#{ENV['PATH']}"
}

build do
  patch source: "libffi-3.2.1-disable-multi-os-directory.patch", plevel: 1, env: env

  command "./configure --prefix=#{install_dir}/embedded --disable-multi-os-directory", env: env
  command "make", :env => env
  command "make install", env: env

  # libffi's default install location of header files is awful...
  copy "#{install_dir}/embedded/lib/libffi-#{version}/include/*", "#{install_dir}/embedded/include"
end


