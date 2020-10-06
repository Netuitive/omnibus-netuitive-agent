# frozen_string_literal: true

name 'netuitive-event-handler'

build do
  gopath  = "#{build_dir}/gopath"
  pkgroot = "#{gopath}/src/github.com/Netuitive/netuitive-event-handler"

  env = with_standard_compiler_flags(with_embedded_path)
  env['GOPATH'] = gopath

  # GOARCH and GOOS detected automatically

  command 'go get github.com/Netuitive/netuitive-event-handler', env: env

  mkdir "#{pkgroot}/build"

  command 'go build -ldflags="-s -w" -o ./build/netuitive-event-handler main.go',
          cwd: pkgroot,
          env: env

  copy "#{pkgroot}/build/netuitive-event-handler",
       "#{install_dir}/bin/netuitive-event-handler"
  command "chmod 0700 #{install_dir}/bin/netuitive-event-handler"
end
