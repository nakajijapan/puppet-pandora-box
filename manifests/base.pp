class base {
  package {
    [
      'gcc',
      'gcc-c++',
      'kernel-devel',
      'make',
      'emacs',
      'zsh',
      'tree',
      'git',
    ]:
    ensure => installed;
  }

  group {
    'app':
      gid     => 1000,
      ensure  => present;
  }

  user { 
    'app':
      ensure     => present,
      comment    => 'app server',
      home       => '/var/www/app',
      managehome => true,
      shell      => '/bin/bash',
      uid        => 1000,
      gid        => 'app',
      require    => [Group['app']];
  }

  file {
    '/var/www':
      ensure   => directory,
      mode     => 755,
      owner    => root,
      group    => root;
    '/var/www/app/':
      ensure   => directory,
      mode     => 700,
      owner    => app,
      group    => app,
      require  => [User['app'], File['/var/www']];
    '/var/www/app/.ssh':
      ensure   => directory,
      mode     => 700,
      owner    => app,
      group    => app,
      require  => User['app'];
  }
  

}
