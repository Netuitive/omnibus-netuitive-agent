name 'glib'

default_version '2.49.2'

source url: "http://ftp.gnome.org/pub/gnome/sources/glib/#{version.gsub(/\.(\d+)$/, '')}/glib-#{version}.tar.xz",
       md5: '2683d3f2b8e4675eb04c533e4d39e586'

relative_path "#{name}-#{version}"

dependency 'pkg-config'
dependency 'libffi'
dependency 'pcre'

build do

env = {
    "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
    "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
    "LIBFFI_CFLAGS" => "-I/opt/netuitive-agent/embedded/include",
    "LIBFFI_LIBS" => "-L/opt/netuitive-agent/embedded/ -lffi",
    "PCRE_LIBS" => "-L/opt/netuitive-agent/embedded/ -lpcre",
    "PCRE_CFLAGS" => "-I/opt/netuitive-agent/embedded/include",
    "LD_LIBRARY_PATH" => "/opt/netuitive-agent/embedded/lib",
    "PATH" => "#{install_dir}/embedded/bin:#{ENV['PATH']}"

}

  command "./configure --prefix=#{install_dir}/embedded --with-libiconv --with-threads", env: env
  command "make", :env => env
  command "make install", env: env
end