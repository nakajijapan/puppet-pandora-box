class rbenv::install {

  exec {
    'rbenv::install rbenv':
      command  => "git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv",
      creates  => '/usr/local/rbenv',
      path     => ['/bin', '/usr/bin'],
  }

  file { 
    '/etc/profile.d/rbenv.sh':
      content  => template('rbenv/rbenv.sh'),
      mode     => 755,
      require  => Exec['rbenv::install rbenv'],
  }

  exec {
    'rbenv::install restart':
      command => 'bash /etc/profile.d/rbenv.sh',
      path    => ['/bin', '/usr/bin'],
      require => File["/etc/profile.d/rbenv.sh"],
  }

  exec {
    'rbenv::install ruby-build':
      command  => 'git clone git://github.com/sstephenson/ruby-build.git /usr/local/ruby-build',
      creates  => '/usr/local/ruby-build',
      path     => ['/bin', '/usr/bin'],
      require => Exec['rbenv::install restart'],
  }

  exec {
    'rbenv::install install.sh':
      command  => 'bash install.sh',
      path     => ['/bin', '/usr/bin'],
      cwd      => '/usr/local/ruby-build/',
      require => Exec['rbenv::install ruby-build'],
  }
}
