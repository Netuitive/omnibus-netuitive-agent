#
# Copyright 2013-2014 Chef Software, Inc.
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

name "python"
default_version '2.7.18'

dependency "ncurses"
dependency "zlib"
dependency "openssl"
dependency "bzip2"

version('2.7.18') { source md5: '38c84292658ed4456157195f1c9bcbe1' }
version('2.7.17') { source md5: '27a7919fa8d1364bae766949aaa91a5b' }
version('2.7.16') { source md5: 'f1a2ace631068444831d01485466ece0' }
version('2.7.15') { source md5: '045fb3440219a1f6923fefdabde63342' }

source url: "https://python.org/ftp/python/#{version}/Python-#{version}.tgz"

relative_path "Python-#{version}"

build do
  env = {
    "CFLAGS" => "-I#{install_dir}/embedded/include -O3 -g -pipe",
    "LDFLAGS" => "-Wl,-rpath,#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib",
  }

  command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          " --enable-shared" \
          " --with-dbmliborder=", env: env

  make env: env
  make "install", env: env

  # There exists no configure flag to tell Python to not compile readline
  delete "#{install_dir}/embedded/lib/python2.7/lib-dynload/readline.*"

  # Remove unused extension which is known to make healthchecks fail on CentOS 6
  delete "#{install_dir}/embedded/lib/python2.7/lib-dynload/_bsddb.*"
  delete "#{install_dir}/embedded/lib/python2.7/lib-dynload/_sqlite3.*"
end
