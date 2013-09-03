class mysql {

  package {
    'mysql-server':
      ensure => installed,
  }

  service {
    'mysqld':
      ensure  => running,
      enable  => true,
  }
}
