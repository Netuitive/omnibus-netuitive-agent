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

name "cacerts"

# Date of the file is in a comment at the start, or in the changelog
default_version "2016.09.14"

version "2016.09.14" do
  source md5: "8d35a5cef6ce28da07867a0712558067"
end


source url: "http://curl.haxx.se/ca/cacert.pem"

relative_path "cacerts-#{version}"

build do
  mkdir "#{install_dir}/embedded/ssl/certs"
  copy "#{project_dir}/cacert.pem", "#{install_dir}/embedded/ssl/certs/cacert.pem"

  # Windows does not support symlinks
  unless windows?
    link "#{install_dir}/embedded/ssl/certs/cacert.pem", "#{install_dir}/embedded/ssl/cert.pem"

    block { File.chmod(0644, "#{install_dir}/embedded/ssl/certs/cacert.pem") }
  end
end
