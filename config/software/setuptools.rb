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

name "setuptools"
default_version "23.0.0"

dependency "python"

source url: "https://pypi.python.org/packages/45/5e/79ca67a0d6f2f42bfdd9e467ef97398d6ad87ee2fa9c8cdf7caf3ddcab1e/setuptools-#{version}.tar.gz",
       md5: '100a90664040f8ff232fbac02a4c5652'

relative_path "setuptools-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "#{install_dir}/embedded/bin/python setup.py install" \
          " --prefix=#{install_dir}/embedded", env: env
end
