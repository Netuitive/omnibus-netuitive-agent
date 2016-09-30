
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

name "libedit"
default_version "20160618-3.1"

dependency "ncurses"

version("20150325-3.1") { source md5: "43cdb5df3061d78b5e9d59109871b4f6" }
version("20160618-3.1") { source md5: "b6e60f326a3fce91bea1a6fe4700af58" }

source url: "http://thrysoee.dk/editline/libedit-#{version}.tar.gz"

if version == "20141030-3.1"
  # released tar file has name discrepency in folder name for this version
  relative_path "libedit-20141029-3.1"
else
  relative_path "libedit-#{version}"
end

build do
  env = with_standard_compiler_flags(with_embedded_path)

  # The patch is from the FreeBSD ports tree and is for GCC compatibility.
  # http://svnweb.freebsd.org/ports/head/devel/libedit/files/patch-vi.c?annotate=300896
  # if freebsd?
  #   patch source: "freebsd-vi-fix.patch"
  # end

  # if version == "20120601-3.0" && ppc64le?
  #   patch source: "v20120601-3.0.ppc64le-configure.patch"
  # end

  command "./configure" \
          " --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
