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
default_version "33.1.1"

dependency "python"

source url: "https://pypi.python.org/packages/dc/8c/7c9869454bdc53e72fb87ace63eac39336879eef6f2bf96e946edbf03e90/setuptools-#{version}.zip",
       md5: '7963d41d97b94e450e3f8a217be06ffe'

relative_path "setuptools-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "#{install_dir}/embedded/bin/python setup.py install" \
          " --prefix=#{install_dir}/embedded", env: env
end
