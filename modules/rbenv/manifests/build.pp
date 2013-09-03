class rbenv::build {

  $rbenv_path = ['/usr/local/rbenv/shims', '/usr/local/rbenv/bin', '/usr/local/bin', '/bin', '/usr/bin']

  file {
    '/usr/local/rbenv/version':
      ensure => present,
      content => $defaultversion,
  }

  exec { 
    "rbenv::build compile":
      timeout     => 0,
      command     => "rbenv install ${defaultversion}",
      path        => $rbenv_path,
      creates     => "/usr/local/rbenv/versions/${defaultversion}",
      logoutput   => true,
      environment => ['RBENV_ROOT=/usr/local/rbenv'],
      require     => File['/usr/local/rbenv/version']
  }

  exec {
    "rbenv::build global":
      command => "rbenv global ${defaultversion}",
      path    => $rbenv_path,
      require => Exec["rbenv::build compile"],
  }

  exec {
    "rbenv::build rehash":
      command => "rbenv rehash",
      path    => $rbenv_path,
      require => Exec["rbenv::build global"],
  }
}
