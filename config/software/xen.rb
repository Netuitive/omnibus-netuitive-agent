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
name    "xen"
default_version "4.7.0"

source  :url => "http://bits.xensource.com/oss-xen/release/#{version}/xen-#{version}.tar.gz",
  :md5 => "3aa4e01bf37a3a5bc8572907cb88e649"

relative_path "xen-#{version}"

dependency "glib"
dependency "python"
dependency "libuuid"
dependency "pixman"
dependency "libtool"

env = {
  "PREPEND_INCLUDES" => "#{install_dir}/embedded/include",
  "PREPEND_LIB" => "#{install_dir}/embedded/lib",
  "LD_LIBRARY_PATH" => "#{install_dir}/embedded/lib",
  "glib_LIBS" => "-L#{install_dir}/embedded/ -lglib",
  "glib_CFLAGS" => "-I#{install_dir}/embedded/include",
  "pixman_LIBS" => "-L#{install_dir}/embedded/ -lglib",
  "pixman_CFLAGS" => "-I#{install_dir}/embedded/include",
  "PYTHON" => "#{install_dir}/embedded/bin/python",
  "EXTRA_CFLAGS_XEN_TOOLS" => "-I#{install_dir}/embedded/include",
  "EXTRA_CFLAGS_QEMU_TRADITIONAL" => "-I#{install_dir}/embedded/include",
  "EXTRA_CFLAGS_QEMU_XEN" => "-I#{install_dir}/embedded/include",
  "PATH" => "#{install_dir}/embedded/bin:#{ENV['PATH']}"
}

build do
  command "mkdir -p #{install_dir}/embedded/etc", env: env
  command "./configure --prefix=#{install_dir}/embedded --disable-docs --includedir=#{install_dir}/embedded/include --libdir=#{install_dir}/embedded/lib --sysconfdir=#{install_dir}/embedded/etc --enable-rpath", env: env
  command "make", env: env
  command "make install", env: env
end