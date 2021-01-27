# frozen_string_literal: true

name 'cleanup'

skip_transitive_dependency_licensing true
license :project_license

build do
  # Remove everything you'd need to compile with (hopefully nobody is using our package to compile!)
  delete "#{install_dir}/embedded/include"
  delete "#{install_dir}/embedded/lib/config_guess"
  delete "#{install_dir}/embedded/lib/pkgconfig"

  # Remove embedded documentation
  delete "#{install_dir}/embedded/man"
  delete "#{install_dir}/embedded/share/doc"
  delete "#{install_dir}/embedded/share/info"
  delete "#{install_dir}/embedded/share/man"

  # Remove OpenSSL CA scripts
  delete "#{install_dir}/emebdded/ssl/misc"

  # Remove docutils scripts
  delete "#{install_dir}/embedded/bin/rst*"

  # Remove libossp-uuid binaries
  delete "#{install_dir}/embedded/bin/uuid"
  delete "#{install_dir}/embedded/bin/uuid-config"

  # Remove misc binaries
  delete "#{install_dir}/embedded/bin/patch"

  # Remove mysql binaries
  %w[
    mysql mysqladmin mysqlbinlog mysqlcheck mysqldump mysqlimport mysqlshow mysqlslap mysqltest mysql_config_editor
    mysql_plugin mysql_upgrade
  ].each do |mysql|
    delete "#{install_dir}/embedded/bin/#{mysql}"
  end

  # Remove ncurses binaries
  %w[
    captoinfo clear infocmp infotocap ncurses6-config ncursesw6-config reset
    tabs tic toe tput tset
  ].each do |ncurses|
    delete "#{install_dir}/embedded/bin/#{ncurses}"
  end

  # Remove openssl binaries
  %w[
    c_rehash openssl
  ].each do |openssl|
    delete "#{install_dir}/embedded/bin/#{openssl}"
  end

  # Remove postgres binaries
  %w[
    clusterdb createdb createlang createuser dropdb droplang dropuser ecpg initdb oid2name pgbench pg_archivecleanup
    pg_basebackup pg_config pg_controldata pg_ctl pg_dump pg_dumpall pg_isready pg_receivexlog pg_recvlogical
    pg_resetxlog pg_restore pg_rewind pg_standby pg_test_fsync pg_test_timing pg_upgrade pg_xlogdump postgres postmaster
    psql reindexdb vacuumdb vacuumlo
  ].each do |pg|
    delete "#{install_dir}/embedded/bin/#{pg}"
  end

  # Remove unnecessary Python scripts
  %w[
    2to3 easy_install easy_install-2.7 idle smtpd.py pydoc wheel
  ].each do |py|
    delete "#{install_dir}/embedded/bin/#{py}"
  end

  # Remove any gitkeep/keep files
  Dir.glob("#{install_dir}/**/{.gitkeep,.keep}").each do |f|
    delete f
  end
end
