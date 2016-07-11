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

name "pcre"
default_version "8.39"


dependency "libedit"
dependency "ncurses"

version "8.39" do
  source md5: "26a76d97e04c89fe9ce22ecc1cd0b315"
end


source url: "http://downloads.sourceforge.net/project/pcre/pcre/#{version}/pcre-#{version}.tar.gz"

relative_path "pcre-#{version}"


env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "PATH" => "#{install_dir}/embedded/bin:#{ENV['PATH']}"
}

build do
  command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          " --disable-cpp" \
          " --enable-utf" \
          " --enable-unicode-properties" \
          " --enable-pcretest-libedit", env: env

  command "make", :env => env
  command "make install", env: env
end