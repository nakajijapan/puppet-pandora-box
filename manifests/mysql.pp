class mysql {

  package {
    ['mysql', 
     'mysql-server', 
     'mysql-devel']:
      ensure => installed,
  }

  service {
    'mysqld':
      ensure  => running,
      enable  => true,
  }
}
