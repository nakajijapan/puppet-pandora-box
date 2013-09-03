class nginx {

  package {
    'nginx':
      ensure => latest,
  }

  service {
    'nginx':
      ensure => running,
      enable => true,
      require => Package['nginx'],
  }

  file {
    '/etc/nginx/nginx.conf':
      ensure => present,
      notify => Service['nginx'],
      require => Package['nginx'],
  }

  file {
    '/etc/nginx/conf.d/app.conf':
      ensure => present,
      content => template('app/nginx/app.conf'),
      notify => Service['nginx'],
      require => Package['nginx'],
  }

  file {
    ['/etc/nginx/conf.d/my.conf', '/etc/nginx/conf.d/default.conf']:
      ensure => absent,
      require => Package['nginx'],
  }

}

