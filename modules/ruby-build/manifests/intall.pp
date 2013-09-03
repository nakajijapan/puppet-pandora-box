class ruby-build::install {

  exec {
    'ruby-build::install cleanup':
      command => 'rm -rf /usr/local/ruby-build',
     path     => ['/bin', '/usr/bin'],
  }

  exec {
    'ruby-build::install git':
      command  => 'git clone git://github.com/sstephenson/ruby-build.git /usr/local/ruby-build',
      path     => ['/bin', '/usr/bin'],
      require  => Exec['ruby-build::install cleanup'],
  }

  exec {
    'rbenv::install install.sh':
      command  => 'bash install.sh',
      path     => ['/bin', '/usr/bin'],
      cwd      => '/usr/local/ruby-build/',
      require  => Exec['ruby-build::install git'],
  }

}
