class iptables {

  package {
    'iptables':
      ensure => installed,
  }

  service {
    'iptables':
      ensure  => running,
      enable  => true,
  }

  file {
    '/etc/sysconfig/iptables':
      ensure  => present,
      content => template('app/iptables/iptables'),
      notify  => Service['iptables'],
      require => Package['iptables'],
  }

}

